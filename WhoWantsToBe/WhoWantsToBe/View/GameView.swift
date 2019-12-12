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

    
    func configure(data: GameSession) {
        questionLabel.text = data.question
        scoreLabel.text = "счет: " + String(data.score)
        roundLabel.text = data.questionNumber
        
        for i in 0..<buttons.count {
            let button = buttons[i] as UIButton
            button.backgroundColor = .white
            let string = NSAttributedString(string: charArray[i] + data.answers[i])
            button.setAttributedTitle(string, for: .normal)
        }
        if data.gameOver {
            gameOverButton.isHidden = false
            for i in 0..<buttons.count {
                let button = buttons[i] as UIButton
                button.backgroundColor = .lightGray
                button.isEnabled = false
            }
        }
    }
}

