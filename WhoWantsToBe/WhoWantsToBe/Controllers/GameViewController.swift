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

 
    @IBAction func isPressedButton(_ sender: UIButton) {
        gameSession.checkAnswer(answer: sender.titleLabel!.text!)
        gameView.configure(data: gameSession)
    }

    let questions = QuestionsBase()
    let gameSession = GameSession()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameSession.delegate = self
        
        let game = Game.instance
        game.result = gameSession
        
        gameSession.game()
        gameView.configure(data: gameSession)
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

