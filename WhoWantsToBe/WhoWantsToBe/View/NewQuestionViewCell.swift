//
//  NewQuestionViewCell.swift
//  WhoWantsToBe
//
//  Created by Aleksandr Fetisov on 16.12.2019.
//  Copyright © 2019 Aleksandr Fetisov. All rights reserved.
//

import UIKit

class NewQuestionViewCell: UITableViewCell {
    
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet var answersTextFields: [UITextField]!
    
    let textFont = UIFont.systemFont(ofSize: 14)
    let controller = NewQuestionController()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func heightForCell() -> CGFloat {
        let questionTextFieldHeioght: CGFloat = 34
        let answersTextFieldsHeight: CGFloat = 34 * 4
        
        return answersTextFieldsHeight + questionTextFieldHeioght
    }
}
