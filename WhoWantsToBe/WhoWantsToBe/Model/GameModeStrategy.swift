//
//  GameModeStrategy.swift
//  WhoWantsToBe
//
//  Created by Aleksandr Fetisov on 15.12.2019.
//  Copyright © 2019 Aleksandr Fetisov. All rights reserved.
//

import Foundation

protocol GameModeStrategy {
    func questionsQueue() -> [Int]
}

class StandartGameModeStrategy: GameModeStrategy {
    func questionsQueue() -> [Int] {
        var roundsQueue: [Int] = []
        for i in 1...15 {
            roundsQueue.append(i)
        }
        return roundsQueue
    }
}

class RandomGameModeStrategy: GameModeStrategy {
    func questionsQueue() -> [Int] {
       var roundsQueue: [Int] = []
            for i in 1...15 {
                roundsQueue.append(i)
            }
        return roundsQueue.shuffled()
        }
}
