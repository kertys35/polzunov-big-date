import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window  {
    id:testScreen
    width: 1330
    height: 720
    color: "Pink"
    visible: true
    property variant questionsString:[                                                           //вопросы теста
        ""
    ];
    property variant resultExplanation: [                                                           //Объяснение результата
        ""
    ]

    property int user_id: 1;
    property int questionNum: 0;                                                                      //номер вопроса
    property string scoreExplanation: ""                                                                 //Объясненик кол-ва баллов

    property int i:0;
    property int screenMenu: 1;                                                           //Флаг меню польззователя
    property int resultScreen:0;                                                          //Флаг окна результатов

    property int score1: 0;                                                                //Экстраверсия – интроверсия
    property int score11: 0;                                                               //Активность - пассивность
    property int score12: 0;                                                               //Доминирование-подчиненность
    property int score13: 0;                                                               //Общительность - замкнутость
    property int score14: 0;                                                               //Поиск впечатлений - избегание
    property int score15: 0;                                                               //Привлечение внимания - избегание

    property int score2: 0;                                                                 //Привязанность – обособленность
    property int score21: 0;                                                                //Теплота - равнодушие
    property int score22: 0;                                                                //Сотрудничество - соперничество
    property int score23: 0;                                                                //Доверчивость - подозрительност
    property int score24: 0;                                                                //Понимание - непонимание
    property int score25: 0;                                                                //Уважение других - самоуважение

    property int score3: 0;                                                                //Самоконтроль – импульсивность
    property int score31: 0;                                                               //Аккуратность - неаккуратность
    property int score32: 0;                                                               //Настойчивость - слабоволие
    property int score33: 0;                                                               //Ответственность - безответственность
    property int score34: 0;                                                               //Самоконтроль - импульсивность
    property int score35: 0;                                                               //Предусмотрительность - беспечность

    property int score4: 0;                                                                //Эмоциональная устойчивость – эмоциональная неустойчивость
    property int score41: 0;                                                               //Тревожность - беззаботность
    property int score42: 0;                                                               //Напряженность - расслабленность
    property int score43: 0;                                                               //Депрессивность - эмоциональная комфортность
    property int score44: 0;                                                               //Самокритика - самодостаточность
    property int score45: 0;                                                               //Эмоциональная лабильность - эмоциональная стабильность

    property int score5: 0;                                                                //Экспрессивность – практичность
    property int score51: 0;                                                               //Любопытство - консерватизм
    property int score52: 0;                                                               //Мечтательность - реалистичность
    property int score53: 0;                                                               //Артистичность - неартистичность
    property int score54: 0;                                                               //Сензитивность - нечувствительность
    property int score55: 0;                                                               //Пластичность - ригидность

    property int lastValue: 0;                                                            //Последнее добавленное значение к счету
    property int lastScore: 0;                                                            //Последний измененнный фактор в тесте
    property int lastSubScore: 0;                                                            //Последний измененнный дополнительный фактор в тесте

    property variant questionValue:[];                                                                 //Массив с результатами ответов
    property variant questionScore:[];                                                              //Массив с основным факторами, которые были увеличены из-за ответов
    property variant questionSubScore:[];                                                           //Массив с дополнительными факторами, которые были увеличены из-за ответов

    property int testEnd: 0;                                                            //Флаг окончания теста

ScrollView{
anchors.fill:parent
    Column{
        id:textColumn
        spacing: 20

        Rectangle{                                                                            //кнопка вернуться назад на вопрос или выйти из теста
            visible: false
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

                width: 125
                height: 70
                Text{
                    id:buttonQuestionBack
                    anchors.centerIn: parent
                    text:"Выйти"
                }
                MouseArea{
                    id:buttonQuestionBackMouseArea
                    anchors.fill:parent
                    hoverEnabled: true

                    onClicked: {
                        if(questionNum > 0 && testEnd==0)       //Вернуться на вопрос назад
                        {
                            if(questionNum==1)
                                buttonQuestionBack.text="Выйти из теста";
                            if(questionNum >= 1 && resultScreen==0)
                            {
                                lastValue=questionValue.pop();
                                lastSubScore=questionSubScore.pop();
                                lastScore=questionScore.pop();
                                switch(lastScore)                                   //Вычитает баллы за прошлый вопрос
                                {
                                case 1:
                                    switch(lastSubScore)
                                    {
                                    case 1:
                                        score11-=lastValue;
                                        break;
                                    case 2:
                                        score12-=lastValue
                                        break;
                                    case 3:
                                        score13-=lastValue
                                        break;
                                    case 4:
                                        score14-=lastValue
                                        break;
                                    case 5:
                                        score15-=lastValue
                                        break;
                                    default:
                                        break;
                                    }

                                    break;
                                case 2:
                                    switch(lastSubScore)
                                    {
                                    case 1:
                                        score21-=lastValue;
                                        break;
                                    case 2:
                                        score22-=lastValue
                                        break;
                                    case 3:
                                        score23-=lastValue
                                        break;
                                    case 4:
                                        score24-=lastValue
                                        break;
                                    case 5:
                                        score25-=lastValue
                                        break;
                                    default:
                                        break;
                                    }
                                    break;
                                case 3:
                                    switch(lastSubScore)
                                    {
                                    case 1:
                                        score31-=lastValue;
                                        break;
                                    case 2:
                                        score32-=lastValue
                                        break;
                                    case 3:
                                        score33-=lastValue
                                        break;
                                    case 4:
                                        score34-=lastValue
                                        break;
                                    case 5:
                                        score35-=lastValue
                                        break;
                                    default:
                                        break;
                                    }
                                    break;
                                case 4:
                                    switch(lastSubScore)
                                    {
                                    case 1:
                                        score41-=lastValue;
                                        break;
                                    case 2:
                                        score42-=lastValue
                                        break;
                                    case 3:
                                        score43-=lastValue
                                        break;
                                    case 4:
                                        score44-=lastValue
                                        break;
                                    case 5:
                                        score45-=lastValue
                                        break;
                                    default:
                                        break;
                                    }
                                    break;
                                case 5:
                                    switch(lastSubScore)
                                    {
                                    case 1:
                                        score51-=lastValue;
                                        break;
                                    case 2:
                                        score52-=lastValue
                                        break;
                                    case 3:
                                        score53-=lastValue
                                        break;
                                    case 4:
                                        score54-=lastValue
                                        break;
                                    case 5:
                                        score55-=lastValue
                                        break;
                                    default:
                                        break;
                                    }
                                    break;

                                default:
                                    break;
                                }
                            }
                            questionNum--;
                        }

                        else if((questionNum == 0 || testEnd) && screenMenu==0 && resultScreen==0)                //Выйти из теста
                        {
                            testEnd=0;
                            questionNum=0
                            questionBack.visible=false;
                            screenMenu=1;
                            displayTextMenu.visible=true;
                            buttonStart.visible=true;
                            buttonResult.visible=true;
                            displayResult.visible=false;                          //Скрытие результатов теста

                            displayQuestion.visible=false;
                            graphQuestionNum.visible=false;
                            buttonRow.visible=false;



                            graphScore1.visible=false;
                            graphScore11.visible=false;
                            graphScore12.visible=false;
                            graphScore13.visible=false;
                            graphScore14.visible=false;
                            graphScore15.visible=false;

                            graphScore2.visible=false;
                            graphScore21.visible=false;
                            graphScore22.visible=false;
                            graphScore23.visible=false;
                            graphScore24.visible=false;
                            graphScore25.visible=false;

                            graphScore3.visible=false;
                            graphScore31.visible=false;
                            graphScore32.visible=false;
                            graphScore33.visible=false;
                            graphScore34.visible=false;
                            graphScore35.visible=false;

                            graphScore4.visible=false;
                            graphScore41.visible=false;
                            graphScore42.visible=false;
                            graphScore43.visible=false;
                            graphScore44.visible=false;
                            graphScore45.visible=false;

                            graphScore5.visible=false;
                            graphScore51.visible=false;
                            graphScore52.visible=false;
                            graphScore53.visible=false;
                            graphScore54.visible=false;
                            graphScore55.visible=false;

                            displayExplanationScore.visible=false;
                            displayExplanation1Row.visible=false;
                            displayExplanation2Row.visible=false;
                            displayExplanation3Row.visible=false;
                            displayExplanation4Row.visible=false;
                            displayExplanation5Row.visible=false;
                        }
                        else if(resultScreen)                       //Вернуться из экрана тестов
                        {
                            screenMenu=1;
                            resultScreen=0;

                            questionBack.visible=false;
                            noResult.visible=false;

                            buttonStart.visible=true;
                            buttonResult.visible=true;
                            displayTextMenu.visible=true;

                            displayResult.visible=false;                          //Скрытие результатов теста

                            graphScore1.visible=false;
                            graphScore11.visible=false;
                            graphScore12.visible=false;
                            graphScore13.visible=false;
                            graphScore14.visible=false;
                            graphScore15.visible=false;

                            graphScore2.visible=false;
                            graphScore21.visible=false;
                            graphScore22.visible=false;
                            graphScore23.visible=false;
                            graphScore24.visible=false;
                            graphScore25.visible=false;

                            graphScore3.visible=false;
                            graphScore31.visible=false;
                            graphScore32.visible=false;
                            graphScore33.visible=false;
                            graphScore34.visible=false;
                            graphScore35.visible=false;

                            graphScore4.visible=false;
                            graphScore41.visible=false;
                            graphScore42.visible=false;
                            graphScore43.visible=false;
                            graphScore44.visible=false;
                            graphScore45.visible=false;

                            graphScore5.visible=false;
                            graphScore51.visible=false;
                            graphScore52.visible=false;
                            graphScore53.visible=false;
                            graphScore54.visible=false;
                            graphScore55.visible=false;
                        }
                    }
                }
            }
        }

        Row{                                                                            //Вывод  информации о вопросах теста
            id: graphQuestionNum
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: false
            spacing: 10
            x:150
            y:20
            Text{                                                                                  //вывод номера вопроса на экран пользователя
                id: displayQuestionNum
                text: "Вопрос "+(questionNum+1) +" из "+questionsString.length
                font.pointSize: 30
            }
            Row{                                                                        //Вывод  графической информации о прогрессе теста
                y:14
                Repeater{
                    model: (questionNum)
                    Rectangle{
                        width:(200/questionsString.length)
                        height:30
                        color: if((questionNum+1) >= 0 && (questionNum+1)<= 25)
                                   return "light green";
                                else if((questionNum+1)>= 26 && (questionNum+1) <= 50)
                                   return "green";
                                else if((questionNum+1) >= 51 && (questionNum+1) <= 75)
                                   return "dark green";
                    }
                }
                Repeater{
                    model: (questionsString.length - (questionNum))
                    Rectangle{
                        width:(200/questionsString.length)
                        height:30
                        color:"black"
                    }
                }
            }
        }
        Text{
            id:displayTextMenu
            x:115
            y:140
            visible:true
            text:"Тест политических взглядов"
            font.pointSize: 40

        }

        Rectangle{                                                                            //кнопка начала теста
            id:buttonStart
            x:250
            y:180
                color: if(buttonStartMouseArea.containsPress){
                           return "Dark green";
                    } else if(buttonStartMouseArea.containsMouse){
                    return "light green";
                         }
                           else{
                               return "White";
                           }

                width: 250
                height: 100
                Text{
                    anchors.centerIn: parent
                    text:"Начать тест"
                }
                MouseArea{
                    id:buttonStartMouseArea
                    anchors.fill:parent
                    hoverEnabled: true
                    onClicked: {
                        questionBack.visible=true;
                        displayTextMenu.visible=false;
                        buttonStart.visible=false;
                        buttonResult.visible=false;


                        displayQuestion.visible=true;
                        displayQuestionNum.visible=true;
                        graphQuestionNum.visible=true;

                        buttonRow.visible=true;

                        buttonQuestionBack.text="Выйти из теста"
                        screenMenu=0;

                        questionNum=0;  //Обнуление счёта
                        score1=0;
                        score11=0;
                        score12=0;
                        score13=0;
                        score14=0;
                        score15=0;

                        score2=0;
                        score21=0;
                        score22=0;
                        score23=0;
                        score24=0;
                        score25=0;

                        score3=0;
                        score31=0;
                        score32=0;
                        score33=0;
                        score34=0;
                        score35=0;

                        score4=0;
                        score41=0;
                        score42=0;
                        score43=0;
                        score44=0;
                        score45=0;

                        score5=0;
                        score51=0;
                        score52=0;
                        score53=0;
                        score54=0;
                        score55=0;

                        lastValue=0;
                        lastSubScore=0;
                        lastScore=0;

                    }
                }
            }

        Text{                                                                                 //Текст при отсутствии результатов
            id: noResult
            x:150
            y:80
            visible:false
            text: "Нет результатов теста."
            font.pointSize: 20
        }

        Timer{                                                                              //Таймер задержки до ответа сервера
            id: serverTimer
            interval: 2000
            running: true
            onTriggered:
            {
                database.get_results(user_id);
            }
        }

        Rectangle{                                                                            //кнопка просмотра результатов
            id:buttonResult
            x:250
            y:180
                color: if(buttonResultMouseArea.containsPress){
                           return "Dark green";
                    } else if(buttonResultMouseArea.containsMouse){
                    return "light green";
                         }
                           else{
                               return "White";
                           }

                width: 250
                height: 100
                Text{
                    anchors.centerIn: parent
                    text:"Результаты теста"
                }
                MouseArea{
                    id:buttonResultMouseArea
                    anchors.fill:parent
                    hoverEnabled: true
                    onHoveredChanged: {
                        database.get_results(user_id);

                    }

                    onClicked: {
                        resultScreen=1;
                        questionBack.visible=true;
                        displayTextMenu.visible=false;
                        buttonStart.visible=false;
                        buttonResult.visible=false;

                        buttonQuestionBack.text="Выйти в меню"
                        noResult.visible = true;                           //Отображение сообщения об отсутствии данных о результатах теста

                        if(database.checkID())                           //Получить данные пользователя из БД
                        {
                            score1=database.get_results1();
                            score2=database.get_results2();
                            score3=database.get_results3();
                            score4=database.get_results4();
                            score5=database.get_results5();
                        }
                        if(score1 > 0 && score2 > 0 && score3 > 0 && score4 > 0 && score5 > 0)
                        {
                            displayResult.visible=true;                          //Отображение результатов теста

                            graphScore1.visible=true;

                            graphScore2.visible=true;

                            graphScore3.visible=true;

                            graphScore4.visible=true;

                            graphScore5.visible=true;

                            noResult.visible=false;
                        }
                    }
                }
            }

        Text{                                                                                 //вывод вопроса на экран пользователя
            id: displayQuestion
            x:150
            y:80
            visible:false
            text: questionsString[questionNum]
            font.pointSize: 20
        }
        Text{                                                                                  //вывод результата на экран пользователя
            id: displayResult
            x:150
            y:10
            visible: false
            text: "Результаты теста:                                                  "
            font.pointSize: 40
        }

        Row{                                                                            //Вывод  информации о результатах теста
            id: graphScore1
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: false
            spacing: 10
            x:100
            Text{                                                                                 //вывод результата на экран пользователя
                id: displayResults1
                 y: -10
                visible: true
                text: "1. Экстраверсия – интроверсия: " + score1 +"/75"
                font.pointSize: 20
            }
            Row{                                                                        //Вывод  графической информации о результатах теста
                Repeater{
                    model: score1
                    Rectangle{
                        width:(300/questionsString.length)
                        height:20
                        color: if(score1 >= 0 && score1 <= 40)
                                   return "red";
                                else if(score1 >= 41 && score1 <= 50)
                                   return "yellow";
                                else if(score1 >= 51 && score1 <= 75)
                                   return "green";
                    }
                }
                Repeater{
                    model: (questionsString.length - score1)
                    Rectangle{
                        width:(300/questionsString.length)
                        height:20
                        color:"black"
                    }
                }
            }
        }

        Row{                                                                            //Вывод  информации о доп. параметрах результата теста
            id: graphScore11
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: false
            spacing: 10
            x:100
            Text{                                                                                 //вывод результата на экран пользователя
                id: displayResults11
                 y: -10
                visible: true
                text: "1.1. Активность - пассивность: " + score11 +"/15"
                font.pointSize: 15
            }
            Row{                                                                        //Вывод  графической информации о доп. параметрах результата теста
                Repeater{
                    model: score11
                    Rectangle{
                        width:15
                        height:15
                        color: if(score11 >= 0 && score11 <= 6)
                                   return "red";
                                else if(score11 >= 7 && score11 <= 11)
                                   return "yellow";
                                else if(score11 >= 12 && score11 <= 15)
                                   return "green";
                    }
                }
                Repeater{
                    model: (15 - score11)
                    Rectangle{
                        width:15
                        height:15
                        color:"black"
                    }
                }
            }
        }

        Row{                                                                            //Вывод  информации о доп. параметрах результата теста
            id: graphScore12
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: false
            spacing: 10
            x:100
            Text{                                                                                 //вывод результата на экран пользователя
                id: displayResults12
                 y: -10
                visible: true
                text: "1.2. Экстраверсия – интроверсия: " + score12 +"/15"
                font.pointSize: 15
            }
            Row{                                                                        //Вывод  графической информации о доп. параметрах результата теста
                Repeater{
                    model: score12
                    Rectangle{
                        width:15
                        height:15
                        color: if(score12 >= 0 && score12 <= 6)
                                   return "red";
                                else if(score12 >= 7 && score12 <= 11)
                                   return "yellow";
                                else if(score12 >= 12 && score12 <= 15)
                                   return "green";
                    }
                }
                Repeater{
                    model: (15 - score12)
                    Rectangle{
                        width:15
                        height:15
                        color:"black"
                    }
                }
            }
        }

        Row{                                                                            //Вывод  информации о доп. параметрах результата теста
            id: graphScore13
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: false
            spacing: 10
            x:100
            Text{                                                                                 //вывод результата на экран пользователя
                id: displayResults13
                 y: -10
                visible: true
                text: "1.3. Экстраверсия – интроверсия: " + score13+"/15"
                font.pointSize: 15
            }
            Row{                                                                        //Вывод  графической информации о доп. параметрах результата теста
                Repeater{
                    model: score13
                    Rectangle{
                        width:15
                        height:15
                        color: if(score13 >= 0 && score13 <= 6)
                                   return "red";
                                else if(score13 >= 7 && score13 <= 11)
                                   return "yellow";
                                else if(score13 >= 12 && score13 <= 15)
                                   return "green";
                    }
                }
                Repeater{
                    model: (15 - score13)
                    Rectangle{
                        width:15
                        height:15
                        color:"black"
                    }
                }
            }
        }

        Row{                                                                            //Вывод  информации о доп. параметрах результата теста
            id: graphScore14
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: false
            spacing: 10
            x:100
            Text{                                                                                 //вывод результата на экран пользователя
                id: displayResults14
                 y: -10
                visible: true
                text: "1.4. Экстраверсия – интроверсия: " + score14 +"/15"
                font.pointSize: 15
            }
            Row{                                                                        //Вывод  графической информации о доп. параметрах результата теста
                Repeater{
                    model: score14
                    Rectangle{
                        width:15
                        height:15
                        color: if(score14 >= 0 && score14 <= 6)
                                   return "red";
                                else if(score14 >= 7 && score14 <= 11)
                                   return "yellow";
                                else if(score14 >= 12 && score14 <= 15)
                                   return "green";
                    }
                }
                Repeater{
                    model: (15 - score14)
                    Rectangle{
                        width:15
                        height:15
                        color:"black"
                    }
                }
            }
        }

        Row{                                                                            //Вывод  информации о доп. параметрах результата теста
            id: graphScore15
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: false
            spacing: 10
            x:100
            Text{                                                                                 //вывод результата на экран пользователя
                id: displayResults15
                 y: -10
                visible: true
                text: "1.5. Экстраверсия – интроверсия: " + score15 +"/15"
                font.pointSize: 15
            }
            Row{                                                                        //Вывод  графической информации о доп. параметрах результата теста
                Repeater{
                    model: score15
                    Rectangle{
                        width:15
                        height:15
                        color: if(score15 >= 0 && score15 <= 6)
                                   return "red";
                                else if(score15 >= 7 && score15 <= 11)
                                   return "yellow";
                                else if(score15 >= 12 && score15 <= 15)
                                   return "green";
                    }
                }
                Repeater{
                    model: (15 - score15)
                    Rectangle{
                        width:15
                        height:15
                        color:"black"
                    }
                }
            }
        }
        Text{                                                                                 //вывод объяснения результата пользователя
            id: displayExplanation1
            visible: false
            x:100
            y:120
            text: ""
            font.pointSize: 15
        }

        Row{                                                                            //Вывод  информации о результатах теста
            id: graphScore2
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: false
            spacing: 10
            x:100
            Text{                                                                                 //вывод результата на экран пользователя
                id: displayResults2
                visible: true
                y:-10
                text: "2. Привязанность – обособленность: " +score2 +"/75"
                font.pointSize: 20
            }
            Row{                                                                        //Вывод  графической информации о результатах теста
                Repeater{
                    model: score2
                    Rectangle{
                        width:(300/questionsString.length)
                        height:20
                        color: if(score2 >= 0 && score2 <= 40)
                                   return "red";
                                else if(score2 >= 41 && score2 <= 50)
                                   return "yellow";
                                else if(score2 >= 51 && score2 <= 75)
                                   return "green";
                    }
                }
                Repeater{
                    model: (questionsString.length - score2)
                    Rectangle{
                        width:(300/questionsString.length)
                        height:20
                        color:"black"
                    }
                }
            }
        }

        Row{                                                                            //Вывод  информации о доп. параметрах результата теста
            id: graphScore21
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: false
            spacing: 10
            x:100
            Text{                                                                                 //вывод результата на экран пользователя
                id: displayResults21
                 y: -10
                visible: true
                text: "2.1. Теплота - равнодушие: " + score21 +"/15"
                font.pointSize: 15
            }
            Row{                                                                        //Вывод  графической информации о доп. параметрах результата теста
                Repeater{
                    model: score21
                    Rectangle{
                        width:15
                        height:15
                        color: if(score21 >= 0 && score21 <= 6)
                                   return "red";
                                else if(score21 >= 7 && score21 <= 11)
                                   return "yellow";
                                else if(score21 >= 12 && score21 <= 15)
                                   return "green";
                    }
                }
                Repeater{
                    model: (15 - score21)
                    Rectangle{
                        width:15
                        height:15
                        color:"black"
                    }
                }
            }
        }

        Row{                                                                            //Вывод  информации о доп. параметрах результата теста
            id: graphScore22
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: false
            spacing: 10
            x:100
            Text{                                                                                 //вывод результата на экран пользователя
                id: displayResults22
                 y: -10
                visible: true
                text: "2.2. Сотрудничество - соперничество: " + score22 +"/15"
                font.pointSize: 15
            }
            Row{                                                                        //Вывод  графической информации о доп. параметрах результата теста
                Repeater{
                    model: score22
                    Rectangle{
                        width:15
                        height:15
                        color: if(score22 >= 0 && score22 <= 6)
                                   return "red";
                                else if(score22 >= 7 && score22 <= 11)
                                   return "yellow";
                                else if(score22 >= 12 && score22 <= 15)
                                   return "green";
                    }
                }
                Repeater{
                    model: (15 - score22)
                    Rectangle{
                        width:15
                        height:15
                        color:"black"
                    }
                }
            }
        }

        Row{                                                                            //Вывод  информации о доп. параметрах результата теста
            id: graphScore23
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: false
            spacing: 10
            x:100
            Text{                                                                                 //вывод результата на экран пользователя
                id: displayResults23
                 y: -10
                visible: true
                text: "2.3. Доверчивость - подозрительность: " + score23+"/15"
                font.pointSize: 15
            }
            Row{                                                                        //Вывод  графической информации о доп. параметрах результата теста
                Repeater{
                    model: score23
                    Rectangle{
                        width:15
                        height:15
                        color: if(score23 >= 0 && score23 <= 6)
                                   return "red";
                                else if(score23 >= 7 && score23 <= 11)
                                   return "yellow";
                                else if(score23 >= 12 && score23 <= 15)
                                   return "green";
                    }
                }
                Repeater{
                    model: (15 - score23)
                    Rectangle{
                        width:15
                        height:15
                        color:"black"
                    }
                }
            }
        }

        Row{                                                                            //Вывод  информации о доп. параметрах результата теста
            id: graphScore24
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: false
            spacing: 10
            x:100
            Text{                                                                                 //вывод результата на экран пользователя
                id: displayResults24
                 y: -10
                visible: true
                text: "2.4. Понимание - непонимание: " + score24 +"/15"
                font.pointSize: 15
            }
            Row{                                                                        //Вывод  графической информации о доп. параметрах результата теста
                Repeater{
                    model: score24
                    Rectangle{
                        width:15
                        height:15
                        color: if(score24 >= 0 && score24 <= 6)
                                   return "red";
                                else if(score24 >= 7 && score24 <= 11)
                                   return "yellow";
                                else if(score24 >= 12 && score24 <= 15)
                                   return "green";
                    }
                }
                Repeater{
                    model: (15 - score24)
                    Rectangle{
                        width:15
                        height:15
                        color:"black"
                    }
                }
            }
        }

        Row{                                                                            //Вывод  информации о доп. параметрах результата теста
            id: graphScore25
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: false
            spacing: 10
            x:100
            Text{                                                                                 //вывод результата на экран пользователя
                id: displayResults25
                 y: -10
                visible: true
                text: "2.5. Уважение других - самоуважение: " + score25 +"/15"
                font.pointSize: 15
            }
            Row{                                                                        //Вывод  графической информации о доп. параметрах результата теста
                Repeater{
                    model: score25
                    Rectangle{
                        width:15
                        height:15
                        color: if(score25 >= 0 && score25 <= 6)
                                   return "red";
                                else if(score25 >= 7 && score25 <= 11)
                                   return "yellow";
                                else if(score25 >= 12 && score25 <= 15)
                                   return "green";
                    }
                }
                Repeater{
                    model: (15 - score25)
                    Rectangle{
                        width:15
                        height:15
                        color:"black"
                    }
                }
            }
        }
        Text{                                                                                 //вывод объяснения результата пользователя
            id: displayExplanation2
            visible: false
            x:100
            y:220
            text: ""
            font.pointSize: 15
        }

        Row{                                                                            //Вывод  информации о результатах теста
            id: graphScore3
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: false
            spacing: 10
            x:100
            Text{                                                                                 //вывод результата на экран пользователя
                id: displayResults3
                visible: true
                y:-10
                text: "3. Самоконтроль – импульсивность: " +score3 +"/75"
                font.pointSize: 20
            }
            Row{                                                                        //Вывод  графической информации о результатах теста
                Repeater{
                    model: score3
                    Rectangle{
                        width:(300/questionsString.length)
                        height:20
                        color: if(score3 >= 0 && score3 <= 40)
                                   return "red";
                                else if(score3 >= 41 && score3 <= 50)
                                   return "yellow";
                                else if(score3 >= 51 && score3 <= 75)
                                   return "green";
                    }
                }
                Repeater{
                    model: (questionsString.length - score3)
                    Rectangle{
                        width:(300/questionsString.length)
                        height:20
                        color:"black"
                    }
                }
            }
        }

        Row{                                                                            //Вывод  информации о доп. параметрах результата теста
            id: graphScore31
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: false
            spacing: 10
            x:100
            Text{                                                                                 //вывод результата на экран пользователя
                id: displayResults31
                 y: -10
                visible: true
                text: "3.1. Аккуратность - неаккуратность: " + score31 +"/15"
                font.pointSize: 15
            }
            Row{                                                                        //Вывод  графической информации о доп. параметрах результата теста
                Repeater{
                    model: score31
                    Rectangle{
                        width:15
                        height:15
                        color: if(score31 >= 0 && score31 <= 6)
                                   return "red";
                                else if(score31 >= 7 && score31 <= 11)
                                   return "yellow";
                                else if(score31 >= 12 && score31 <= 15)
                                   return "green";
                    }
                }
                Repeater{
                    model: (15 - score31)
                    Rectangle{
                        width:15
                        height:15
                        color:"black"
                    }
                }
            }
        }

        Row{                                                                            //Вывод  информации о доп. параметрах результата теста
            id: graphScore32
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: false
            spacing: 10
            x:100
            Text{                                                                                 //вывод результата на экран пользователя
                id: displayResults32
                 y: -10
                visible: true
                text: "3.2. Настойчивость - слабоволие: " + score32 +"/15"
                font.pointSize: 15
            }
            Row{                                                                        //Вывод  графической информации о доп. параметрах результата теста
                Repeater{
                    model: score32
                    Rectangle{
                        width:15
                        height:15
                        color: if(score32 >= 0 && score32 <= 6)
                                   return "red";
                                else if(score32 >= 7 && score32 <= 11)
                                   return "yellow";
                                else if(score32 >= 12 && score32 <= 15)
                                   return "green";
                    }
                }
                Repeater{
                    model: (15 - score32)
                    Rectangle{
                        width:15
                        height:15
                        color:"black"
                    }
                }
            }
        }

        Row{                                                                            //Вывод  информации о доп. параметрах результата теста
            id: graphScore33
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: false
            spacing: 10
            x:100
            Text{                                                                                 //вывод результата на экран пользователя
                id: displayResults33
                 y: -10
                visible: true
                text: "3.3. Ответственность - безответственность: " + score33+"/15"
                font.pointSize: 15
            }
            Row{                                                                        //Вывод  графической информации о доп. параметрах результата теста
                Repeater{
                    model: score33
                    Rectangle{
                        width:15
                        height:15
                        color: if(score33 >= 0 && score33 <= 6)
                                   return "red";
                                else if(score33 >= 7 && score33 <= 11)
                                   return "yellow";
                                else if(score33 >= 12 && score33 <= 15)
                                   return "green";
                    }
                }
                Repeater{
                    model: (15 - score33)
                    Rectangle{
                        width:15
                        height:15
                        color:"black"
                    }
                }
            }
        }

        Row{                                                                            //Вывод  информации о доп. параметрах результата теста
            id: graphScore34
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: false
            spacing: 10
            x:100
            Text{                                                                                 //вывод результата на экран пользователя
                id: displayResults34
                 y: -10
                visible: true
                text: "3.4. Самоконтроль - импульсивность: " + score34 +"/15"
                font.pointSize: 15
            }
            Row{                                                                        //Вывод  графической информации о доп. параметрах результата теста
                Repeater{
                    model: score34
                    Rectangle{
                        width:15
                        height:15
                        color: if(score34 >= 0 && score34 <= 6)
                                   return "red";
                                else if(score34 >= 7 && score34 <= 11)
                                   return "yellow";
                                else if(score34 >= 12 && score34 <= 15)
                                   return "green";
                    }
                }
                Repeater{
                    model: (15 - score34)
                    Rectangle{
                        width:15
                        height:15
                        color:"black"
                    }
                }
            }
        }

        Row{                                                                            //Вывод  информации о доп. параметрах результата теста
            id: graphScore35
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: false
            spacing: 10
            x:100
            Text{                                                                                 //вывод результата на экран пользователя
                id: displayResults35
                 y: -10
                visible: true
                text: "3.5. Предусмотрительность - беспечность: " + score35 +"/15"
                font.pointSize: 15
            }

            Row{                                                                        //Вывод  графической информации о доп. параметрах результата теста
                Repeater{
                    model: score35
                    Rectangle{
                        width:15
                        height:15
                        color: if(score35 >= 0 && score35 <= 6)
                                   return "red";
                                else if(score35 >= 7 && score35 <= 11)
                                   return "yellow";
                                else if(score35 >= 12 && score35 <= 15)
                                   return "green";
                    }
                }
                Repeater{
                    model: (15 - score35)
                    Rectangle{
                        width:15
                        height:15
                        color:"black"
                    }
                }
            }
        }
        Text{                                                                                 //вывод объяснения результата пользователя
            id: displayExplanation3
            visible: false
            x:100
            y:320
            text: ""
            font.pointSize: 15
        }

        Row{                                                                            //Вывод  информации о результатах теста
            id: graphScore4
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: false
            spacing: 10
            x:100
            Text{                                                                                 //вывод результата на экран пользователя
                id: displayResults4
                visible: true
                y:-10
                text: "4. Эмоциональная устойчивость - неустойчивость: " +score4 +"/75"
                font.pointSize: 20
            }
            Row{                                                                        //Вывод  графической информации о результатах теста
                Repeater{
                    model: score4
                    Rectangle{
                        width:(300/questionsString.length)
                        height:20
                        color: if(score4 >= 0 && score4 <= 40)
                                   return "red";
                                else if(score4 >= 41 && score4 <= 50)
                                   return "yellow";
                                else if(score4 >= 51 && score4 <= 75)
                                   return "green";
                    }
                }
                Repeater{
                    model: (questionsString.length - score4)
                    Rectangle{
                        width:(300/questionsString.length)
                        height:20
                        color:"black"
                    }
                }
            }
        }

        Row{                                                                            //Вывод  информации о доп. параметрах результата теста
            id: graphScore41
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: false
            spacing: 10
            x:100
            Text{                                                                                 //вывод результата на экран пользователя
                id: displayResults41
                 y: -10
                visible: true
                text: "4.1. Тревожность - беззаботность: " + score41 +"/15"
                font.pointSize: 15
            }
            Row{                                                                        //Вывод  графической информации о доп. параметрах результата теста
                Repeater{
                    model: score41
                    Rectangle{
                        width:15
                        height:15
                        color: if(score41 >= 0 && score41 <= 6)
                                   return "red";
                                else if(score41 >= 7 && score41 <= 11)
                                   return "yellow";
                                else if(score41 >= 12 && score41 <= 15)
                                   return "green";
                    }
                }
                Repeater{
                    model: (15 - score41)
                    Rectangle{
                        width:15
                        height:15
                        color:"black"
                    }
                }
            }
        }

        Row{                                                                            //Вывод  информации о доп. параметрах результата теста
            id: graphScore42
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: false
            spacing: 10
            x:100
            Text{                                                                                 //вывод результата на экран пользователя
                id: displayResults42
                 y: -10
                visible: true
                text: "4.2. Напряженность - расслабленность: " + score42 +"/15"
                font.pointSize: 15
            }
            Row{                                                                        //Вывод  графической информации о доп. параметрах результата теста
                Repeater{
                    model: score42
                    Rectangle{
                        width:15
                        height:15
                        color: if(score42 >= 0 && score42 <= 6)
                                   return "red";
                                else if(score42 >= 7 && score42 <= 11)
                                   return "yellow";
                                else if(score42 >= 12 && score42 <= 15)
                                   return "green";
                    }
                }
                Repeater{
                    model: (15 - score42)
                    Rectangle{
                        width:15
                        height:15
                        color:"black"
                    }
                }
            }
        }

        Row{                                                                            //Вывод  информации о доп. параметрах результата теста
            id: graphScore43
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: false
            spacing: 10
            x:100
            Text{                                                                                 //вывод результата на экран пользователя
                id: displayResults43
                 y: -10
                visible: true
                text: "4.3. Депрессивность - эмоциональная комфортность: " + score43+"/15"
                font.pointSize: 15
            }
            Row{                                                                        //Вывод  графической информации о доп. параметрах результата теста
                Repeater{
                    model: score43
                    Rectangle{
                        width:15
                        height:15
                        color: if(score43 >= 0 && score43 <= 6)
                                   return "red";
                                else if(score43 >= 7 && score43 <= 11)
                                   return "yellow";
                                else if(score43 >= 12 && score43 <= 15)
                                   return "green";
                    }
                }
                Repeater{
                    model: (15 - score43)
                    Rectangle{
                        width:15
                        height:15
                        color:"black"
                    }
                }
            }
        }

        Row{                                                                            //Вывод  информации о доп. параметрах результата теста
            id: graphScore44
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: false
            spacing: 10
            x:100
            Text{                                                                                 //вывод результата на экран пользователя
                id: displayResults44
                 y: -10
                visible: true
                text: "4.4. Самокритика - самодостаточность: " + score44 +"/15"
                font.pointSize: 15
            }
            Row{                                                                        //Вывод  графической информации о доп. параметрах результата теста
                Repeater{
                    model: score44
                    Rectangle{
                        width:15
                        height:15
                        color: if(score44 >= 0 && score44 <= 6)
                                   return "red";
                                else if(score44 >= 7 && score44 <= 11)
                                   return "yellow";
                                else if(score44 >= 12 && score44 <= 15)
                                   return "green";
                    }
                }
                Repeater{
                    model: (15 - score44)
                    Rectangle{
                        width:15
                        height:15
                        color:"black"
                    }
                }
            }
        }

        Row{                                                                            //Вывод  информации о доп. параметрах результата теста
            id: graphScore45
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: false
            spacing: 10
            x:100
            Text{                                                                                 //вывод результата на экран пользователя
                id: displayResults45
                 y: -10
                visible: true
                text: "4.5. Эмоциональная лабильность - эмоциональная стабильность: " + score45 +"/15"
                font.pointSize: 15
            }
            Row{                                                                        //Вывод  графической информации о доп. параметрах результата теста
                Repeater{
                    model: score45
                    Rectangle{
                        width:15
                        height:15
                        color: if(score45 >= 0 && score45 <= 6)
                                   return "red";
                                else if(score45 >= 7 && score45 <= 11)
                                   return "yellow";
                                else if(score45 >= 12 && score45 <= 15)
                                   return "green";
                    }
                }
                Repeater{
                    model: (15 - score45)
                    Rectangle{
                        width:15
                        height:15
                        color:"black"
                    }
                }
            }
        }
        Text{                                                                                 //вывод объяснения результата пользователя
            id: displayExplanation4
            visible: false
            x:100
            y:420
            text: ""
            font.pointSize: 15
        }

        Row{                                                                            //Вывод  информации о результатах теста
            id: graphScore5
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: false
            spacing: 10
            x:100
            Text{                                                                                 //вывод результата на экран пользователя
                id: displayResults5
                visible: true
                y:-10
                text: "5. Экспрессивность – практичность: " +score5 +"/75 "
                font.pointSize: 20
            }
            Row{                                                                        //Вывод  графической информации о результатах теста
                Repeater{
                    model: score5
                    Rectangle{
                        width:(300/questionsString.length)
                        height:20
                        color: if(score5 >= 0 && score5 <= 40)
                                   return "red";
                                else if(score5 >= 41 && score5 <= 50)
                                   return "yellow";
                                else if(score5 >= 51 && score5 <= 75)
                                   return "green";
                    }
                }
                Repeater{
                    model: (questionsString.length - score5)
                    Rectangle{
                        width:(300/questionsString.length)
                        height:20
                        color:"black"
                    }
                }
            }
        }

        Row{                                                                            //Вывод  информации о доп. параметрах результата теста
            id: graphScore51
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: false
            spacing: 10
            x:100
            Text{                                                                                 //вывод результата на экран пользователя
                id: displayResults51
                 y: -10
                visible: true
                text: "5.1. Любопытство - консерватизм: " + score51 +"/15"
                font.pointSize: 15
            }
            Row{                                                                        //Вывод  графической информации о доп. параметрах результата теста
                Repeater{
                    model: score51
                    Rectangle{
                        width:15
                        height:15
                        color: if(score51 >= 0 && score51 <= 6)
                                   return "red";
                                else if(score51 >= 7 && score51 <= 11)
                                   return "yellow";
                                else if(score51 >= 12 && score51 <= 15)
                                   return "green";
                    }
                }
                Repeater{
                    model: (15 - score51)
                    Rectangle{
                        width:15
                        height:15
                        color:"black"
                    }
                }
            }
        }

        Row{                                                                            //Вывод  информации о доп. параметрах результата теста
            id: graphScore52
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: false
            spacing: 10
            x:100
            Text{                                                                                 //вывод результата на экран пользователя
                id: displayResults52
                 y: -10
                visible: true
                text: "5.2. Мечтательность - реалистичность: " + score52 +"/15"
                font.pointSize: 15
            }
            Row{                                                                        //Вывод  графической информации о доп. параметрах результата теста
                Repeater{
                    model: score52
                    Rectangle{
                        width:15
                        height:15
                        color: if(score52 >= 0 && score52 <= 6)
                                   return "red";
                                else if(score52 >= 7 && score52 <= 11)
                                   return "yellow";
                                else if(score52 >= 12 && score52 <= 15)
                                   return "green";
                    }
                }
                Repeater{
                    model: (15 - score52)
                    Rectangle{
                        width:15
                        height:15
                        color:"black"
                    }
                }
            }
        }

        Row{                                                                            //Вывод  информации о доп. параметрах результата теста
            id: graphScore53
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: false
            spacing: 10
            x:100
            Text{                                                                                 //вывод результата на экран пользователя
                id: displayResults53
                 y: -10
                visible: true
                text: "5.3. Артистичность - неартистичность: " + score53+"/15"
                font.pointSize: 15
            }
            Row{                                                                        //Вывод  графической информации о доп. параметрах результата теста
                Repeater{
                    model: score53
                    Rectangle{
                        width:15
                        height:15
                        color: if(score53 >= 0 && score53 <= 6)
                                   return "red";
                                else if(score53 >= 7 && score53 <= 11)
                                   return "yellow";
                                else if(score53 >= 12 && score53 <= 15)
                                   return "green";
                    }
                }
                Repeater{
                    model: (15 - score53)
                    Rectangle{
                        width:15
                        height:15
                        color:"black"
                    }
                }
            }
        }

        Row{                                                                            //Вывод  информации о доп. параметрах результата теста
            id: graphScore54
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: false
            spacing: 10
            x:100
            Text{                                                                                 //вывод результата на экран пользователя
                id: displayResults54
                 y: -10
                visible: true
                text: "5.4. Сензитивность - нечувствительность: " + score54 +"/15"
                font.pointSize: 15
            }
            Row{                                                                        //Вывод  графической информации о доп. параметрах результата теста
                Repeater{
                    model: score54
                    Rectangle{
                        width:15
                        height:15
                        color: if(score54 >= 0 && score54 <= 6)
                                   return "red";
                                else if(score54 >= 7 && score54 <= 11)
                                   return "yellow";
                                else if(score54 >= 12 && score54 <= 15)
                                   return "green";
                    }
                }
                Repeater{
                    model: (15 - score54)
                    Rectangle{
                        width:15
                        height:15
                        color:"black"
                    }
                }
            }
        }

        Row{                                                                            //Вывод  информации о доп. параметрах результата теста
            id: graphScore55
            Layout.fillHeight: true
            Layout.fillWidth: true
            visible: false
            spacing: 10
            x:100
            Text{                                                                                 //вывод результата на экран пользователя
                id: displayResults55
                 y: -10
                visible: true
                text: "5.5. Пластичность - ригидность: " + score55 +"/15"
                font.pointSize: 15
            }
            Row{                                                                        //Вывод  графической информации о доп. параметрах результата теста
                Repeater{
                    model: score55
                    Rectangle{
                        width:15
                        height:15
                        color: if(score55 >= 0 && score55 <= 6)
                                   return "red";
                                else if(score55 >= 7 && score55 <= 11)
                                   return "yellow";
                                else if(score55 >= 12 && score55 <= 15)
                                   return "green";
                    }
                }
                Repeater{
                    model: (15 - score55)
                    Rectangle{
                        width:15
                        height:15
                        color:"black"
                    }
                }
            }
        }
        Text{                                                                                 //вывод объяснения результата пользователя
            id: displayExplanation5
            visible: false
            x:100
            y:520
            text: ""
            font.pointSize: 15
        }
        Text{                                                                                   //вывод объяснения оценок теста
            id: displayExplanationScore
            visible: false
            x:100
            y:520
            text: scoreExplanation
            font.pointSize: 15
        }

        Row{
            id: displayExplanation1Row
           spacing: 20
            visible: false
            Text{                                                                                 //вывод объяснения результата пользователя
                x:100
                y:120
                text: "Экстраверсия\n"+ resultExplanation[0]
                font.pointSize: 15
            }
            Text{                                                                                 //вывод объяснения результата пользователя
                x:100
                y:120
                text: "Интроверсия\n" + resultExplanation[1]
                font.pointSize: 15
            }
        }
        Row{
            id: displayExplanation2Row
           spacing: 20
            visible: false
            Text{                                                                                 //вывод объяснения результата пользователя
                x:100
                y:120
                text: "Привязанность\n" + resultExplanation[2]
                font.pointSize: 15
            }
            Text{                                                                                 //вывод объяснения результата пользователя
                x:100
                y:120
                text: "Обособленность\n" + resultExplanation[3]
                font.pointSize: 15
            }
        }
        Row{
            id: displayExplanation3Row
            spacing: 20
            visible: false
            Text{                                                                                 //вывод объяснения результата пользователя
                x:100
                y:120
                text: "Самоконтроль\n" + resultExplanation[4]
                font.pointSize: 15
            }
            Text{                                                                                 //вывод объяснения результата пользователя
                x:100
                y:120
                text: "Импульсивность\n" + resultExplanation[5]
                font.pointSize: 15
            }
        }
        Row{
            id: displayExplanation4Row
            spacing: 20
            visible: false
            Text{                                                                                 //вывод объяснения результата пользователя
                x:100
                y:120
                text: "Эмоциональная устойчивость\n" + resultExplanation[6]
                font.pointSize: 15
            }
            Text{                                                                                 //вывод объяснения результата пользователя
                x:100
                y:120
                text: "Эмоциональная неустойчивость\n" + resultExplanation[7]
                font.pointSize: 15
            }
        }
        Row{
            id: displayExplanation5Row
            spacing: 20
            visible: false
            Text{                                                                                 //вывод объяснения результата пользователя
                x:100
                y:120
                text: "Экспрессивность\n" + resultExplanation[8]
                font.pointSize: 15
            }
            Text{                                                                                 //вывод объяснения результата пользователя
                x:100
                y:120
                text: "Практичность\n" + resultExplanation[9]
                font.pointSize: 15
            }
        }
    }
}




    Row{                                                                            //строка выбора ответов на вопрос
        y:250
        x:25
        spacing: 20
        id:buttonRow
        visible:false
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

        width: 125
        height: 75
        Text{
            anchors.centerIn: parent
            text:"Полностью верно"
        }
        MouseArea{
            id:buttonDisagreeCompletelyMouseArea
            anchors.fill:parent
            hoverEnabled: true
            onClicked: {
                console.log("Ответ нажат 1");
                lastValue=5;
                if((questionNum+1)<=15)
                {
                    lastSubScore=1;
                    switch((questionNum+1) % 5)
                    {
                    case 0:
                        score51+=5;
                        lastScore=5;
                        break;
                    case 1:
                        score11+=5;
                        lastScore=1;
                        break;
                    case 2:
                        score21+=5;
                        lastScore=2;
                        break;
                    case 3:
                        score31+=5;
                        lastScore=3;
                        break;
                    case 4:
                        score41+=5;
                        lastScore=4;
                        break;
                    default:
                        break;
                    }
                }
                if((questionNum+1) > 15 && (questionNum+1) <= 30)
                {
                    lastSubScore=2;
                    switch((questionNum+1) % 5)
                    {
                    case 0:
                        score52+=5;
                        lastScore=5;
                        break;
                    case 1:
                        score12+=5;
                        lastScore=1;
                        break;
                    case 2:
                        score22+=5;
                        lastScore=2;
                        break;
                    case 3:
                        score32+=5;
                        lastScore=3;
                        break;
                    case 4:
                        score42+=5;
                        lastScore=4;
                        break;
                    default:
                        break;
                    }
                }
                if((questionNum+1) > 30 && (questionNum+1) <= 45)
                {
                    lastSubScore=3;
                    switch((questionNum+1) % 5)
                    {
                    case 0:
                        score53+=5;
                        lastScore=5;
                        break;
                    case 1:
                        score13+=5;
                        lastScore=1;
                        break;
                    case 2:
                        score23+=5;
                        lastScore=2;
                        break;
                    case 3:
                        score33+=5;
                        lastScore=3;
                        break;
                    case 4:
                        score43+=5;
                        lastScore=4;
                        break;
                    default:
                        break;
                    }
                }
                if((questionNum+1) > 45 && (questionNum+1) <= 60)
                {
                    lastSubScore=4;
                    switch((questionNum+1) % 5)
                    {
                    case 0:
                        score54+=5;
                        lastScore=5;
                        break;
                    case 1:
                        score14+=5;
                        lastScore=1;
                        break;
                    case 2:
                        score24+=5;
                        lastScore=2;
                        break;
                    case 3:
                        score34+=5;
                        lastScore=3;
                        break;
                    case 4:
                        score44+=5;
                        lastScore=4;
                        break;
                    default:
                        break;
                    }
                }
                if((questionNum+1) > 60 && (questionNum+1) <= 75)
                {
                    lastSubScore=5;
                    switch((questionNum+1) % 5)
                    {
                    case 0:
                        score55+=5;
                        lastScore=5;
                        break;
                    case 1:
                        score15+=5;
                        lastScore=1;
                        break;
                    case 2:
                        score25+=5;
                        lastScore=2;
                        break;
                    case 3:
                        score35+=5;
                        lastScore=3;
                        break;
                    case 4:
                        score45+=5;
                        lastScore=4;
                        break;
                    default:
                        break;
                    }

                }
                questionScore.push(lastScore);
                questionSubScore.push(lastSubScore);
                questionValue.push(lastValue);
                if(questionNum<questionsString.length-1)
                {
                      questionNum++;
                      buttonQuestionBack.text="Вернуться назад";
                }
                else
                {
                                                                                            //Получение итоговых результатов
                    score1+=score11 + score12 + score13 + score14 + score15
                    score2+=score21 + score22 + score23 + score24 + score25
                    score3+=score31 + score32 + score33 + score34 + score35
                    score4+=score41 + score42 + score43 + score44 + score45
                    score5+=score51 + score52 + score53 + score54 + score55

                    displayResult.visible=true;                          //Вывод результатов теста

                    graphScore1.visible=true;
                    graphScore11.visible=true;
                    graphScore12.visible=true;
                    graphScore13.visible=true;
                    graphScore14.visible=true;
                    graphScore15.visible=true;

                    graphScore2.visible=true;
                    graphScore21.visible=true;
                    graphScore22.visible=true;
                    graphScore23.visible=true;
                    graphScore24.visible=true;
                    graphScore25.visible=true;

                    graphScore3.visible=true;
                    graphScore31.visible=true;
                    graphScore32.visible=true;
                    graphScore33.visible=true;
                    graphScore34.visible=true;
                    graphScore35.visible=true;

                    graphScore4.visible=true;
                    graphScore41.visible=true;
                    graphScore42.visible=true;
                    graphScore43.visible=true;
                    graphScore44.visible=true;
                    graphScore45.visible=true;

                    graphScore5.visible=true;
                    graphScore51.visible=true;
                    graphScore52.visible=true;
                    graphScore53.visible=true;
                    graphScore54.visible=true;
                    graphScore55.visible=true;

                    displayExplanationScore.visible=true;
                    displayExplanation1Row.visible=true;
                    displayExplanation2Row.visible=true;
                    displayExplanation3Row.visible=true;
                    displayExplanation4Row.visible=true;
                    displayExplanation5Row.visible=true;

                    displayQuestion.visible=false;
                    displayQuestionNum.visible=false;
                    graphQuestionNum.visible=false;
                    buttonQuestionBack.text="Выйти из теста";
                    testEnd=1;
                    buttonRow.visible=false;


                   if(database.checkID())                                       //Проверить, существует ли ID пользователя в БД
                   {
                       database.updateTable(score1,score2,score3,score4,score5, user_id);  //Изменение уже существующей записи
                   }
                   else
                   {
                       database.insertIntoTable(score1,score2,score3,score4,score5,user_id);    //Добавить новую запись
                   }
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

        width: 125
        height: 75
        Text{
            anchors.centerIn: parent
            text:"Частично верно"
        }
        MouseArea{
            id:buttonDisagreePartiallyMouseArea
            anchors.fill:parent
            hoverEnabled: true
            onClicked: {
                console.log("Ответ нажат 2");
                lastValue=4;
                if((questionNum+1)<=15)
                {
                    lastSubScore=1;
                    switch((questionNum+1) % 5)
                    {
                    case 0:
                        score51+=4;
                        lastScore=5;
                        break;
                    case 1:
                        score11+=4;
                        lastScore=1;
                        break;
                    case 2:
                        score21+=4;
                        lastScore=2;
                        break;
                    case 3:
                        score31+=4;
                        lastScore=3;
                        break;
                    case 4:
                        score41+=4;
                        lastScore=4;
                        break;
                    default:
                        break;
                    }
                }
                if((questionNum+1) > 15 && (questionNum+1) <= 30)
                {
                    lastScore=2;
                    switch((questionNum+1) % 5)
                    {
                    case 0:
                        score52+=4;
                        lastScore=5;
                        break;
                    case 1:
                        score12+=4;
                        lastScore=1;
                        break;
                    case 2:
                        score22+=4;
                        lastScore=2;
                        break;
                    case 3:
                        score32+=4;
                        lastScore=3;
                        break;
                    case 4:
                        score42+=4;
                        lastScore=4;
                        break;
                    default:
                        break;
                    }
                }
                if((questionNum+1) > 30 && (questionNum+1) <= 45)
                {
                    lastScore=3;
                    switch((questionNum+1) % 5)
                    {
                    case 0:
                        score53+=4;
                        lastScore=5;
                        break;
                    case 1:
                        score13+=4;
                        lastScore=1;
                        break;
                    case 2:
                        score23+=4;
                        lastScore=2;
                        break;
                    case 3:
                        score33+=4;
                        lastScore=3;
                        break;
                    case 4:
                        score43+=4;
                        lastScore=4;
                        break;
                    default:
                        break;
                    }
                }
                if((questionNum+1) > 45 && (questionNum+1) <= 60)
                {
                    lastScore=4;
                    switch((questionNum+1) % 5)
                    {
                    case 0:
                        score54+=4;
                        lastScore=5;
                        break;
                    case 1:
                        score14+=4;
                        lastScore=1;
                        break;
                    case 2:
                        score24+=4;
                        lastScore=2;
                        break;
                    case 3:
                        score34+=4;
                        lastScore=3;
                        break;
                    case 4:
                        score44+=4;
                        lastScore=4;
                        break;
                    default:
                        break;
                    }
                }
                if((questionNum+1) > 60 && (questionNum+1) <= 75)
                {
                    lastScore=5;
                    switch((questionNum+1) % 5)
                    {
                    case 0:
                        score55+=4;
                        lastScore=5;
                        break;
                    case 1:
                        score15+=4;
                        lastScore=1;
                        break;
                    case 2:
                        score25+=4;
                        lastScore=2;
                        break;
                    case 3:
                        score35+=4;
                        lastScore=3;
                        break;
                    case 4:
                        score45+=4;
                        lastScore=4;
                        break;
                    default:
                        break;
                    }
                }
                questionScore.push(lastScore);
                questionSubScore.push(lastSubScore);
                questionValue.push(lastValue);
                if(questionNum<questionsString.length-1)
                   {
                         questionNum++;
                        buttonQuestionBack.text="Вернуться назад";
                   }
                else
                {
                                                                             //Получение итоговых результатов
                  score1+=score11 + score12 + score13 + score14 + score15
                   score2+=score21 + score22 + score23 + score24 + score25
                   score3+=score31 + score32 + score33 + score34 + score35
                    score4+=score41 + score42 + score43 + score44 + score45
                    score5+=score51 + score52 + score53 + score54 + score55

                    displayResult.visible=true;                          //Вывод результатов теста


                    graphScore1.visible=true;
                    graphScore11.visible=true;
                    graphScore12.visible=true;
                    graphScore13.visible=true;
                    graphScore14.visible=true;
                    graphScore15.visible=true;

                    graphScore2.visible=true;
                    graphScore21.visible=true;
                    graphScore22.visible=true;
                    graphScore23.visible=true;
                    graphScore24.visible=true;
                    graphScore25.visible=true;

                    graphScore3.visible=true;
                    graphScore31.visible=true;
                    graphScore32.visible=true;
                    graphScore33.visible=true;
                    graphScore34.visible=true;
                    graphScore35.visible=true;

                    graphScore4.visible=true;
                    graphScore41.visible=true;
                    graphScore42.visible=true;
                    graphScore43.visible=true;
                    graphScore44.visible=true;
                    graphScore45.visible=true;

                    graphScore5.visible=true;
                    graphScore51.visible=true;
                    graphScore52.visible=true;
                    graphScore53.visible=true;
                    graphScore54.visible=true;
                    graphScore55.visible=true;

                    displayExplanationScore.visible=true;
                    displayExplanation1Row.visible=true;
                    displayExplanation2Row.visible=true;
                    displayExplanation3Row.visible=true;
                    displayExplanation4Row.visible=true;
                    displayExplanation5Row.visible=true;

                    displayQuestion.visible=false;
                    displayQuestionNum.visible=false;
                    graphQuestionNum.visible=false;
                    buttonQuestionBack.text="Выйти из теста";
                    testEnd=1;
                    buttonRow.visible=false;

                    if(database.checkID())                                       //Проверить, существует ли ID пользователя в БД
                    {
                        database.updateTable(score1,score2,score3,score4,score5, user_id);  //Изменение уже существующей записи
                    }
                    else
                    {
                        database.insertIntoTable(score1,score2,score3,score4,score5,user_id);    //Добавить новую запись
                    }
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

        width: 125
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
                lastValue=3;
                if((questionNum+1)<=15)
                {
                    lastSubScore=1;
                    switch((questionNum+1) % 5)
                    {
                    case 0:
                        score51+=3;
                        lastScore=5;
                        break;
                    case 1:
                        score11+=3;
                        lastScore=1;
                        break;
                    case 2:
                        score21+=3;
                        lastScore=2;
                        break;
                    case 3:
                        score31+=3;
                        lastScore=3;
                        break;
                    case 4:
                        score41+=3;
                        lastScore=4;
                        break;
                    default:
                        break;
                    }
                }
                if((questionNum+1) > 15 && (questionNum+1) <= 30)
                {
                    lastSubScore=2;
                    switch((questionNum+1) % 5)
                    {
                    case 0:
                        score52+=3;
                        lastScore=5;
                        break;
                    case 1:
                        score12+=3;
                        lastScore=1;
                        break;
                    case 2:
                        score22+=3;
                        lastScore=2;
                        break;
                    case 3:
                        score32+=3;
                        lastScore=3;
                        break;
                    case 4:
                        score42+=3;
                        lastScore=4;
                        break;
                    default:
                        break;
                    }
                }
                if((questionNum+1) > 30 && (questionNum+1) <= 45)
                {
                    lastSubScore=3;
                    switch((questionNum+1) % 5)
                    {
                    case 0:
                        score53+=3;
                        lastScore=5;
                        break;
                    case 1:
                        score13+=3;
                        lastScore=1;
                        break;
                    case 2:
                        score23+=3;
                        lastScore=2;
                        break;
                    case 3:
                        score33+=3;
                        lastScore=3;
                        break;
                    case 4:
                        score43+=3;
                        lastScore=4;
                        break;
                    default:
                        break;
                    }
                }
                if((questionNum+1) > 45 && (questionNum+1) <= 60)
                {
                    lastSubScore=4;
                    switch((questionNum+1) % 5)
                    {
                    case 0:
                        score54+=3;
                        lastScore=5;
                        break;
                    case 1:
                        score14+=3;
                        lastScore=1;
                        break;
                    case 2:
                        score24+=3;
                        lastScore=2;
                        break;
                    case 3:
                        score34+=3;
                        lastScore=3;
                        break;
                    case 4:
                        score44+=3;
                        lastScore=4;
                        break;
                    default:
                        break;
                    }
                }
                if((questionNum+1) > 60 && (questionNum+1) <= 75)
                {
                    lastSubScore=5;
                    switch((questionNum+1) % 5)
                    {
                    case 0:
                        score55+=3;
                        lastScore=5;
                        break;
                    case 1:
                        score15+=3;
                        lastScore=1;
                        break;
                    case 2:
                        score25+=3;
                        lastScore=2;
                        break;
                    case 3:
                        score35+=3;
                        lastScore=3;
                        break;
                    case 4:
                        score45+=3;
                        lastScore=4;
                        break;
                    default:
                        break;
                    }
                }
                questionScore.push(lastScore);
                questionSubScore.push(lastSubScore);
                questionValue.push(lastValue);
                if(questionNum<questionsString.length-1)
                {
                    questionNum++;
                    buttonQuestionBack.text="Вернуться назад";
                }
                else
                {
                                        //Получение итоговых результатов
                    score1+=score11 + score12 + score13 + score14 + score15
                    score2+=score21 + score22 + score23 + score24 + score25
                    score3+=score31 + score32 + score33 + score34 + score35
                    score4+=score41 + score42 + score43 + score44 + score45
                    score5+=score51 + score52 + score53 + score54 + score55

                    displayResult.visible=true;                          //Вывод результатов теста

                    graphScore1.visible=true;
                    graphScore11.visible=true;
                    graphScore12.visible=true;
                    graphScore13.visible=true;
                    graphScore14.visible=true;
                    graphScore15.visible=true;

                    graphScore2.visible=true;
                    graphScore21.visible=true;
                    graphScore22.visible=true;
                    graphScore23.visible=true;
                    graphScore24.visible=true;
                    graphScore25.visible=true;

                    graphScore3.visible=true;
                    graphScore31.visible=true;
                    graphScore32.visible=true;
                    graphScore33.visible=true;
                    graphScore34.visible=true;
                    graphScore35.visible=true;

                    graphScore4.visible=true;
                    graphScore41.visible=true;
                    graphScore42.visible=true;
                    graphScore43.visible=true;
                    graphScore44.visible=true;
                    graphScore45.visible=true;

                    graphScore5.visible=true;
                    graphScore51.visible=true;
                    graphScore52.visible=true;
                    graphScore53.visible=true;
                    graphScore54.visible=true;
                    graphScore55.visible=true;

                    displayExplanationScore.visible=true;
                    displayExplanation1Row.visible=true;
                    displayExplanation2Row.visible=true;
                    displayExplanation3Row.visible=true;
                    displayExplanation4Row.visible=true;
                    displayExplanation5Row.visible=true;

                    displayQuestion.visible=false;
                    displayQuestionNum.visible=false;
                    graphQuestionNum.visible=false;
                    buttonQuestionBack.text="Выйти из теста";
                    testEnd=1;
                    buttonRow.visible=false;


                    if(database.checkID())                                       //Проверить, существует ли ID пользователя в БД
                    {
                        database.updateTable(score1,score2,score3,score4,score5, user_id);  //Изменение уже существующей записи
                    }
                    else
                    {
                        database.insertIntoTable(score1,score2,score3,score4,score5,user_id);    //Добавить новую запись
                    }
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

        width: 125
        height: 75
        Text{
            anchors.centerIn: parent
            text:"Частично неверно"
        }
        MouseArea{
            id:buttonAgreePartiallyMouseArea
            anchors.fill:parent
            hoverEnabled: true
            onClicked: {
                console.log("Ответ нажат 4");
                lastValue=2;
                if((questionNum+1)<=15)
                {
                    lastSubScore=1;
                    switch((questionNum+1) % 5)
                    {
                    case 0:
                        score51+=2;
                        lastScore=5;
                        break;
                    case 1:
                        score11+=2;
                        lastScore=1;
                        break;
                    case 2:
                        score21+=2;
                        lastScore=2;
                        break;
                    case 3:
                        score31+=2;
                        lastScore=3;
                        break;
                    case 4:
                        score41+=2;
                        lastScore=4;
                        break;
                    default:
                        break;
                    }
                }
                if((questionNum+1) > 15 && (questionNum+1) <= 30)
                {
                    lastSubScore=2;
                    switch((questionNum+1) % 5)
                    {
                    case 0:
                        score52+=2;
                        lastScore=5;
                        break;
                    case 1:
                        score12+=2;
                        lastScore=1;
                        break;
                    case 2:
                        score22+=2;
                        lastScore=2;
                        break;
                    case 3:
                        score32+=2;
                        lastScore=3;
                        break;
                    case 4:
                        score42+=2;
                        lastScore=4;
                        break;
                    default:
                        break;
                    }
                }
                if((questionNum+1) > 30 && (questionNum+1) <= 45)
                {
                    lastSubScore=3;
                    switch((questionNum+1) % 5)
                    {
                    case 0:
                        score53+=2;
                        lastScore=5;
                        break;
                    case 1:
                        score13+=2;
                        lastScore=1;
                        break;
                    case 2:
                        score23+=2;
                        lastScore=2;
                        break;
                    case 3:
                        score33+=2;
                        lastScore=3;
                        break;
                    case 4:
                        score43+=2;
                        lastScore=4;
                        break;
                    default:
                        break;
                    }
                }
                if((questionNum+1) > 45 && (questionNum+1) <= 60)
                {
                    lastSubScore=4;
                    switch((questionNum+1) % 5)
                    {
                    case 0:
                        score54+=2;
                        lastScore=5;
                        break;
                    case 1:
                        score14+=2;
                        lastScore=1;
                        break;
                    case 2:
                        score24+=2;
                        lastScore=2;
                        break;
                    case 3:
                        score34+=2;
                        lastScore=3;
                        break;
                    case 4:
                        score44+=2;
                        lastScore=4;
                        break;
                    default:
                        break;
                    }
                }
                if((questionNum+1) > 60 && (questionNum+1) <= 75)
                {
                    lastSubScore=5;
                    switch((questionNum+1) % 5)
                    {
                    case 0:
                        score55+=2;
                        lastScore=5;
                        break;
                    case 1:
                        score15+=2;
                        lastScore=1;
                        break;
                    case 2:
                        score25+=2;
                        lastScore=2;
                        break;
                    case 3:
                        score35+=2;
                        lastScore=3;
                        break;
                    case 4:
                        score45+=2;
                        lastScore=4;
                        break;
                    default:
                        break;
                    }
                }
                questionScore.push(lastScore);
                questionSubScore.push(lastSubScore);
                questionValue.push(lastValue);
                if(questionNum<questionsString.length-1)
                {

                    questionNum++;
                    buttonQuestionBack.text="Вернуться назад";
                }
                else
                {
                                        //Получение итоговых результатов
                    score1+=score11 + score12 + score13 + score14 + score15
                    score2+=score21 + score22 + score23 + score24 + score25
                    score3+=score31 + score32 + score33 + score34 + score35
                    score4+=score41 + score42 + score43 + score44 + score45
                    score5+=score51 + score52 + score53 + score54 + score55

                    displayResult.visible=true;                          //Вывод результатов теста

                    graphScore1.visible=true;
                    graphScore11.visible=true;
                    graphScore12.visible=true;
                    graphScore13.visible=true;
                    graphScore14.visible=true;
                    graphScore15.visible=true;

                    graphScore2.visible=true;
                    graphScore21.visible=true;
                    graphScore22.visible=true;
                    graphScore23.visible=true;
                    graphScore24.visible=true;
                    graphScore25.visible=true;

                    graphScore3.visible=true;
                    graphScore31.visible=true;
                    graphScore32.visible=true;
                    graphScore33.visible=true;
                    graphScore34.visible=true;
                    graphScore35.visible=true;

                    graphScore4.visible=true;
                    graphScore41.visible=true;
                    graphScore42.visible=true;
                    graphScore43.visible=true;
                    graphScore44.visible=true;
                    graphScore45.visible=true;

                    graphScore5.visible=true;
                    graphScore51.visible=true;
                    graphScore52.visible=true;
                    graphScore53.visible=true;
                    graphScore54.visible=true;
                    graphScore55.visible=true;

                    displayExplanationScore.visible=true;
                    displayExplanation1Row.visible=true;
                    displayExplanation2Row.visible=true;
                    displayExplanation3Row.visible=true;
                    displayExplanation4Row.visible=true;
                    displayExplanation5Row.visible=true;

                    displayQuestion.visible=false;
                    displayQuestionNum.visible=false;
                    graphQuestionNum.visible=false;
                    buttonQuestionBack.text="Выйти из теста";
                    testEnd=1;
                    buttonRow.visible=false;


                   if(database.checkID())                                       //Проверить, существует ли ID пользователя в БД
                    {
                        database.updateTable(score1,score2,score3,score4,score5, user_id);  //Изменение уже существующей записи
                    }
                    else
                    {
                        database.insertIntoTable(score1,score2,score3,score4,score5,user_id);    //Добавить новую запись
                    }
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

        width: 125
        height: 75
        Text{
            anchors.centerIn: parent
            text:"Полностью неверно"
        }
        MouseArea{
            id:buttonAgreeCompletelyMouseArea
            anchors.fill:parent
            hoverEnabled: true
            onClicked: {
                console.log("Ответ нажат 5");
                lastValue=1;
                if((questionNum+1)<=15)
                {
                    lastSubScore=1;
                    switch((questionNum+1) % 5)
                    {
                    case 0:
                        score51+=1;
                        break;
                    case 1:
                        score11+=1;
                        break;
                    case 2:
                        score21+=1;
                        break;
                    case 3:
                        score31+=1;
                        break;
                    case 4:
                        score41+=1;
                        break;
                    default:
                        break;
                    }
                }
                if((questionNum+1) > 15 && (questionNum+1) <= 30)
                {
                    lastSubScore=2;
                    switch((questionNum+1) % 5)
                    {
                    case 0:
                        score52+=1;
                        break;
                    case 1:
                        score12+=1;
                        break;
                    case 2:
                        score22+=1;
                        break;
                    case 3:
                        score32+=1;
                        break;
                    case 4:
                        score42+=1;
                        break;
                    default:
                        break;
                    }
                }
                if((questionNum+1) > 30 && (questionNum+1) <= 45)
                {
                    lastSubScore=3;
                    switch((questionNum+1) % 5)
                    {
                    case 0:
                        score53+=1;
                        break;
                    case 1:
                        score13+=1;
                        break;
                    case 2:
                        score23+=1;
                        break;
                    case 3:
                        score33+=1;
                        break;
                    case 4:
                        score43+=1;
                        break;
                    default:
                        break;
                    }
                }
                if((questionNum+1) > 45 && (questionNum+1) <= 60)
                {
                    lastSubScore=4;
                    switch((questionNum+1) % 5)
                    {
                    case 0:
                        score54+=1;
                        break;
                    case 1:
                        score14+=1;
                        break;
                    case 2:
                        score24+=1;
                        break;
                    case 3:
                        score34+=1;
                        break;
                    case 4:
                        score44+=1;
                        break;
                    default:
                        break;
                    }
                }
                if((questionNum+1) > 60 && (questionNum+1) <= 75)
                {
                    lastSubScore=1;
                    switch((questionNum+1) % 5)
                    {
                    case 0:
                        score55+=1;
                        break;
                    case 1:
                        score15+=1;
                        break;
                    case 2:
                        score25+=1;
                        break;
                    case 3:
                        score35+=1;
                        break;
                    case 4:
                        score45+=1;
                        break;
                    default:
                        break;
                    }
                }
                questionScore.push(lastScore);
                questionSubScore.push(lastSubScore);
                questionValue.push(lastValue);
                if(questionNum<questionsString.length-1)
                {
                      questionNum++;
                      buttonQuestionBack.text="Вернуться назад";
                }
                else
                {
                                        //Получение итоговых результатов
                    score1+=score11 + score12 + score13 + score14 + score15
                    score2+=score21 + score22 + score23 + score24 + score25
                    score3+=score31 + score32 + score33 + score34 + score35
                    score4+=score41 + score42 + score43 + score44 + score45
                    score5+=score51 + score52 + score53 + score54 + score55

                    displayResult.visible=true;                          //Вывод результатов теста

                    graphScore1.visible=true;
                    graphScore11.visible=true;
                    graphScore12.visible=true;
                    graphScore13.visible=true;
                    graphScore14.visible=true;
                    graphScore15.visible=true;

                    graphScore2.visible=true;
                    graphScore21.visible=true;
                    graphScore22.visible=true;
                    graphScore23.visible=true;
                    graphScore24.visible=true;
                    graphScore25.visible=true;

                    graphScore3.visible=true;
                    graphScore31.visible=true;
                    graphScore32.visible=true;
                    graphScore33.visible=true;
                    graphScore34.visible=true;
                    graphScore35.visible=true;

                    graphScore4.visible=true;
                    graphScore41.visible=true;
                    graphScore42.visible=true;
                    graphScore43.visible=true;
                    graphScore44.visible=true;
                    graphScore45.visible=true;

                    graphScore5.visible=true;
                    graphScore51.visible=true;
                    graphScore52.visible=true;
                    graphScore53.visible=true;
                    graphScore54.visible=true;
                    graphScore55.visible=true;

                    displayExplanationScore.visible=true;
                    displayExplanation1Row.visible=true;
                    displayExplanation2Row.visible=true;
                    displayExplanation3Row.visible=true;
                    displayExplanation4Row.visible=true;
                    displayExplanation5Row.visible=true;

                    displayQuestion.visible=false;
                    displayQuestionNum.visible=false;
                    graphQuestionNum.visible=false;
                    buttonQuestionBack.text="Выйти из теста"
                    testEnd=1;
                    buttonRow.visible=false;

                    if(database.checkID())                                       //Проверить, существует ли ID пользователя в БД
                    {
                        database.updateTable(score1,score2,score3,score4,score5, user_id);  //Изменение уже существующей записи
                    }
                    else
                    {
                        database.insertIntoTable(score1,score2,score3,score4,score5,user_id);    //Добавить новую запись
                    }
                }
            }
        }
    }
}

}
