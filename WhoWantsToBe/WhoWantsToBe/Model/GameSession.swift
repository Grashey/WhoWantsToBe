//
//  GameSession.swift
//  WhoWantsToBe
//
//  Created by Aleksandr Fetisov on 07.12.2019.
//  Copyright © 2019 Aleksandr Fetisov. All rights reserved.
//

import Foundation

class GameSession {
    
    func sendData(score: Int, answersCount: Int) { // не вызывается
        delegate?.sendData(score: score, answersCount: answersCount)
    }
    
    weak var delegate: DataDelegate?
    
    var date: Date = Date()
    var score: Int = 0
    var correctAnswers: Int = 0
    var questionCount: Int = 0
    
    private enum CodindKeys: CodingKey {
        case date
        case score
        case correctAnswers
        case questionCount
    }
}

protocol DataDelegate: class {
    func sendData(score: Int, answersCount: Int)
}
