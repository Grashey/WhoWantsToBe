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
    @IBOutlet weak var answerALabel: UILabel!
    @IBOutlet weak var answerBLabel: UILabel!
    @IBOutlet weak var answerCLabel: UILabel!
    @IBOutlet weak var answerDLabel: UILabel!
    
    let questions = QuestionsBase()
    
    var round = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let sessionQuestions = questions.setThePullOfQuestions().enumerated()
        for (index, element) in sessionQuestions {
            if index == 0 {
                questionLabel.text = element.key
                let answersArray = element.value.shuffled()
                answerALabel.text = "A: \(answersArray[0])"
                answerBLabel.text = "B: \(answersArray[1])"
                answerCLabel.text = "C: \(answersArray[2])"
                answerDLabel.text = "D: \(answersArray[3])"
            }
            round += 1
        }
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
