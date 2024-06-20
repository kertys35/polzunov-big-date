import QtQuick
import QtQuick.Layouts
Window {
    width: 1330
    height: 780
    visible: true
    color: "Pink"
    title: qsTr("Hello World")
    property variant questionsString:[
        "Мне нравится заниматься  физкультурой",
        "Люди считают меня отзывчивым и  доброжелательным человеком",
        "Я во всем ценю чистоту и порядок",
        "Меня часто беспокоит мысль, что что-нибудь может случиться",
        "Все новое вызывает у меня  интерес",
        "Если я ничем не занят, то это меня  беспокоит",
        "Я стараюсь проявлять  дружелюбие ко всем людям",
        "Моя комната всегда аккуратно  прибрана",
        "Иногда я расстраиваюсь из-за  пустяков",
        "Мне нравятся неожиданности",
        "Я не могу долго оставаться в  неподвижности",
        "Я тактичен по отношения к  другим людям",
        "Я методичен и пунктуален во  всем",
        "Мои чувства легко уязвимы и  ранимы",
        "Мне не интересно, когда ответ  ясен заранее"
    ];   //вопросы теста
    property int questionNum: 0;                                                                      //номер вопроса
    property int i :0;

    property int score1: 0;                                                                //Экстраверсия – интроверсия
    property int score2: 0;                                                                  //Привязанность – обособленность
    property int score3: 0;                                                                  //Самоконтроль – импульсивность
    property int score4: 0;                                                                 //Эмоциональная устойчивость – эмоциональная неустойчивость
    property int score5: 0;                                                                  //Экспрессивность – практичность

    Text{                                                                                  //вывод номера вопроса на экран пользователя
        id: displayQuestionNum
        x:350
        y:20

        text: "Вопрос "+(questionNum+1) +" из "+questionsString.length
        font.pointSize: 40
    }
    Text{                                                                                 //вывод вопроса на экран пользователя
        id: displayQuestion
        x:350
        y:80

        text: questionsString[questionNum]
        font.pointSize: 30
    }
    Text{                                                                                 //вывод результата на экран пользователя
        id: displayResults1
        visible: false
        x:350
        y:80
        text: "1.Экстраверсия – интроверсия: " + score1
        font.pointSize: 30
    }
    Text{                                                                                 //вывод результата на экран пользователя
        id: displayResults2
        visible: false
        x:350
        y:120
        text: "2.Привязанность – обособленность: " +score2
        font.pointSize: 30
    }
    Text{                                                                                 //вывод результата на экран пользователя
        id: displayResults3
        visible: false
        x:350
        y:160
        text: "3.Самоконтроль – импульсивность: " +score3
        font.pointSize: 30
    }
    Text{                                                                                 //вывод результата на экран пользователя
        id: displayResults4
        visible: false
        x:350
        y:200
        text: "4.Эмоциональная устойчивость - неустойчивость: " +score4
        font.pointSize: 30
    }
    Text{                                                                                 //вывод результата на экран пользователя
        id: displayResults5
        visible: false
        x:350
        y:240
        text: "5.Экспрессивность – практичность: " +score5
        font.pointSize: 30
    }

    Rectangle{                                                                            //кнопка вернуться назад на вопрос или выйти из теста
        visible: true
        id:questionBack
        Rectangle{
            color: if(buttonQuestionBackMouseArea.containsPress){
                       return "Black";
                } else if(buttonQuestionBackMouseArea.containsMouse){
                return "Grey";
                     }
                       else{
                           return "White";
                       }

            width: 150
            height: 75
            Text{
                id:buttonQuestionBack
                anchors.centerIn: parent
                text:"Вернуться назад"
            }
            MouseArea{
                id:buttonQuestionBackMouseArea
                anchors.fill:parent
                hoverEnabled: true
                onClicked: {
                    console.log("Ответ нажат 1");
                    if(questionNum>0)
                    {

                        questionNum--;
                    }
                }
            }
        }
    }

    Row{                                                                            //строка выбора ответов на вопрос
        y:350
        x:300
        spacing: 40
    Rectangle{
        id:buttonDisagreeCompletely                                                 //пользователь полностью несогласен с вопросом
        color: if(buttonDisagreeCompletelyMouseArea.containsPress){
                   return "Black";
            } else if(buttonDisagreeCompletelyMouseArea.containsMouse){
            return "Grey";
                 }
                   else{
                       return "White";
                   }

        width: 150
        height: 75
        Text{
            anchors.centerIn: parent
            text:"Полностью неверно"
        }
        MouseArea{
            id:buttonDisagreeCompletelyMouseArea
            anchors.fill:parent
            hoverEnabled: true
            onClicked: {
                console.log("Ответ нажат 1");
                if(questionNum<questionsString.length-1)
                {
                    switch(questionNum % 5)
                    {
                    case 0:
                        score5+=5;
                        break;
                    case 1:
                        score1+=5;
                        break;
                    case 2:
                        score2+=5;
                        break;
                    case 3:
                        score3+=5;
                        break;
                    case 4:
                        score4+=5;
                        break;
                    default:
                        break;
                    }
                      questionNum++;
                }
                else
                {
                    displayQuestionNum.text="Результат"
                    displayResults1.visible=true
                    displayResults2.visible=true
                    displayResults3.visible=true
                    displayResults4.visible=true
                    displayResults5.visible=true

                    displayQuestion.visible=0;
                    buttonQuestionBack.text="Выйти из теста"
                    buttonDisagreeCompletely.visible=false;
                    buttonDisagreePartially.visible=false;
                    buttonUncertain.visible=false;
                    buttonAgreeCompletely.visible=false;
                    buttonAgreePartially.visible=false;
                }
            }
        }
    }
    Rectangle{                                          //пользователь частично несогласен с вопросом
        id:buttonDisagreePartially
        color: if(buttonDisagreePartiallyMouseArea.containsPress){
                   return "Black";
            } else if(buttonDisagreePartiallyMouseArea.containsMouse){
            return "Grey";
                 }
                   else{
                       return "White";
                   }

        width: 150
        height: 75
        Text{
            anchors.centerIn: parent
            text:"Частично неверно"
        }
        MouseArea{
            id:buttonDisagreePartiallyMouseArea
            anchors.fill:parent
            hoverEnabled: true
            onClicked: {
                console.log("Ответ нажат 2");
                if(questionNum<questionsString.length-1)
                   {
                    switch(questionNum % 5)
                    {
                    case 0:
                        score5+=4;
                        break;
                    case 1:
                        score1+=4;
                        break;
                    case 2:
                        score2+=4;
                        break;
                    case 3:
                        score3+=4;
                        break;
                    case 4:
                        score4+=4;
                        break;
                    default:
                        break;
                    }
                         questionNum++;
                   }
                else
                {
                    displayQuestionNum.text="Результат"
                    displayResults1.visible=true
                    displayResults2.visible=true
                    displayResults3.visible=true
                    displayResults4.visible=true
                    displayResults5.visible=true

                    displayQuestion.visible=0;
                    buttonQuestionBack.text="Выйти из теста"
                    buttonDisagreeCompletely.visible=false;
                    buttonDisagreePartially.visible=false;
                    buttonUncertain.visible=false;
                    buttonAgreeCompletely.visible=false;
                    buttonAgreePartially.visible=false;

                }
            }
        }
    }
    Rectangle{                                                                     //пользователь неуверен со своей позицией по вопросу
        id:buttonUncertain
        color: if(buttonUncertainMouseArea.containsPress){
                   return "Black";
            } else if(buttonUncertainMouseArea.containsMouse){
            return "Grey";
                 }
                   else{
                       return "White";
                   }

        width: 150
        height: 75
        Text{
            anchors.centerIn: parent
            text:"Неуверен"
        }
        MouseArea{
            id:buttonUncertainMouseArea
            anchors.fill:parent
            hoverEnabled: true
            onClicked: {
                console.log("Ответ нажат 3");
                if(questionNum<questionsString.length-1)
                {
                    switch(questionNum % 5)
                    {
                    case 0:
                        score5+=3;
                        break;
                    case 1:
                        score1+=3;
                        break;
                    case 2:
                        score2+=3;
                        break;
                    case 3:
                        score3+=3;
                        break;
                    case 4:
                        score4+=3;
                        break;
                    default:
                        break;
                    }
                      questionNum++;
                }
                else
                {
                    displayQuestionNum.text="Результат"
                    displayResults1.visible=true
                    displayResults2.visible=true
                    displayResults3.visible=true
                    displayResults4.visible=true
                    displayResults5.visible=true

                    displayQuestion.visible=0;
                    buttonQuestionBack.text="Выйти из теста"
                    buttonDisagreeCompletely.visible=false;
                    buttonDisagreePartially.visible=false;
                    buttonUncertain.visible=false;
                    buttonAgreeCompletely.visible=false;
                    buttonAgreePartially.visible=false;
                }
            }
        }
    }
    Rectangle{                                                                          //пользователь частично согласен с вопросом
        id:buttonAgreePartially
        color: if(buttonAgreePartiallyMouseArea.containsPress){
                   return "Black";
            } else if(buttonAgreePartiallyMouseArea.containsMouse){
            return "Grey";
                 }
                   else{
                       return "White";
                   }

        width: 150
        height: 75
        Text{
            anchors.centerIn: parent
            text:"Частично верно"
        }
        MouseArea{
            id:buttonAgreePartiallyMouseArea
            anchors.fill:parent
            hoverEnabled: true
            onClicked: {
                console.log("Ответ нажат 4");
                if(questionNum<questionsString.length-1)
                {

                    switch(questionNum % 5)
                    {
                    case 0:
                        score5+=2;
                        break;
                    case 1:
                        score1+=2;
                        break;
                    case 2:
                        score2+=2;
                        break;
                    case 3:
                        score3+=2;
                        break;
                    case 4:
                        score4+=2;
                        break;
                    default:
                        break;
                    }
                    questionNum++;
                }
                else
                {
                    displayQuestionNum.text="Результат"
                    displayResults1.visible=true
                    displayResults2.visible=true
                    displayResults3.visible=true
                    displayResults4.visible=true
                    displayResults5.visible=true

                    displayQuestion.visible=0;
                    buttonQuestionBack.text="Выйти из теста"
                    buttonDisagreeCompletely.visible=false;
                    buttonDisagreePartially.visible=false;
                    buttonUncertain.visible=false;
                    buttonAgreeCompletely.visible=false;
                    buttonAgreePartially.visible=false;
                }
            }
        }
    }
    Rectangle{                                                                              //пользователь полностью согласен с вопросом
        id:buttonAgreeCompletely
        color: if(buttonAgreeCompletelyMouseArea.containsPress){
                   return "Black";
            } else if(buttonAgreeCompletelyMouseArea.containsMouse){
            return "Grey";
                 }
                   else{
                       return "White";
                   }

        width: 150
        height: 75
        Text{
            anchors.centerIn: parent
            text:"Полностью верно"
        }
        MouseArea{
            id:buttonAgreeCompletelyMouseArea
            anchors.fill:parent
            hoverEnabled: true
            onClicked: {
                console.log("Ответ нажат 5");
                if(questionNum<questionsString.length-1)
                {
                    switch(questionNum % 5)
                    {
                    case 0:
                        score5+=1;
                        break;
                    case 1:
                        score1+=1;
                        break;
                    case 2:
                        score2+=1;
                        break;
                    case 3:
                        score3+=1;
                        break;
                    case 4:
                        score4+=1;
                        break;
                    default:
                        break;
                    }
                      questionNum++;
                }
                else
                {
                    displayQuestionNum.text="Результат"
                    displayResults1.visible=true
                    displayResults2.visible=true
                    displayResults3.visible=true
                    displayResults4.visible=true
                    displayResults5.visible=true

                    displayQuestion.visible=0;
                    buttonQuestionBack.text="Выйти из теста"
                    buttonDisagreeCompletely.visible=false;
                    buttonDisagreePartially.visible=false;
                    buttonUncertain.visible=false;
                    buttonAgreeCompletely.visible=false;
                    buttonAgreePartially.visible=false;
                }
            }
        }
    }
}
}
