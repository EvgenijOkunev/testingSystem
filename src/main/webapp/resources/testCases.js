var userAnswers = [];
var testCasesNumber = 0;
var currentTestCase = 0;


function addAnswer(answerId, answerText) {

    // Находим нужную таблицу
    var tbody = document.getElementById('answers-table').getElementsByTagName('TBODY')[0];

    // Создаем строку таблицы и добавляем ее
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
    }

    // Создаем ячейки в вышесозданной строке и добавляем тх
    var td1 = document.createElement("TD");
    td1.appendChild(radio);
    var td2 = document.createElement("TD");
    td2.appendChild(text);

    row.appendChild(td1);
    row.appendChild(td2);

    clearErrorText();

}

function saveTestCase() {

    var questionText = document.getElementById('questionText').value;
    var answers = [];
    var rightAnswer = null;

    var table = document.getElementById('answers-table');
    for (var r = 0; r < table.rows.length; r++) {
        if (table.rows[r].cells[0].childNodes[0].checked) {
            rightAnswer = r;
        }
        answers.push(table.rows[r].cells[1].childNodes[0].value);
    }

    if (rightAnswer == null) {
        document.getElementById('errorText').innerHTML = 'Необходимо выбрать правильный вариант ответа';
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

    $.ajax({
        type: 'GET',
        url: 'prepareTestCases',
        dataType: 'json',
        async: true,
        success: function (result) {
            testCasesNumber = result.testCasesNumber[0];
            getNextTestCase();
        }
    });

}

function nextQuestion() {

    var userAnswerId = processUserAnswer();
    if (userAnswerId == 0) {
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

    if (rightAnswerId == 0) {
        document.getElementById('errorText').innerHTML = 'Необходимо выбрать правильный вариант ответа';
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
        success: function() {
            location.href = "/viewTestResults/";
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







