//
//  UserQuestionsViewController.swift
//  WhoWantsToBe
//
//  Created by Aleksandr Fetisov on 15.12.2019.
//  Copyright © 2019 Aleksandr Fetisov. All rights reserved.
//

import UIKit

class UserQuestionsViewController: UITableViewController {

    let userData = UserQuestionsBase()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData.base.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserQuestionViewCell.reuseID, for: indexPath) as! UserQuestionViewCell
        let data = userData.base[indexPath.row]
        cell.configure(with: data)
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let data = userData.base[indexPath.row]
        let cell = UserQuestionViewCell()
        let height = cell.heightForCell(with: data)
        return height
    }
   
    override func  tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            userData.base.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }


}
