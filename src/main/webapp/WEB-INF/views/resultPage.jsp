<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Всего вопросов: ${sessionScope.testCasesNumber}</h2>
<h2>Правильных ответов: ${sessionScope.rightAnswers}</h2>
<h2>Процент правильных ответов: ${sessionScope.rightAnswers / sessionScope.testCasesNumber * 100}</h2>
</body>
</html>
