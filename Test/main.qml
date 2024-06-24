import QtQuick
import QtQuick.Layouts

Window {
    width: 1330
    height: 780
    visible: true
    color: "Pink"
    title: qsTr("Пятифакторный тест личности")
    property variant questionsString:[                                                           //вопросы теста
        "Мне нравится заниматься физкультурой",
        "Люди считают меня отзывчивым и доброжелательным человеком",
        "Я во всем ценю чистоту и порядок",
        "Меня часто беспокоит мысль, что что-нибудь может случиться",
        "Все новое вызывает у меня  интерес",
        "Если я ничем не занят, то это меня беспокоит",
        "Я стараюсь проявлять  дружелюбие ко всем людям",
        "Моя комната всегда аккуратно прибрана",
        "Иногда я расстраиваюсь из-за пустяков",
        "Мне нравятся неожиданности",
        "Я не могу долго оставаться в неподвижности",
        "Я тактичен по отношения к  другим людям",
        "Я методичен и пунктуален во всем",
        "Мои чувства легко уязвимы и ранимы",
        "Мне не интересно, когда ответ ясен заранее"
    ];
    property variant resultExplanation: [                                                           //Объяснение результата
    "Преобладает экстроверсия - типичные экстраверты отличаются общительностью\nимеют большой круг друзей и знакомых, ощущают потребность общения с людьми.",
    "Преобладает интроверсия - основными особенностями интровертов являются отсутствие уверенности\n в отношении правильности своего поведения и невнимание к происходящим вокруг событиям.",
    "Преобладает привязанность к людям - такие лица испытывают потребность быть рядом с другими людьми.\nКак правило, это добрые, отзывчивые люди, они хорошо понимают других людей.",
    "Преобладает обособленность - такие люди предпочитают держать дистанцию.\nОни избегают общественных поручений, небрежны в выполнении своих обязанностей и обещаний.",
    "Преобладает самоконтроль - выделяются такие черты личности, как добросовестность, ответственность,\nобязательность, точность и аккуратность в делах",
    "Преобладает импульсивность - для такого типа личности характерны естественность поведения,\nбеспечность, склонность к необдуманным поступкам",
    "Преобладает эмоциональная неустойчивость - такие люди чувствуют себя беспомощными, неспособными\nсправиться с жизненными трудностями. Их поведение во многом обусловлено ситуацией.",
    "Преобладает эмоциональная устойчивость - такие люди самодостаточны, уверенны в своих силах,\nэмоционально зрелые, смело смотрящие в лицо фактам,спокойные.",
    "Преобладает экспрессивность - для человека с такой чертой характерно легкое отношение к жизни. \nОн производит впечатление беззаботного и безответственного человека.",
    "Преобладает практичность - человек с выраженной чертой практичности\nпо своему складу реалист, хорошо адаптирован в обыденной жизни.\nОн трезво и реалистично смотрит на жизнь."
    ]
    property int questionNum: 0;                                                                      //номер вопроса

    property int score1: 0;                                                                //Экстраверсия – интроверсия
    property int score11: 0;                                                               //Активность - пассивность
    property int score12: 0;                                                               //Доминирование-подчиненность
    property int score13: 0;                                                               //Общительность - замкнутость
    property int score14: 0;                                                               //Поиск впечатлений - избегание
    property int score15: 0;                                                               //Привлечение внимания - избегание

    property int score2: 0;                                                                 //Привязанность – обособленность
    property int score21: 0;                                                                //Теплота - равнодушие
    property int score22: 0;                                                                //Сотрудничество - соперничеств
    property int score23: 0;                                                                //Доверчивость - подозрительност
    property int score24: 0;                                                                //Понимание - непонимание
    property int score25: 0;                                                                //Уважение других - самоуважени

    property int score3: 0;                                                                //Самоконтроль – импульсивность
    property int score31: 0;                                                               //Аккуратность - неаккуратность
    property int score32: 0;                                                               //Настойчивость - слабоволие
    property int score33: 0;                                                               //Ответственность - безответственность
    property int score34: 0;                                                               //Самоконтроль - импульсивност
    property int score35: 0;                                                               //Предусмотрительность - беспечность

    property int score4: 0;                                                                //Эмоциональная устойчивость – эмоциональная неустойчивость
    property int score41: 0;                                                               //Тревожность - беззаботность
    property int score42: 0;                                                               //Напряженность - расслабленност
    property int score43: 0;                                                               //Депрессивность - эмоциональная комфортность
    property int score44: 0;                                                               //Самокритика - самодостаточность
    property int score45: 0;                                                               //Эмоциональная лабильность - эмоциональная стабильность

    property int score5: 0;                                                                //Экспрессивность – практичность
    property int score51: 0;                                                               //Любопытство - консерватизм
    property int score52: 0;                                                               //Мечтательность - реалистичност
    property int score53: 0;                                                               //Артистичность - неартистичност
    property int score54: 0;                                                               //Сензитивность - нечувствительност
    property int score55: 0;                                                               //Пластичность - ригидность

    property int userSex: 0;                                                            //Пол человека, проходящего тест
    property int testEnd: 0;                                                            //Флаг окончания теста

    Connections{                                                                        //Установка связи с сервером
    ////////////PLACEHOLDER////////////////////////////
    }
Column{
    Text{                                                                                  //вывод номера вопроса на экран пользователя
        id: displayUserQuestion
        x:350
        y:20
        visible: true
        text: "Выберите ваш пол:"
        font.pointSize: 40
    }
    Text{                                                                                  //вывод номера вопроса на экран пользователя
        id: displayQuestionNum
        x:350
        y:20
        visible: false
        text: "Вопрос "+(questionNum+1) +" из "+questionsString.length
        font.pointSize: 40
    }
    Text{                                                                                 //вывод вопроса на экран пользователя
        id: displayQuestion
        x:350
        y:80
        visible:false
        text: questionsString[questionNum]
        font.pointSize: 20
    }
    Text{                                                                                  //вывод номера вопроса на экран пользователя
        id: displayResult
        x:350
        y:10
        visible: false
        text: "Результат теста: " +test1[1]
        font.pointSize: 40
    }
    Text{                                                                                 //вывод результата на экран пользователя
        id: displayResults1
        visible: false
        x:300
        y:80
        text: "1. Экстраверсия – интроверсия: " + score1 +" из 75"
        font.pointSize: 20
    }
    Text{                                                                                 //вывод результата на экран пользователя
        id: displayResults11
        visible: false
        x:300
        y:80
        text: "1.1. Активность - пассивность: " + score1 +" из 75"
        font.pointSize: 20
    }
    Text{                                                                                 //вывод результата на экран пользователя
        id: displayResults12
        visible: false
        x:300
        y:80
        text: "1.2. Экстраверсия – интроверсия: " + score1 +" из 75"
        font.pointSize: 20
    }
    Text{                                                                                 //вывод результата на экран пользователя
        id: displayResults13
        visible: false
        x:300
        y:80
        text: "1.3. Экстраверсия – интроверсия: " + score1 +" из 75"
        font.pointSize: 20
    }
    Text{                                                                                 //вывод результата на экран пользователя
        id: displayResults14
        visible: false
        x:300
        y:80
        text: "1.4. Экстраверсия – интроверсия: " + score1 +" из 75"
        font.pointSize: 20
    }
    Text{                                                                                 //вывод результата на экран пользователя
        id: displayResults15
        visible: false
        x:300
        y:80
        text: "1.5. Экстраверсия – интроверсия: " + score1 +" из 75"
        font.pointSize: 20
    }
    Text{                                                                                 //вывод объяснения результата пользователя
        id: displayExplanation1
        visible: false
        x:300
        y:120
        text: ""
        font.pointSize: 15
    }
    Text{                                                                                 //вывод результата на экран пользователя
        id: displayResults2
        visible: false
        x:300
        y:180
        text: "2. Привязанность – обособленность: " +score2 +" из 75"
        font.pointSize: 20
    }
}
    Text{                                                                                 //вывод объяснения результата пользователя
        id: displayExplanation2
        visible: false
        x:300
        y:220
        text: ""
        font.pointSize: 15
    }
    Text{                                                                                 //вывод результата на экран пользователя
        id: displayResults3
        visible: false
        x:300
        y:280
        text: "3. Самоконтроль – импульсивность: " +score3 +" из 75"
        font.pointSize: 20
    }
    Text{                                                                                 //вывод объяснения результата пользователя
        id: displayExplanation3
        visible: false
        x:300
        y:320
        text: ""
        font.pointSize: 15
    }
    Text{                                                                                 //вывод результата на экран пользователя
        id: displayResults4
        visible: false
        x:300
        y:380
        text: "4. Эмоциональная устойчивость - неустойчивость: " +score4 +" из 75"
        font.pointSize: 20
    }
    Text{                                                                                 //вывод объяснения результата пользователя
        id: displayExplanation4
        visible: false
        x:300
        y:420
        text: ""
        font.pointSize: 15
    }
    Text{                                                                                 //вывод результата на экран пользователя
        id: displayResults5
        visible: false
        x:300
        y:480
        text: "5. Экспрессивность – практичность: " +score5 +" из 75 "
        font.pointSize: 20
    }
    Text{                                                                                 //вывод объяснения результата пользователя
        id: displayExplanation5
        visible: false
        x:300
        y:520
        text: ""
        font.pointSize: 15
    }

    Row{
        y:250
        x:300
        spacing: 200
        Rectangle{                                                                            //кнопка выбора мужского пола
            visible: true
            id:buttonMale
                color: if(buttonMaleMouseArea.containsPress){
                           return "DarkBlue";
                    } else if(buttonMaleMouseArea.containsMouse){
                    return "Blue";
                         }
                           else{
                               return "White";
                           }

                width: 150
                height: 75
                Text{
                    anchors.centerIn: parent
                    text:"Мужчина"
                }
                MouseArea{
                    id:buttonMaleMouseArea
                    anchors.fill:parent
                    hoverEnabled: true
                    onClicked: {
                        buttonMale.visible=false;
                        buttonFemale.visible=false;
                        buttonRow.visible=true;
                        userSex=1;
                        displayUserQuestion.visible=false;
                        displayQuestion.visible=true;
                        displayQuestionNum.visible=true;
                    }
                }
            }

        Rectangle{                                                                            //кнопка выбора женского пола
            visible: true
            id:buttonFemale
                color: if(buttonFemaleMouseArea.containsPress){
                           return "DarkRed";
                    } else if(buttonFemaleMouseArea.containsMouse){
                    return "Red";
                         }
                           else{
                               return "White";
                           }

                width: 150
                height: 75
                Text{
                    anchors.centerIn: parent
                    text:"Женщина"
                }
                MouseArea{
                    id:buttonFemaleMouseArea
                    anchors.fill:parent
                    hoverEnabled: true
                    onClicked: {
                        buttonMale.visible=false;
                        buttonFemale.visible=false;
                        buttonRow.visible=true;
                        userSex=2;
                        displayUserQuestion.visible=false;
                        displayQuestion.visible=true;
                        displayQuestionNum.visible=true;
                    }
                }
            }

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
                        if(questionNum > 0 && questionNum < questionsString.length)       //Вернуться на вопрос назад
                        {
                            questionNum--;
                        }
                        else if(userSex > 0 && questionNum == 0)                                             //Вернуться на экран выбора пола
                        {
                            userSex=0;
                            buttonMale.visible=true;
                            buttonFemale.visible=true;

                            buttonRow.visible=false;
                            displayUserQuestion.visible=true;
                            displayQuestion.visible=false;
                            displayQuestionNum.visible=false;
                        }
                        if(questionNum == 0 || testEnd)                //Выйти из теста
                        {
                            Qt.quit();          //PLACEHOLDER INSERT RETURN TO PREVIOUS PAGE
                        }
                    }
                }
            }
        }


    Row{                                                                            //строка выбора ответов на вопрос
        y:350
        x:300
        spacing: 40
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
                if((questionNum+1)<=15)
                {
                    switch((questionNum+1) % 5)
                    {
                    case 0:
                        score51+=5;
                        break;
                    case 1:
                        score11+=5;
                        break;
                    case 2:
                        score21+=5;
                        break;
                    case 3:
                        score31+=5;
                        break;
                    case 4:
                        score41+=5;
                        break;
                    default:
                        break;
                    }
                }
                if((questionNum+1) > 15 && (questionNum+1) <= 30)
                {
                    switch((questionNum+1) % 5)
                    {
                    case 0:
                        score52+=5;
                        break;
                    case 1:
                        score12+=5;
                        break;
                    case 2:
                        score22+=5;
                        break;
                    case 3:
                        score32+=5;
                        break;
                    case 4:
                        score42+=5;
                        break;
                    default:
                        break;
                    }
                }
                if((questionNum+1) > 30 && (questionNum+1) <= 45)
                {
                    switch((questionNum+1) % 5)
                    {
                    case 0:
                        score53+=5;
                        break;
                    case 1:
                        score13+=5;
                        break;
                    case 2:
                        score23+=5;
                        break;
                    case 3:
                        score33+=5;
                        break;
                    case 4:
                        score43+=5;
                        break;
                    default:
                        break;
                    }
                }
                if((questionNum+1) > 45 && (questionNum+1) <= 60)
                {
                    switch((questionNum+1) % 5)
                    {
                    case 0:
                        score54+=5;
                        break;
                    case 1:
                        score14+=5;
                        break;
                    case 2:
                        score24+=5;
                        break;
                    case 3:
                        score34+=5;
                        break;
                    case 4:
                        score44+=5;
                        break;
                    default:
                        break;
                    }
                }
                if((questionNum+1) > 60 && (questionNum+1) <= 75)
                {
                    switch((questionNum+1) % 5)
                    {
                    case 0:
                        score55+=5;
                        break;
                    case 1:
                        score15+=5;
                        break;
                    case 2:
                        score25+=5;
                        break;
                    case 3:
                        score35+=5;
                        break;
                    case 4:
                        score45+=5;
                        break;
                    default:
                        break;
                    }
                }
                if(questionNum<questionsString.length-1)
                {
                      questionNum++;
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
                    displayResults1.visible=true;
                    displayResults2.visible=true;
                    displayResults3.visible=true;
                    displayResults4.visible=true;
                    displayResults5.visible=true;

                    if(score1<=(questionNum/2))                                //Вывод объяснения результатов теста
                        displayExplanation1.text=resultExplanation[0];
                    else
                        displayExplanation1.text=resultExplanation[1];

                    if(score2<=(questionNum/2))
                        displayExplanation2.text=resultExplanation[2];
                    else
                        displayExplanation2.text=resultExplanation[3];

                    if(score3<=(questionNum/2))
                        displayExplanation3.text=resultExplanation[4];
                    else
                        displayExplanation3.text=resultExplanation[5];

                    if(score4<=(questionNum/2))
                        displayExplanation4.text=resultExplanation[6];
                    else
                        displayExplanation4.text=resultExplanation[7];

                    if(score5<=(questionNum/2))
                        displayExplanation5.text=resultExplanation[8];
                    else
                        displayExplanation5.text=resultExplanation[9];

                    displayExplanation1.visible=true;
                    displayExplanation2.visible=true;
                    displayExplanation3.visible=true;
                    displayExplanation4.visible=true;
                    displayExplanation5.visible=true;

                    displayQuestion.visible=false;
                    displayQuestionNum.visible=false;
                    buttonQuestionBack.text="Выйти из теста";
                    testEnd=1;
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
                switch((questionNum+1) % 5)
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
                if(questionNum<questionsString.length-1)
                   {
                         questionNum++;
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
                    displayResults1.visible=true;
                    displayResults2.visible=true;
                    displayResults3.visible=true;
                    displayResults4.visible=true;
                    displayResults5.visible=true;

                    if(score1<=(questionNum/2))                                //Вывод объяснения результатов теста
                        displayExplanation1.text=resultExplanation[0];
                    else
                        displayExplanation1.text=resultExplanation[1];

                    if(score2<=(questionNum/2))
                        displayExplanation2.text=resultExplanation[2];
                    else
                        displayExplanation2.text=resultExplanation[3];

                    if(score3<=(questionNum/2))
                        displayExplanation3.text=resultExplanation[4];
                    else
                        displayExplanation3.text=resultExplanation[5];

                    if(score4<=(questionNum/2))
                        displayExplanation4.text=resultExplanation[6];
                    else
                        displayExplanation4.text=resultExplanation[7];

                    if(score5<=(questionNum/2))
                        displayExplanation5.text=resultExplanation[8];
                    else
                        displayExplanation5.text=resultExplanation[9];

                    displayExplanation1.visible=true;
                    displayExplanation2.visible=true;
                    displayExplanation3.visible=true;
                    displayExplanation4.visible=true;
                    displayExplanation5.visible=true;

                    displayQuestion.visible=false;
                    displayQuestionNum.visible=false;
                    buttonQuestionBack.text="Выйти из теста";
                    testEnd=1;
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
                switch((questionNum+1) % 5)
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
                if(questionNum<questionsString.length-1)
                {
                      questionNum++;
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
                    displayResults1.visible=true;
                    displayResults2.visible=true;
                    displayResults3.visible=true;
                    displayResults4.visible=true;
                    displayResults5.visible=true;

                    if(score1<=(questionNum/2))                                //Вывод объяснения результатов теста
                        displayExplanation1.text=resultExplanation[0];
                    else
                        displayExplanation1.text=resultExplanation[1];

                    if(score2<=(questionNum/2))
                        displayExplanation2.text=resultExplanation[2];
                    else
                        displayExplanation2.text=resultExplanation[3];

                    if(score3<=(questionNum/2))
                        displayExplanation3.text=resultExplanation[4];
                    else
                        displayExplanation3.text=resultExplanation[5];

                    if(score4<=(questionNum/2))
                        displayExplanation4.text=resultExplanation[6];
                    else
                        displayExplanation4.text=resultExplanation[7];

                    if(score5<=(questionNum/2))
                        displayExplanation5.text=resultExplanation[8];
                    else
                        displayExplanation5.text=resultExplanation[9];

                    displayExplanation1.visible=true;
                    displayExplanation2.visible=true;
                    displayExplanation3.visible=true;
                    displayExplanation4.visible=true;
                    displayExplanation5.visible=true;

                    displayQuestion.visible=false;
                    displayQuestionNum.visible=false;
                    buttonQuestionBack.text="Выйти из теста";
                    testEnd=1;
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
                switch((questionNum+1) % 5)
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
                if(questionNum<questionsString.length-1)
                {

                    questionNum++;
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
                    displayResults1.visible=true;
                    displayResults2.visible=true;
                    displayResults3.visible=true;
                    displayResults4.visible=true;
                    displayResults5.visible=true;

                    if(score1<=(questionNum/2))                                //Вывод объяснения результатов теста
                        displayExplanation1.text=resultExplanation[0];
                    else
                        displayExplanation1.text=resultExplanation[1];

                    if(score2<=(questionNum/2))
                        displayExplanation2.text=resultExplanation[2];
                    else
                        displayExplanation2.text=resultExplanation[3];

                    if(score3<=(questionNum/2))
                        displayExplanation3.text=resultExplanation[4];
                    else
                        displayExplanation3.text=resultExplanation[5];

                    if(score4<=(questionNum/2))
                        displayExplanation4.text=resultExplanation[6];
                    else
                        displayExplanation4.text=resultExplanation[7];

                    if(score5<=(questionNum/2))
                        displayExplanation5.text=resultExplanation[8];
                    else
                        displayExplanation5.text=resultExplanation[9];

                    displayExplanation1.visible=true;
                    displayExplanation2.visible=true;
                    displayExplanation3.visible=true;
                    displayExplanation4.visible=true;
                    displayExplanation5.visible=true;

                    displayQuestion.visible=false;
                    displayQuestionNum.visible=false;
                    buttonQuestionBack.text="Выйти из теста";
                    testEnd=1;
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
                switch((questionNum+1) % 5)
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
                if(questionNum<questionsString.length-1)
                {
                      questionNum++;
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
                    displayResults1.visible=true;
                    displayResults2.visible=true;
                    displayResults3.visible=true;
                    displayResults4.visible=true;
                    displayResults5.visible=true;

                    if(score1<=(questionNum/2))                                //Вывод объяснения результатов теста
                        displayExplanation1.text=resultExplanation[0];
                    else
                        displayExplanation1.text=resultExplanation[1];

                    if(score2<=(questionNum/2))
                        displayExplanation2.text=resultExplanation[2];
                    else
                        displayExplanation2.text=resultExplanation[3];

                    if(score3<=(questionNum/2))
                        displayExplanation3.text=resultExplanation[4];
                    else
                        displayExplanation3.text=resultExplanation[5];

                    if(score4<=(questionNum/2))
                        displayExplanation4.text=resultExplanation[6];
                    else
                        displayExplanation4.text=resultExplanation[7];

                    if(score5<=(questionNum/2))
                        displayExplanation5.text=resultExplanation[8];
                    else
                        displayExplanation5.text=resultExplanation[9];

                    displayExplanation1.visible=true;
                    displayExplanation2.visible=true;
                    displayExplanation3.visible=true;
                    displayExplanation4.visible=true;
                    displayExplanation5.visible=true;

                    displayQuestion.visible=false;
                    displayQuestionNum.visible=false;
                    buttonQuestionBack.text="Выйти из теста"
                    testEnd=1;
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
