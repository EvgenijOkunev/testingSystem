package com.example.model;

import javax.persistence.*;

@Entity
@Table(name = "ANSWERS")
public class Answer {

    @Id
    @GeneratedValue
    @Column(name = "answer_id")
    private Integer answerId;

    @Column(name = "text")
    private String text;

    @ManyToOne
    @JoinColumn(name = "test_case_id")
    private TestCase testCase;

    public Integer getAnswerId() {
        return answerId;
    }

    public void setAnswerId(Integer answerId) {
        this.answerId = answerId;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public TestCase getTestCase() {
        return testCase;
    }

    public void setTestCase(TestCase testCase) {
        this.testCase = testCase;
    }

}
