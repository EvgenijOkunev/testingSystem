var userAnswers = [];
var testCasesNumber = 0;
var currentTestCase = 0;
var timeForAnswer = 30;
var timeRemaining = 30;

function addAnswer(answerId, answerText) {

    var tbody = document.getElementById('answers-table').getElementsByTagName('TBODY')[0];

    var row = document.createElement("TR");
    tbody.appendChild(row);

    var radio = document.createElement("INPUT");
    if (answerId != null) {
        radio.id = answerId;
    }
    radio.type = 'radio';
    radio.name = "radioAnswer";
    radio.onclick = function () {
        clearErrorText();
    };

    var text = document.createElement("INPUT");
    text.type = "text";
    if (answerText != '') {
        text.value = answerText;
        text.readOnly = true;
    }

    var td1 = document.createElement("TD");
    td1.appendChild(radio);
    var td2 = document.createElement("TD");
    td2.appendChild(text);

    row.appendChild(td1);
    row.appendChild(td2);

    clearErrorText();

}

function saveTestCase() {

    var errorText = document.getElementById('errorText');

    var questionText = document.getElementById('questionText').value;
    if (questionText == '') {
        errorText.innerHTML = 'Необходимо заполнить текст вопроса';
        return false;
    }

    var answers = [];
    var rightAnswer = null;

    var table = document.getElementById('answers-table');
    for (var r = 0; r < table.rows.length; r++) {
        if (table.rows[r].cells[0].childNodes[0].checked) {
            rightAnswer = r;
        }
        var answerText = table.rows[r].cells[1].childNodes[0].value;
        if (answerText == '') {
            errorText.innerHTML = 'Необходимо заполнить все варианты ответа';
            return false;
        }
        answers.push(table.rows[r].cells[1].childNodes[0].value);
    }

    if (rightAnswer == null) {
        errorText.innerHTML = 'Необходимо выбрать правильный вариант ответа';
        return false;
    }

    $.ajax({
        type: 'POST',
        url: '/saveTestCase',
        data: {
            questionText: questionText,
            answers: answers,
            rightAnswer: rightAnswer
        },
        dataType: 'json',
        async: true,
        success: clearPage()
    });

}

function prepareTestCases() {

    clearPage();

    document.getElementById('questionText').readOnly = true;

    $.ajax({
        type: 'GET',
        url: 'prepareTestCases',
        dataType: 'json',
        async: true,
        success: function (result) {
            testCasesNumber = result.testCasesNumber[0];
            getNextTestCase();
            timer();
        }
    });

}

function nextQuestion(timeOut) {

    var userAnswerId = processUserAnswer();
    if (userAnswerId == 0 && !timeOut) {
        document.getElementById('errorText').innerHTML = 'Необходимо выбрать правильный вариант ответа';
        return false;
    }
    else {
        userAnswers.push(userAnswerId);
    }

    if (testCasesNumber == currentTestCase) {
        getTestResults();
    }
    else {
        clearPage();
        getNextTestCase();
    }

}

function getNextTestCase() {

    window.clearTimeout(timer);
    timeRemaining = timeForAnswer;

    $.ajax({
        type: 'GET',
        url: 'getNextTestCase',
        dataType: 'json',
        async: true,
        success: function (result) {
            document.getElementById('questionText').value = result.question;
            var answers = result.answers[0];
            var answersId = result.answersId[0];
            for (var i = 0; i < answers.length; i++) {
                addAnswer(answersId[i], answers[i]);
            }
            currentTestCase++;
            document.getElementById('questionTitle').innerHTML = 'Вопрос ' + currentTestCase + ' из ' + testCasesNumber;
        }
    });

}

function processUserAnswer() {

    var rightAnswerId = 0;

    var table = document.getElementById('answers-table');
    for (var r = 0; r < table.rows.length; r++) {
        if (table.rows[r].cells[0].childNodes[0].checked) {
            rightAnswerId = table.rows[r].cells[0].childNodes[0].id;
        }
    }

    return rightAnswerId;

}

function getTestResults() {

    $.ajax({
        type: 'POST',
        url: '/getTestResults',
        data: {userAnswers: userAnswers},
        dataType: 'json',
        async: true,
        success: function () {
            location.href = "/viewTestResults";
        }
    });

}

function clearPage() {

    document.getElementById('questionText').value = "";

    var table = document.getElementById('answers-table');
    while (table.rows.length > 0) {
        table.deleteRow(0);
    }

    clearErrorText();

}

function clearErrorText() {
    document.getElementById('errorText').innerHTML = '';
}

function timer() {

    document.getElementById('timer').innerHTML = '(осталось ' + timeRemaining.toString() + ' сек. до перехода к след. вопросу)';

    if (timeRemaining == 0) {
        nextQuestion(true);
    }

    timeRemaining--;
    window.setTimeout(timer, 1000);

}







