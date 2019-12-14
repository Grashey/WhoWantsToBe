//
//  GameView.swift
//  WhoWantsToBe
//
//  Created by Aleksandr Fetisov on 11.12.2019.
//  Copyright © 2019 Aleksandr Fetisov. All rights reserved.
//

import UIKit

class GameView: UIView {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var gameOverButton: UIButton!
    
    let charArray = ["A: ", "B: ","C: ","D: "]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        gameOverButton.isHidden = true
        gameOverButton.setTitle("Выход", for: .normal)
    }

    func configure(question: String, questionTitle: String, answers: [String], score: Int, isGameOver: Bool) {
        questionLabel.text = question
        scoreLabel.text = "счет: " + String(score)
        roundLabel.text = questionTitle
        
        for i in 0..<buttons.count {
            let button = buttons[i] as UIButton
            button.backgroundColor = .white
            let string = NSAttributedString(string: charArray[i] + answers[i])
            button.setAttributedTitle(string, for: .normal)
        }
        if isGameOver {
            gameOverButton.isHidden = false
            for i in 0..<buttons.count {
                let button = buttons[i] as UIButton
                button.backgroundColor = .lightGray
                button.isEnabled = false
            }
        }
    }
}

