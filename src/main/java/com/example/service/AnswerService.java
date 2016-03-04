package com.example.service;

import com.example.model.Answer;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AnswerService {

    @Autowired
    private SessionFactory sessionFactory;

    public Answer createAnswer(String text) {

        Answer answer = new Answer();
        answer.setText(text);

        return answer;

    }

}
