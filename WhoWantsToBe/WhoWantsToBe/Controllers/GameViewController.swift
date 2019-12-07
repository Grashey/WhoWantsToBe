//
//  GameViewController.swift
//  WhoWantsToBe
//
//  Created by Aleksandr Fetisov on 04.12.2019.
//  Copyright © 2019 Aleksandr Fetisov. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, GameSessionDelegate {
    
    @IBAction func logOutButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "logOutSegue", sender: self)
        self.dismiss(animated: true, completion: nil)
    }

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    @IBAction func isPressedButton(_ sender: UIButton) {
        isTapped(button: sender)
    }
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var gameOverButton: UIButton!
    
    let prize = [0, 100, 200, 300, 500, 1_000, 2_000, 4_000, 8_000, 16_000, 32_000, 64_000, 125_000, 250_000, 500_000, 1_000_000]
    let questions = QuestionsBase()
    let gameSession = GameSession()
    var keyQuestion = String()
    var roundQuestions = [String:[String]]()
    let charArray = ["A: ",  "B: ", "C: ", "D: "]
    
    var round = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let game = Game.instance
        game.result = gameSession
        print("New ",  game.result.correctAnswers)
        
        gameSession.delegate = self
        gameOverButton.isHidden = true
        setQuestion()
    }
    
    override func viewWillLayoutSubviews() {
        
        buttons.forEach { button in
           button.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
           button.titleLabel?.textAlignment = .left
           button.titleLabel?.numberOfLines = 0
        }
    }
    
    func setQuestion(){
        roundQuestions = questions.setThePullOfQuestions(round: round)
        let round = roundQuestions.enumerated()
        for (index, element) in round {
            roundLabel.text = "Вопрос \(self.round):"
            scoreLabel.text = "счет: " + String(prize[self.round - 1])
            if index == 0 {
                questionLabel.text = element.key
                keyQuestion = element.key
                let answersArray = element.value.shuffled()
                for i in 0..<buttons.count {
                    let button = buttons[i] as UIButton
                    button.backgroundColor = .white
                    button.setTitle(charArray[i] + answersArray[i], for: .normal)
                }
            }
        }
    }
    
    func isTapped(button: UIButton){
        saveData(round: self.round)
        button.backgroundColor = .yellow
        let answers = roundQuestions[keyQuestion]
        for i in 0..<buttons.count {
            if button == buttons[i] {
                if button.titleLabel?.text == charArray[i] + (answers?[0] ?? "") {
                    sleep(1)
                    round += 1
                    setQuestion()
                    if round > 15 {
                        roundLabel.text = "Вы стали миллионером!"
                        questionLabel.text = "Верных ответов: \(round - 1) из 15\nВаш выигрыш: \(self.prize[round - 1]) рублей"
                        gameOverButton.setTitle("Выход", for: .normal)
                        gameOverButton.isHidden = false
                        for i in 0..<buttons.count {
                            let button = buttons[i] as UIButton
                            button.setTitle("", for: .normal)
                            button.isEnabled = false
                        }
                    }
                    
                } else {
                    sleep(1)
                    button.backgroundColor = .red
                    roundLabel.text = "Вы проиграли!"
                    questionLabel.text = "Верных ответов: \(round - 1) из 15\nВаш выигрыш: \(self.prize[round - 1]) рублей"
                    gameOverButton.setTitle("Выход", for: .normal)
                    gameOverButton.isHidden = false
                    for i in 0..<buttons.count {
                        let button = buttons[i] as UIButton
                        button.isEnabled = false
                    }
                    //saveData(round: round)
                }
            }
        }
    }
    
    func saveData(round: Int) {
        gameSession.date = Date()
        gameSession.score = prize[round - 1]
        gameSession.correctAnswers = round - 1
        gameSession.questionCount = 15
        print(Game.instance.result.correctAnswers)
    }
}

