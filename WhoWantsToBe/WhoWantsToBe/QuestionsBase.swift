//
//  QuestionsBase.swift
//  WhoWantsToBe
//
//  Created by Aleksandr Fetisov on 04.12.2019.
//  Copyright © 2019 Aleksandr Fetisov. All rights reserved.
//

import Foundation

class QuestionsBase {
    func setThePullOfQuestions(round: Int) -> [String:[String]] {
        let question: [String:[String]]
        switch round {
            case 1:
                question = ["Как правильно закончить пословицу: \"Не откладывай на завтра то, что можно...\"?" : ["сделать сегодня", "сделать послезавтра", "сделать через месяц", "никогда не сделать"],
                             "Как называется знак зодиака?" : ["Стрелец", "Швец", "Жнец", "На дуде игрец"],
                             "Куда не советует плевать русская пословица?" : ["в колодец", "на землю", "в небо", "в потолок"]
            ]
            case 2:
                question = ["Что говорит человек, когда замечает нечто необычное?" : ["бросилось в глаза", "залетело в рот", "попало в лоб", "накапало в уши"],
                             "Какие пирожные можно купить в магазине?" : ["песочные", "алмазные", "цементные", "железобетонные"],
                             "Как называется одна из карточных мастей?" : ["пики", "сабли", "кинжалы", "рапиры"]
            ]
            case 3:
                question = ["Что помогает туристу ориентироваться в незнакомом городе?" : ["путеводитель", "путепровод", "путеукладчик", "путеводная звезда"],
                             "Что говорят в детской игре, когда водящий почти нашел спрятанный предмет?" : ["горячо", "ну а чё", "холодно", "голодно"],
                             "Как во многих сказках величают зайца?" : ["косой", "прямой", "кривой", "хромой"]
            ]
            case 4:
                question = ["Какой наряд прославил баснописец Крылов?" : ["тришкин кафтан", "ивашкин армяк", "прошкин зипун", "машкин сарафан"],
                             "Денежная еденица какой страны называется манат?" : ["Азербайджан", "Армения", "Грузия", "Казахстан"],
                             "Что прежде говорили о человеке незнатного происхождения?" : ["без роду и племени", "без царя в голове", "без руля и ветрил", "без страха и упрека"]
            ]
            case 5:
                question = ["Как звали старшую сестру императора Петра Первого?" : ["Софья", "Вера", "Надежда", "Любовь"],
                             "На кого предлагал замахнуться режиссер самодеятельного театра в фильме \"Берегись автомобиля\"?" : ["на Шекспира", "на Островского", "на Шиллера", "на Лопе де Вега"],
                             "Где обитал призрак в мюзикле Эндрю Ллойда Уэббера?" : ["в опере", "в кинотеатре", "в музее", "в цирке"]
            ]
            case 6:
                question = ["Что не бывает морским?" : ["рельс", "огурец", "гребешок", "узел"],
                             "Каким, по словам Махатмы Ганди, делает мир принцип \"око за око\"?" : ["слепым", "злобным", "враждебным", "безжалостным"],
                             "Сборная какой страны победила на чемпионате мира по футболу, проходившем в России?" : ["Франция", "Аргентина", "Хорватия", "Россия"]
            ]
            case 7:
                question = ["Кого с большим основанием можно назвать островитянами?" : ["алеутов", "эвенков", "чукчей", "якутов"],
                             "Сколько времени провел вне корабля Алексей Леонов во время первого в истории выхода в открытый космос?" : ["12 минут", "2 минуты", "32 минуты", "1 час 2 минуты"],
                             "Чего не обещали корове за мычание в мультфильме \"Пластилиновая ворона\"?" : ["ведро", "телевизор", "ковёр", "седло"]
            ]
            case 8:
                question = ["В какой стране появилась мандолина?" : ["Италия", "Испания", "Венгрия", "Греция"],
                             "Что герой песни \"Степь да степь кругом\" просил товарища передать своей жене?" : ["кольцо", "деньги", "письмо", "наказ"],
                             "Что не относится к бахчевым культурам?" : ["баклажан", "тыква", "патиссон", "кабачок"]
            ]
            case 9:
                question = ["Как жители Лондона прозвали небоскреб Мэри-Экс, спроектированный Норманом Фостером?" : ["корнишон", "баклажан", "кабачок", "патиссон"],
                             "Благодаря кому, если верить историку Сергею Соловьеву, появился фразеологизм \"кондрашка хватил\"?" : ["Булавину", "Разину", "Пугачеву", "Болотникову"],
                             "Кто в 1939 году получил на церемонии вручения \"Оскаров\" сразу 8 статуэток?" : ["Уолт Дисней", "Фрэнк Капра", "Элинор Гриффин", "Джозеф Руттенберг"]
            ]
            case 10:
                question = ["Какой врач первым в истории русской медицины применил гипсовую повязку?" : ["Пирогов", "Субботин", "Боткин", "Склифосовский"],
                              "Что было наклеено на обложку альбома \"Look At Yourself\" британской рок-группы Uriah Heep?" : ["фольга", "чистый лист", "рельеф черепа", "черная бумага"],
                              "Какой язык был родным для русской императрицы Екатерины II ?" : ["немецкий", "русский", "голландский", "французский"]
            ]
            case 11:
                question = ["Где в Древней Греции можно было увидеть надпись: \"Здесь живут мертвые и говорят немые\"?" : ["в библиотеках", "на кладбищах", "в больницах", "в тюрьмах"],
                              "Что в велогонке \"Тур де Франс\" до сих пор сохранилось в память о газете - организаторе первых соревнований?" : ["цвет майки лидера", "количество этапов", "протяженность маршрута", "цветочная церемония"],
                              "Кто из британских музыкантов не возведен в рыцарское достоинство?" : ["Стинг", "Мик Джаггер", "Элтон Джон", "Пол Маккартни"]
            ]
            case 12:
                question = ["Кто был одним из авторов сценария фильма \"Музыкальная история\" с Сергеем Лемешевым в главной роли?" : ["Евгений Петров", "Илья Ильф", "Михаил Зощенко", "Аркадий Аверченко"],
                              "Какую процедуру до 1983 года католическая церковь не признавала законной, если в ней не принимал участие \"адвокат дьявола\"?" : ["канонизация праведника", "индульгенция", "миропомазание", "развод"],
                              "С чем или с кем, по словам испанского писателя Рамона Гомеса де ла Серны, на в коем случае не стоит спорить?" : ["с эхом", "с волком", "с зеркалом", "с младенцем"]
            ]
            case 13:
                question = ["С чем часто охотятся на рыбу протоптера между сезонами дождей?" : ["с лопатами", "с сетями", "с сачками", "с ружьями"],
                              "Какого стихотворения нет у Александра Сергеевича Пушкина?" : ["\"Откровение\"", "\"Желание\"", "\"Наслажденье\"", "\"Блаженство\""],
                              "Кто из этих изобретателей родился не в 1847 году?" : ["Джорж Вестингауз", "Александр Лодыгин", "Павел Яблочков", "Томас Эдисон"]
            ]
            case 14:
                question = ["Каким видом спорта серьезно увлекался французский летчик Ролан Гаррос?" : ["регби", "пинг-понгом", "поло", "гольфом"],
                              "Какому виду спорта посвящена опера чешского композитора Марина Смолки \"Нагано\"?" : ["хоккею с шайбой", "прыжкам с трамплина", "биатлону", "шорт-трэку"],
                              "Какая буква исчезла из русского алфавита в результате реформы Петра I ?" : ["омега", "фита", "ять", "и десятеричное"]
            ]
            case 15:
                question = ["Что такое лобогрейка?" : ["жнейка", "шапка", "болезнь", "печка"],
                              "Какая медаль была вручена Юрию Гагарину первой после полета в космос?" : ["За присвоение целинных земель", "Золотая Звезда", "За трудовую доблесть", "За отвагу"],
                              "Куда подевалась горошина, лежавшая под тюфяками и пуховиками принцессы, в сказке Андерсена?" : ["отдали в кунсткамеру", "сварили в супе", "скормили канарейке", "вставили в корону"]
            ]
            default:
                question = ["Спасибо за игру!" : ["", "", "",""]]
        }
        return question
    }
}