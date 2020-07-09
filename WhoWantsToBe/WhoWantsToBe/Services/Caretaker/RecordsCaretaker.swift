//
//  Memento.swift
//  WhoWantsToBe
//
//  Created by Aleksandr Fetisov on 08.12.2019.
//  Copyright © 2019 Aleksandr Fetisov. All rights reserved.
//

import Foundation

final class RecordsCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let recordsKey = "records"
    
    func saveRecord(records: [Record]) {
        let allRecords = retrieveRecords()
        let newRecords = allRecords + records
        do {
            let data = try self.encoder.encode(newRecords)
            UserDefaults.standard.set(data, forKey: recordsKey)
        } catch {
            print(error)
        }
    }
    
    func retrieveRecords() -> [Record] {
        guard let data = UserDefaults.standard.data(forKey: recordsKey) else {
            return []
        }
        do {
            return try self.decoder.decode([Record].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
    func clearRecords() {
        UserDefaults.standard.removeObject(forKey: recordsKey)
    }
}

struct Record: Codable {
    
    var date: Date
    var score: Int
    var correctAnswers: Int
    var questionCount: Int
    var hints: String
}
