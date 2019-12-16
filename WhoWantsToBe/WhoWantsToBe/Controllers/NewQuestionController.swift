//
//  NewQuestionController.swift
//  WhoWantsToBe
//
//  Created by Aleksandr Fetisov on 16.12.2019.
//  Copyright © 2019 Aleksandr Fetisov. All rights reserved.
//

import UIKit

class NewQuestionController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet var newQuestionView: NewQuestionView!
    @IBAction func addQuestion(_ sender: Any) {
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.newQuestionView.newQuestionTableView.delegate = self
        self.newQuestionView.newQuestionTableView.dataSource = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = UIView()
        
        let label = UILabel(frame: CGRect(x: 10, y: 5, width: tableView.frame.size.width, height: 15))
        label.font = UIFont.systemFont(ofSize: 12)
        if section == 0 {
            label.text = "Вопрос:"
            header.addSubview(label)
        } else if section == 1 {
            label.text = "Верный ответ:"
            header.addSubview(label)
        } else {
            label.text = "Альтернативный ответ \(section - 1):"
            header.addSubview(label)
        }
        
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewQuestionViewCell.reuseID, for: indexPath) as! NewQuestionViewCell
        return cell
    }
}
