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
        sendData(score: score, answersCount: correctAnswersCount)
        gameView.configure(question: question, questionTitle: questionTitle, answers: answers, score: score, isGameOver: isGameOver)
    }
    
    let questionBase = QuestionsBase()
    var delegate: DataDelegate?
    var gameSession = GameSession()
    
    var question = String()
    var correctAnswer = String()
    var answers = [String]()
    var questionTitle = String()
    var round = Observable<Int>(1)
    var isGameOver = false
    var score = Int()
    var correctAnswersCount = 0
    var gameMode: GameMode = Game.instance.gameMode
    private var gameModeStrategy: GameModeStrategy {
        switch self.gameMode {
            case .standart:
            return StandartGameModeStrategy()
            case .random:
            return RandomGameModeStrategy()
        }
    }

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
            if round.value < 15 {
                round.value += 1
                setRound()
            } else {
                score = questionBase.prize[round.value]
                questionTitle = "Вы стали миллионером!"
                answers = ["","","",""]
                question = "Верных ответов: \(round.value) из 15\nВаш выигрыш: \(questionBase.prize[round.value]) рублей"
                isGameOver = true
            }
        } else {
            questionTitle = "Вы проиграли!"
            question = "Верных ответов: \(round.value - 1) из 15\nВаш выигрыш: \(questionBase.prize[round.value - 1]) рублей"
            isGameOver = true
        }
    }
    
    func setRound(){
        let questionsQueue = gameModeStrategy.questionsQueue()
        let roundQuestions = questionBase.setThePullOfQuestions(round: questionsQueue[round.value-1])
        for (index, element) in roundQuestions.enumerated() {
            score = questionBase.prize[round.value - 1]
            if index == 0 {
                questionTitle = "Вопрос \(round.value):"
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
        gameSession.questionCount = round.value
    }
}
