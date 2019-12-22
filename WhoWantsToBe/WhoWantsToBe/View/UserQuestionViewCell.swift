//
//  UserQuestionViewCell.swift
//  WhoWantsToBe
//
//  Created by Aleksandr Fetisov on 16.12.2019.
//  Copyright © 2019 Aleksandr Fetisov. All rights reserved.
//

import UIKit

class UserQuestionViewCell: UITableViewCell {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answerLabels: [UILabel]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configure(with data: [String:[String]]){
        for element in data {
            questionLabel.text = element.key
            for i in 0..<element.value.count {
                answerLabels[i].text = element.value[i]
            }
        }
    }
    
    func heightForCell(with data: [String:[String]]) -> CGFloat {
        var totalHeight: CGFloat = 0
        let indent: CGFloat = 10
        var answerTextHeight: CGFloat = 0
        let questionFont = UIFont.systemFont(ofSize: 15)
        let answerFont = UIFont.systemFont(ofSize: 11)
        let maxWidth = contentView.bounds.width
        for element in data {
            let question = element.key
            let textBlock = CGSize(width: maxWidth, height: CGFloat.greatestFiniteMagnitude)
            let textHeight = question.boundingRect(with: textBlock, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: questionFont], context: nil).height
            for i in 0..<element.value.count {
                let answer = element.value[i]
                let textBlock = CGSize(width: maxWidth / 4, height: CGFloat.greatestFiniteMagnitude)
                let textHeight = answer.boundingRect(with: textBlock, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: answerFont], context: nil).height
                if textHeight > answerTextHeight {
                    answerTextHeight = textHeight
                }
            }
            totalHeight = textHeight + answerTextHeight + indent
        }
        return totalHeight
    }
}
