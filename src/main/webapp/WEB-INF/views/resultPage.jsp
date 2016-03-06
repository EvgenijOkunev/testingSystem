<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <link rel="stylesheet" href="../../resources/styles/main.css" type="text/css"/>
    <link href="../../resources/styles/testCases.css" rel="stylesheet" type="text/css"/>
    <title>Результаты теста</title>
</head>
<body>

<div class="topBar">
        <span class="right">
            <a href="<c:url value="/"/>">
                <strong>На главную страницу</strong>
            </a>
        </span>
</div>
<div id="main-wrapper" style="width: 500px; height: 300px">
    <h2 class="h2_result">Всего вопросов: ${sessionScope.testCasesNumber}</h2>

    <h2 class="h2_result">Правильных ответов: ${sessionScope.rightAnswers}</h2>

    <h2 class="h2_result">Процент правильных
        ответов: ${sessionScope.rightAnswers / sessionScope.testCasesNumber * 100}</h2>
</div>

</body>
</html>
