//
//  GameSession.swift
//  WhoWantsToBe
//
//  Created by Aleksandr Fetisov on 07.12.2019.
//  Copyright © 2019 Aleksandr Fetisov. All rights reserved.
//

import Foundation

protocol GameSessionDelegate: class {
    func saveData(round: Int)
}

class GameSession {
    
    weak var delegate: GameSessionDelegate?
    
    var date = Date()
    var score = Int()
    var correctAnswers = Int()
    var questionCount = Int()
    
    let questionBase = QuestionsBase()
    
    private enum CodindKeys: CodingKey {
        case date
        case score
        case correctAnswers
        case questionCount
    }
    
    var question = String()
    var correctAnswer = String()
    var answers = [String]()
    var questionNumber = String()
    var round = 1
    var gameOver = false

    func saveData(round: Int){
        self.delegate?.saveData(round: round)
    }
    
    func game(){
        let roundQuestions = questionBase.setThePullOfQuestions(round: round)
        for (index, element) in roundQuestions.enumerated() {
            score = questionBase.prize[round - 1]
            if index == 0 {
                questionNumber = "Вопрос \(round):"
                question = element.key
                correctAnswer = element.value[0]
                answers = element.value.shuffled()
            }
        }
    }

    func checkAnswer(answer: String){
        if answer.contains(correctAnswer) {
            correctAnswers += 1
            sleep(1)
            if round < 15 {
                round += 1
                game()
            } else {
                win()
            }
        } else {
            sleep(1)
            lose()
        }
    }
    
    func win() {
        score = questionBase.prize[round]
        questionNumber = "Вы стали миллионером!"
        answers = ["","","",""]
        question = "Верных ответов: \(round) из 15\nВаш выигрыш: \(questionBase.prize[round]) рублей"
        gameOver = true
    }
    
    func lose() {
        questionNumber = "Вы проиграли!"
        question = "Верных ответов: \(round - 1) из 15\nВаш выигрыш: \(questionBase.prize[round - 1]) рублей"
        gameOver = true
    }
}
