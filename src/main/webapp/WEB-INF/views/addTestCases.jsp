<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="../../resources/styles/formStyles.css" rel="stylesheet" type="text/css"/>
    <link href="../../resources/styles/tableStyles.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
    <script type="text/javascript" src="../../resources/testCases.js"></script>
    <title>Test Cases</title>
</head>
<body onload="clearPage()">

<div id="wrapper">

    <form name="test-case-form" class="login-form" action="" method="post">

        <div class="header">
            <h1>Вопрос</h1>

            <p><textarea id="questionText" name="comment"></textarea></p>
        </div>

        <div class="content">
            <h1>Варианты ответов</h1>
            <input type="button" name="addAnswerButton" value="Добавить вариант ответа" class="button"
                   onclick="addAnswer(null, '')"/>
            <table id="answers-table" class="hor-minimalist-b">
                <tbody>
                </tbody>
            </table>
        </div>

        <div class="footer">
            <span id="errorText"></span>
            <input type="button" name="SaveAnswerButton" value="Сохранить в базу" class="button"
                   onclick="saveTestCase()"/>
        </div>

    </form>

</div>

</body>
</html>