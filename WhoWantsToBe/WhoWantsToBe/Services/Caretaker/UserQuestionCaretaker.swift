//
//  UserQuestionCaretaker.swift
//  WhoWantsToBe
//
//  Created by Aleksandr Fetisov on 22.12.2019.
//  Copyright © 2019 Aleksandr Fetisov. All rights reserved.
//

import Foundation

final class UserQuestionCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let questionsKey = "questions"
    
    func saveQuestions(questions: [Questions]) {
        let allQuestions = loadQuestions()
        let newQuestions = allQuestions + questions
        do {
            let data = try self.encoder.encode(newQuestions)
            UserDefaults.standard.set(data, forKey: questionsKey)
        } catch {
            print(error)
        }
    }
    
    func loadQuestions() -> [Questions] {
        guard let data = UserDefaults.standard.data(forKey: questionsKey) else {
            return []
        }
        do {
            return try self.decoder.decode([Questions].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}

struct Questions: Codable {
    var questions: [String:[String]]
}

