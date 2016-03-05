package com.example.service;

import com.example.model.Answer;
import com.example.model.TestCase;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;

@Service
@Transactional
public class TestCaseService {

    @Autowired
    private SessionFactory sessionFactory;

    public TestCase createTestCase(String question, List<Answer> answers, Integer rightAnswerIndex) {
        TestCase testCase = new TestCase();
        testCase.setQuestion(question);
        testCase.setAnswers(answers);
        testCase.setRightAnswer(answers.get(rightAnswerIndex));
        answers.stream().forEach(answer -> answer.setTestCase(testCase));
        return testCase;
    }

    public void saveTestCase(TestCase testCase) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.save(testCase);
    }

    public TestCase getTestCaseById(Integer id) {
        Session currentSession = sessionFactory.getCurrentSession();
        return (TestCase) currentSession.get(TestCase.class, id);
    }

    public Integer getNumberOfTestCases() {
        Session currentSession = sessionFactory.getCurrentSession();
        HashSet<TestCase> testCases = new HashSet<>();
        testCases.addAll(currentSession.createCriteria(TestCase.class).list());
        return testCases.size();
    }

    public List<TestCase> getTestCases(Integer quantity) {
        ArrayList<TestCase> testCases = new ArrayList<>();
        ArrayList<Integer> list = new ArrayList<>();
        int numberOfTestCases = Math.min(getNumberOfTestCases(), quantity);
        for (int i = 1; i <= getNumberOfTestCases(); i++) {
            list.add(i);
        }

        Collections.shuffle(list);
        for (int i = 0; i < numberOfTestCases; i++) {
            testCases.add(getTestCaseById(list.get(i)));
        }

        return testCases;
    }

}
