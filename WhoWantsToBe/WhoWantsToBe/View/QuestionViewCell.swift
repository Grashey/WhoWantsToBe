//
//  QuestionViewCell.swift
//  WhoWantsToBe
//
//  Created by Aleksandr Fetisov on 16.12.2019.
//  Copyright © 2019 Aleksandr Fetisov. All rights reserved.
//

import UIKit

class QuestionViewCell: UITableViewCell {
    
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet var answersTextFields: [UITextField]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with data: [String:[String]]){
        for element in data {
            questionTextField.text = element.key
            for i in 0..<element.value.count {
                answersTextFields[i].text = element.value[i]
            }
        }
    }
    
    func heightForCell() -> CGFloat {
        let questionTextFieldHeioght: CGFloat = 34
        let answersTextFieldsHeight: CGFloat = 34 * 4
        
        return answersTextFieldsHeight + questionTextFieldHeioght
    }
}
