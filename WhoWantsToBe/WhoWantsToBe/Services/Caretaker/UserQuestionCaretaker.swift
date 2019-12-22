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
    
    func addQuestions(questions: [Question]) {
        var allQuestions = loadQuestions()
        for i in 0..<questions.count{
            let question = questions[i]
            if !allQuestions.contains(question){
                allQuestions.append(question)
            } else {
                print("такой вопрос уже есть")
            }
        }
        do {
            let data = try self.encoder.encode(allQuestions)
            UserDefaults.standard.set(data, forKey: questionsKey)
        } catch {
            print(error)
        }
    }
    
    func saveQuestions(questions: [Question]) {
        do {
            let data = try self.encoder.encode(questions)
            UserDefaults.standard.set(data, forKey: questionsKey)
        } catch {
            print(error)
        }
    }
    
    func loadQuestions() -> [Question] {
        guard let data = UserDefaults.standard.data(forKey: questionsKey) else {
            return []
        }
        do {
            return try self.decoder.decode([Question].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}

struct Question: Codable, Equatable {
    var questions: [String:[String]]
}

