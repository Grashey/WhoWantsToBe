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
    
    private let recordskey = "records"
    private let settingskey = "settings"
    
    func saveRecord(records: [Record]) {
        let allRecords = retrieveRecords()
        let newRecords = allRecords + records
        do {
            let data = try self.encoder.encode(newRecords)
            UserDefaults.standard.set(data, forKey: recordskey)
        } catch {
            print(error)
        }
    }
    
    func retrieveRecords() -> [Record] {
        guard let data = UserDefaults.standard.data(forKey: recordskey) else {
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
        UserDefaults.standard.removeObject(forKey: recordskey)
    }
    
    func saveSettings(settings: [Settings]) {
        do {
            let data = try self.encoder.encode(settings)
            UserDefaults.standard.set(data, forKey: settingskey)
        } catch {
            print(error)
        }
    }
    
    func loadSettings() -> [Settings] {
        guard let data = UserDefaults.standard.data(forKey: settingskey) else {
            return []
        }
        do {
            return try self.decoder.decode([Settings].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}

struct Record: Codable {
    
    var date: Date
    var score: Int
    var correctAnswers: Int
    var questionCount: Int
    var hints: String
}

struct Settings: Codable {
    var gameMode: GameMode
}

