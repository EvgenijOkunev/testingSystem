package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class MainController {

    @RequestMapping
    public String showMainPage() throws Exception {
        return "mainPage";
    }

    @RequestMapping(value = "/creation")
    public String createTestCases() throws Exception {
        return "addTestCases";
    }

    @RequestMapping(value = "/testPassing")
    public String TestPassing() throws Exception {
        return "testPassing";
    }

    @RequestMapping(value = "/viewTestResults")
    public String testResults() throws Exception {
        return "resultPage";
    }

}
