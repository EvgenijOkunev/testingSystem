package com.example.controller;

import com.example.model.Answer;
import com.example.model.TestCase;
import com.example.service.AnswerService;
import com.example.service.TestCaseService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@Controller
public class TestCaseController {

    @Autowired
    AnswerService answerService;
    @Autowired
    TestCaseService testCaseService;

    @RequestMapping(value = "/saveTestCase", method = RequestMethod.POST)
    public void saveTestCase(HttpServletRequest request) {
        String questionText = request.getParameter("questionText");
        String[] answersParam = request.getParameterValues("answers[]");
        Integer rightAnswerIndex = Integer.parseInt(request.getParameter("rightAnswer"));

        List<Answer> answers = new ArrayList<>();
        for (String anAnswersParam : answersParam) {
            answers.add(answerService.createAnswer(anAnswersParam));
        }

        TestCase testCase = testCaseService.createTestCase(questionText, answers, rightAnswerIndex);
        testCaseService.saveTestCase(testCase);
    }

    @RequestMapping(value = "/prepareTestCases", method = RequestMethod.GET)
    @ResponseBody
    public String prepareTestCases(HttpServletRequest request) {
        int numberOfTestCases = 5;
        List<TestCase> testCases = testCaseService.getTestCases(numberOfTestCases);
        List<Integer> answers = new ArrayList<>();

        JSONObject jsonObj = new JSONObject();
        jsonObj.append("testCasesNumber", testCases.size());

        request.getSession().setAttribute("testCases", testCases);
        request.getSession().setAttribute("answers", answers);
        request.getSession().setAttribute("currentTestCase", 0);
        request.getSession().setAttribute("testCasesNumber", testCases.size());

        return jsonObj.toString();
    }

    @RequestMapping(value = "/getNextTestCase", method = RequestMethod.GET)
    @ResponseBody
    public String getNextTestCase(HttpServletRequest request) {
        List<TestCase> testCases = (List<TestCase>) request.getSession().getAttribute("testCases");
        int currentTestCase = (int) request.getSession().getAttribute("currentTestCase");
        TestCase testCase = testCases.get(currentTestCase);

        List<String> answers = new ArrayList<>();
        List<Integer> answersId = new ArrayList<>();
        testCase.getAnswers().forEach(answer -> {
            answers.add(answer.getText());
            answersId.add(answer.getAnswerId());
        });

        JSONObject jsonObj = new JSONObject();
        jsonObj.append("question", testCase.getQuestion());
        jsonObj.append("answers", answers);
        jsonObj.append("answersId", answersId);

        request.getSession().setAttribute("currentTestCase", ++currentTestCase);

        return jsonObj.toString();
    }

    @RequestMapping(value = "/getTestResults", method = RequestMethod.POST)
    @ResponseBody
    public String getTestResults(HttpServletRequest request) {
        String[] userAnswers = request.getParameterValues("userAnswers[]");
        List<TestCase> testCases = (List<TestCase>) request.getSession().getAttribute("testCases");
        int rightAnswers = 0;
        for (int i = 0; i < testCases.size(); i++) {
            if (testCases.get(i).getRightAnswer().getAnswerId().equals(Integer.parseInt(userAnswers[i]))) {
                rightAnswers++;
            }
        }
        request.getSession().setAttribute("rightAnswers", rightAnswers);
        return "";
    }

}