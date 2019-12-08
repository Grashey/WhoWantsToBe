//
//  RecordsTableViewController.swift
//  WhoWantsToBe
//
//  Created by Aleksandr Fetisov on 03.12.2019.
//  Copyright © 2019 Aleksandr Fetisov. All rights reserved.
//

import UIKit

class RecordsViewController: UITableViewController {

    @IBAction func clearRecords(_ sender: Any) {
        rec.clearRecords()
        self.tableView.reloadData()
    }
    
    let rec = RecordsCaretaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rec.retrieveRecords().count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecordsViewCell.reuseID, for: indexPath) as! RecordsViewCell
        let records = rec.retrieveRecords()
        cell.configure(with: records[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = RecordsHeaderView()
        
        let labelWidth = tableView.frame.size.width / 4
        let labelFont = UIFont.systemFont(ofSize: 10)
        
        let labelOne = UILabel(frame: CGRect(x: 0, y: 5, width: labelWidth, height: 18))
        labelOne.font = labelFont
        labelOne.text = "rounds"
        
        let labelTwo = UILabel(frame: CGRect(x: labelWidth , y: 5 , width: labelWidth, height: 18))
        labelTwo.font = labelFont
        labelTwo.text = "money"
        
        let labelThree = UILabel(frame: CGRect(x: labelWidth * 2 , y: 5 , width: labelWidth, height: 18))
        labelThree.font = labelFont
        labelThree.text = "hints"
        
        let labelFour = UILabel(frame: CGRect(x: labelWidth * 3 , y: 5 , width: labelWidth, height: 18))
        labelFour.font = labelFont
        labelFour.text = "date"
        
        header.addSubview(labelOne)
        header.addSubview(labelTwo)
        header.addSubview(labelThree)
        header.addSubview(labelFour)
        
        return header
    }
}
