<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <link rel="stylesheet" href="../../resources/styles/main.css" type="text/css"/>
    <title>Система тестирования</title>
</head>
<body>

<div id="main-wrapper" style="width: 600px; height: 50px">
    <input type="button" name="testPassing" value="Пройти тестирование" class="button" style="float: left"
           onclick='location.href="/testPassing"'/>
    <input type="button" name="addTestCases" value="Добавить тестовые вопросы" class="button" style="float: right"
           onclick='location.href="/testCreation"'/>
</div>

</body>
</html>
