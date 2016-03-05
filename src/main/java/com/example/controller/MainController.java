package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class MainController {

    @RequestMapping
    public String showMainPage() throws Exception {
        return "mainPage";
    }

    @RequestMapping(value = "/testCreation")
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
