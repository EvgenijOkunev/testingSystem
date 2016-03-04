package com.example.model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "TEST_CASES")
public class TestCase {

    @Id
    @GeneratedValue
    @Column(name = "test_case_id")
    private Integer testCaseId;

    @Column(name = "question")
    private String question;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "testCase", fetch = FetchType.EAGER)
    private List<Answer> answers;

    @OneToOne
    @JoinColumn(name = "answer_id")
    private Answer rightAnswer;

    public Integer getTestCaseId() {
        return testCaseId;
    }

    public void setTestCaseId(Integer testCaseId) {
        this.testCaseId = testCaseId;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public List<Answer> getAnswers() {
        return answers;
    }

    public void setAnswers(List<Answer> answers) {
        this.answers = answers;
    }

    public Answer getRightAnswer() {
        return rightAnswer;
    }

    public void setRightAnswer(Answer rightAnswer) {
        this.rightAnswer = rightAnswer;
    }

}
