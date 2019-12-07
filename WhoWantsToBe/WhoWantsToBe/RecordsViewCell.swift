//
//  RecordsViewCell.swift
//  WhoWantsToBe
//
//  Created by Aleksandr Fetisov on 07.12.2019.
//  Copyright © 2019 Aleksandr Fetisov. All rights reserved.
//

import UIKit

class RecordsViewCell: UITableViewCell {

    @IBOutlet weak var answers: UILabel!
    @IBOutlet weak var prize: UILabel!
    @IBOutlet weak var hintsUsed: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    public func configure(with: GameSession){
        answers.text = "\(with.correctAnswers)"
        prize.text = "\(with.score)"
        hintsUsed.text = "0 / 3"
        date.text = "\(with.date)"
    }

}
