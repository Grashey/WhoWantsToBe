//
//  GameSession.swift
//  WhoWantsToBe
//
//  Created by Aleksandr Fetisov on 07.12.2019.
//  Copyright © 2019 Aleksandr Fetisov. All rights reserved.
//

import Foundation

protocol GameSessionDelegate: class  {
    func saveData(round: Int)
}

class GameSession {
    
    weak var delegate: GameSessionDelegate?
    
    var date = Date()
    var score = Int()
    var correctAnswers = Int()
    var questionCount = Int()

    func saveData(round: Int){
        self.delegate?.saveData(round: round)
    }
}
