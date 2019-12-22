//
//  UserQuestionsViewController.swift
//  WhoWantsToBe
//
//  Created by Aleksandr Fetisov on 15.12.2019.
//  Copyright © 2019 Aleksandr Fetisov. All rights reserved.
//

import UIKit

class UserQuestionsViewController: UITableViewController {

    let rec = UserQuestionCaretaker()
    var data: [Questions] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //data = rec.loadQuestions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        data = rec.loadQuestions()
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rec.loadQuestions().count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserQuestionViewCell.reuseID, for: indexPath) as! UserQuestionViewCell
        let data = self.data[indexPath.row].questions
        cell.configure(with: data)
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let data = self.data[indexPath.row].questions
        let cell = UserQuestionViewCell()
        let height = cell.heightForCell(with: data)
        return height
    }
   
    override func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let VC = storyboard?.instantiateViewController(withIdentifier: "EditQuestionController") as! EditQuestionController
        VC.index = indexPath.row
        self.navigationController?.pushViewController(VC, animated: true)
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
