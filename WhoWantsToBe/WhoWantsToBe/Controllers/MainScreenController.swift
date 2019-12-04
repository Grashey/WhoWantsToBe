//
//  ViewController.swift
//  WhoWantsToBe
//
//  Created by Aleksandr Fetisov on 03.12.2019.
//  Copyright © 2019 Aleksandr Fetisov. All rights reserved.
//

import UIKit

class MainScreenController: UIViewController {
    
    @IBAction func newGame(_ sender: UIButton) {
//        let gameVC = storyboard?.instantiateViewController(withIdentifier: "GameSceneController") as! GameSceneController
//        self.navigationController?.pushViewController(gameVC, animated: true)
    }
    @IBAction func records(_ sender: UIButton) {
    }
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

