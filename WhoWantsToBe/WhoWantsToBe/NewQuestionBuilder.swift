//
//  NewQuestionBuilder.swift
//  WhoWantsToBe
//
//  Created by Aleksandr Fetisov on 21.12.2019.
//  Copyright © 2019 Aleksandr Fetisov. All rights reserved.
//

import Foundation

struct NewQuestion {
    var userQuestion: [String : [String]]
}

class NewQuestionBuilder {
    private(set) var question: String = ""
    private(set) var answers: [String] = []
    
    func build() -> NewQuestion {
        return NewQuestion(userQuestion: [question : answers])
    }
    
    func setQuestion(_ question: String) {
        self.question = question
    }
    
    func setAnswers(_ answers: [String]) {
        self.answers += answers
    }
}

class QuestionSaver {

    func saveQuestion() -> NewQuestion {
        let builder = NewQuestionBuilder()
        builder.setQuestion("Цвет неба?")
        builder.setAnswers(["синий", "красный", "ванильный", "фиолетовый"])
        return builder.build()
    }
}
