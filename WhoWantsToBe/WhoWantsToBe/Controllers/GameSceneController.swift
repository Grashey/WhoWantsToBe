//
//  GameSceneController.swift
//  WhoWantsToBe
//
//  Created by Aleksandr Fetisov on 04.12.2019.
//  Copyright © 2019 Aleksandr Fetisov. All rights reserved.
//

import UIKit

class GameSceneController: UIViewController {

    @IBAction func logOutButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "logOutSegue", sender: self)
        self.dismiss(animated: true, completion: nil)
    }

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    @IBAction func isPressedButton(_ sender: UIButton) {
        isTapped(button: sender)
    }
    
    let questions = QuestionsBase()
    var keyQuestion = String()
    var roundQuestions = [String:[String]]()
    let charArray = ["A: ",  "B: ", "C: ", "D: "]
    
    var round = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        button.backgroundColor = .systemYellow
        let answers = roundQuestions[keyQuestion]
        for i in 0..<buttons.count {
            if button == buttons[i] {
                if button.titleLabel?.text == charArray[i] + (answers?[0] ?? "") {
                    
                    button.backgroundColor = .green
                    sleep(1)
                    round += 1
                    setQuestion()
                } else {
                    sleep(1)
                    button.backgroundColor = .red
                }
            }
        }
    }
    
}

