<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="../../resources/styles/testCases.css" rel="stylesheet" type="text/css"/>
    <link href="../../resources/styles/main.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
    <script type="text/javascript" src="../../resources/testCases.js"></script>
    <title>Тестирование</title>
</head>
<body onload="prepareTestCases()">

<div class="topBar">
        <span class="right">
            <a href="<c:url value="/"/>">
                <strong>На главную страницу</strong>
            </a>
        </span>
</div>

<div id="wrapper">

    <form name="test-case-form" class="test-cases-form" action="" method="post">

        <div class="header">
            <h1 id="questionTitle">Вопрос</h1>

            <p><label for="questionText"></label><textarea id="questionText" name="comment"></textarea></p>
        </div>

        <div class="content">
            <h1 style="width: auto; display: inline-block">Варианты ответов</h1>

            <h1 id="timer" style="width: auto; display: inline-block"></h1>
            <table id="answers-table" class="hor-minimalist-b">
                <tbody>
                </tbody>
            </table>
        </div>

        <div class="footer">
            <span id="errorText"></span>
            <input type="button" name="NextQuestion" value="Следующий вопрос" class="button"
                   onclick="nextQuestion()"/>
        </div>

    </form>

</div>

</body>
</html>