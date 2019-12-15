//
//  SettingsViewController.swift
//  WhoWantsToBe
//
//  Created by Aleksandr Fetisov on 14.12.2019.
//  Copyright © 2019 Aleksandr Fetisov. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var questionQueue: UISegmentedControl!
    
    private var selectedMode: GameMode {
        switch self.questionQueue.selectedSegmentIndex {
        case 0:
            return .standart
        case 1:
            return .random
        default:
            return .standart
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        Game.instance.gameMode = selectedMode
        print(selectedMode)
        print(questionQueue.selectedSegmentIndex)
    }

}
