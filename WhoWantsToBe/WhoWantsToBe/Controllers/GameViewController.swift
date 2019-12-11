//
//  GameViewController.swift
//  WhoWantsToBe
//
//  Created by Aleksandr Fetisov on 04.12.2019.
//  Copyright © 2019 Aleksandr Fetisov. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var gameView: GameView!
    
    @IBAction func gameOver(_ sender: UIButton) {
        let rec = RecordsCaretaker()
        let lastResult = Record(date: gameSession.date, score: gameSession.score, correctAnswers: gameSession.correctAnswers, questionCount: gameSession.questionCount, hints: "0 / 3")
        rec.save(records: [lastResult])
    }

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    @IBAction func isPressedButton(_ sender: UIButton) {
        isTapped(button: sender)
    }
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var gameOverButton: UIButton!
    
    let questions = QuestionsBase()
    let gameSession = GameSession()
    var keyQuestion = String()
    var roundQuestions = [String:[String]]()
    let charArray = ["A: ",  "B: ", "C: ", "D: "]
    
    var round = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameSession.delegate = self
        
        let game = Game.instance
        game.result = gameSession
        
        gameOverButton.isHidden = true
        gameOverButton.setTitle("Выход", for: .normal)
        setQuestion()
    }
    
    func setQuestion(){
        roundQuestions = questions.setThePullOfQuestions(round: round)
        let round = roundQuestions.enumerated()
        for (index, element) in round {
            roundLabel.text = "Вопрос \(self.round):"
            scoreLabel.text = "счет: " + String(questions.prize[self.round - 1])
            if index == 0 {
                questionLabel.text = element.key
                keyQuestion = element.key
                let answersArray = element.value.shuffled()
                for i in 0..<buttons.count {
                    let button = buttons[i] as UIButton
                    button.backgroundColor = .white
                    let string = NSAttributedString(string: charArray[i] + answersArray[i])
                    button.setAttributedTitle(string, for: .normal)
                    
                }
            }
        }
    }
    
    func isTapped(button: UIButton){
        let answers = roundQuestions[keyQuestion]
        for i in 0..<buttons.count {
            if button == buttons[i] {
                if button.titleLabel?.text == charArray[i] + (answers?[0] ?? "") {
                    saveData(round: round)
                    sleep(1)
                    if round < 15 {
                        round += 1
                        setQuestion()
                    } else {
                        scoreLabel.text = "счет: " + String(questions.prize[round])
                        roundLabel.text = "Вы стали миллионером!"
                        questionLabel.text = "Верных ответов: \(round) из 15\nВаш выигрыш: \(questions.prize[round]) рублей"
                        gameOverButton.isHidden = false
                        gameOver(gameOverButton)
                        for i in 0..<buttons.count {
                            let button = buttons[i] as UIButton
                            let string = NSAttributedString(string: "")
                            button.setAttributedTitle(string, for: .normal)
                            button.isEnabled = false
                        }
                    }
                    
                } else {
                    saveData(round: round - 1)
                    sleep(1)
                    button.backgroundColor = .red
                    roundLabel.text = "Вы проиграли!"
                    questionLabel.text = "Верных ответов: \(round - 1) из 15\nВаш выигрыш: \(questions.prize[round - 1]) рублей"
                    gameOverButton.isHidden = false
                    gameOver(gameOverButton)
                    for i in 0..<buttons.count {
                        let button = buttons[i] as UIButton
                        button.isEnabled = false
                    }
                }
            }
        }
    }
}

extension GameViewController: GameSessionDelegate {
    
    func saveData(round: Int) {
        gameSession.date = Date()
        gameSession.score = questions.prize[round]
        gameSession.correctAnswers = round
        gameSession.questionCount = round
    }
}

