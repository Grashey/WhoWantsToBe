//
//  SettingsCaretaker.swift
//  WhoWantsToBe
//
//  Created by Aleksandr Fetisov on 22.12.2019.
//  Copyright © 2019 Aleksandr Fetisov. All rights reserved.
//

import Foundation

final class SettingsCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let settingsKey = "settings"
    
    func saveSettings(settings: [Settings]) {
        do {
            let data = try self.encoder.encode(settings)
            UserDefaults.standard.set(data, forKey: settingsKey)
        } catch {
            print(error)
        }
    }
    
    func loadSettings() -> [Settings] {
        guard let data = UserDefaults.standard.data(forKey: settingsKey) else {
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

struct Settings: Codable {
    var gameMode: GameMode
}
