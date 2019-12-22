//
//  NewQuestionController.swift
//  WhoWantsToBe
//
//  Created by Aleksandr Fetisov on 16.12.2019.
//  Copyright © 2019 Aleksandr Fetisov. All rights reserved.
//

import UIKit

class NewQuestionController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let userData = UserQuestionsBase()
    var base: [String:[String]] = [:]
    var questionCount = 1
    
    @IBOutlet var newQuestionView: NewQuestionView!
    @IBAction func addQuestion(_ sender: Any) {
        questionCount += 1
        newQuestionView.newQuestionTableView.reloadData()
    }
    
    @IBAction func saveQuestions(_ sender: Any) {
        for i in 0..<questionCount {
            let index = IndexPath(row:0, section: i)
            let cell = newQuestionView.newQuestionTableView.cellForRow(at:index) as! NewQuestionViewCell
            var answers: [String] = []
            for i in 0..<cell.answersTextFields.count {
                answers.append(String(cell.answersTextFields[i].text ?? ""))
            }
            let builder = NewQuestionBuilder()
            builder.setQuestion(String(cell.questionTextField.text ?? ""))
            builder.setAnswers(answers)
            let question = builder.build().userQuestion
            base.merge(question) { (_, new) in new }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.newQuestionView.newQuestionTableView.delegate = self
        self.newQuestionView.newQuestionTableView.dataSource = self
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGR.numberOfTapsRequired = 1
        newQuestionView.addGestureRecognizer(tapGR)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func keyboardWasShown(notification: Notification){
        let info = notification.userInfo as NSDictionary?
        let keyboardSize = (info?.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        
        let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height + 10, right: 0)
        newQuestionView.newQuestionTableView.contentInset = contentInsets
        newQuestionView.newQuestionTableView.scrollIndicatorInsets = contentInsets
    }
    
    @objc private func keyboardWasHidden(notification: Notification){
        let contentInsets = UIEdgeInsets.zero
        newQuestionView.newQuestionTableView.contentInset = contentInsets
        newQuestionView.newQuestionTableView.scrollIndicatorInsets = contentInsets
    }
    
    @objc private func hideKeyboard(){
        self.newQuestionView.endEditing(true)
    }
    
    // MARK: TableView Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        questionCount
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = UIView()
        
        let label = UILabel(frame: CGRect(x: 10, y: 5, width: tableView.frame.size.width, height: 15))
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "Вопрос \(section + 1):"
        header.addSubview(label)
        
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewQuestionViewCell.reuseID, for: indexPath) as! NewQuestionViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = NewQuestionViewCell()
        return cell.heightForCell()
    }
}
