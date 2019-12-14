//
//  GameViewController.swift
//  WhoWantsToBe
//
//  Created by Aleksandr Fetisov on 04.12.2019.
//  Copyright © 2019 Aleksandr Fetisov. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, DataDelegate {

    @IBOutlet var gameView: GameView!
    
    @IBAction func gameOver(_ sender: UIButton) {
        let rec = RecordsCaretaker()
        let lastResult = Record(date: gameSession.date, score: gameSession.score, correctAnswers: gameSession.correctAnswers, questionCount: gameSession.questionCount, hints: "0 / 3")
        rec.save(records: [lastResult])
    }

    @IBAction func isPressedButton(_ sender: UIButton) {
        checkAnswer(answer: sender.titleLabel!.text!)
        delegate?.sendData(score: score, answersCount: correctAnswersCount)
        gameView.configure(question: question, questionTitle: questionTitle, answers: answers, score: score, isGameOver: isGameOver)
    }
    
    let questionBase = QuestionsBase()
    var delegate: DataDelegate?
    var gameSession = GameSession()
    
    var question = String()
    var correctAnswer = String()
    var answers = [String]()
    var questionTitle = String()
    var round = 1
    var isGameOver = false
    var score = Int()
    var correctAnswersCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameSession.delegate = self
        Game.instance.result = GameSession()
        setRound()
        gameView.configure(question: question, questionTitle: questionTitle, answers: answers, score: score, isGameOver: isGameOver)
    }
    
    func checkAnswer(answer: String){
        sleep(1)
        if answer.contains(correctAnswer) {
            correctAnswersCount += 1
            if round < 15 {
                round += 1
                setRound()
            } else {
                score = questionBase.prize[round]
                questionTitle = "Вы стали миллионером!"
                answers = ["","","",""]
                question = "Верных ответов: \(round) из 15\nВаш выигрыш: \(questionBase.prize[round]) рублей"
                isGameOver = true
            }
        } else {
            questionTitle = "Вы проиграли!"
            question = "Верных ответов: \(round - 1) из 15\nВаш выигрыш: \(questionBase.prize[round - 1]) рублей"
            isGameOver = true
        }
    }
    
    func setRound(){
         let roundQuestions = questionBase.setThePullOfQuestions(round: round)
         for (index, element) in roundQuestions.enumerated() {
             score = questionBase.prize[round - 1]
             if index == 0 {
                 questionTitle = "Вопрос \(round):"
                 question = element.key
                 correctAnswer = element.value[0]
                 answers = element.value.shuffled()
             }
         }
     }
    
    func sendData(score: Int, answersCount: Int) {
        gameSession.date = Date()
        gameSession.score = score
        gameSession.correctAnswers = answersCount
        gameSession.questionCount = 15
    }
}
