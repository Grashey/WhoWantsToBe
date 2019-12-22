//
//  EditQuestionController.swift
//  WhoWantsToBe
//
//  Created by Aleksandr Fetisov on 22.12.2019.
//  Copyright © 2019 Aleksandr Fetisov. All rights reserved.
//

import UIKit

class EditQuestionController: UIViewController, UITableViewDelegate, UITableViewDataSource {
      
    var index = Int()
    let rec = UserQuestionCaretaker()
    var data: [Question] = []
    
    @IBOutlet var questionView: QuestionView!

    @IBAction func saveQuestion(_ sender: Any) {
        let index = IndexPath(row:0, section: 0)
        let cell = questionView.questionTableView.cellForRow(at:index) as! QuestionViewCell
        var answers: [String] = []
        for i in 0..<cell.answersTextFields.count {
            answers.append(String(cell.answersTextFields[i].text ?? ""))
        }
        let builder = NewQuestionBuilder()
        builder.setQuestion(String(cell.questionTextField.text ?? ""))
        builder.setAnswers(answers)
        let question = builder.build().userQuestion
        self.data[self.index].questions = question
        rec.saveQuestions(questions: self.data)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = rec.loadQuestions()
        
        self.questionView.questionTableView.delegate = self
        self.questionView.questionTableView.dataSource = self
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGR.numberOfTapsRequired = 1
        questionView.addGestureRecognizer(tapGR)
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
        questionView.questionTableView.contentInset = contentInsets
        questionView.questionTableView.scrollIndicatorInsets = contentInsets
    }
    
    @objc private func keyboardWasHidden(notification: Notification){
        let contentInsets = UIEdgeInsets.zero
        questionView.questionTableView.contentInset = contentInsets
        questionView.questionTableView.scrollIndicatorInsets = contentInsets
    }
    
    @objc private func hideKeyboard(){
        self.questionView.endEditing(true)
    }
    
    // MARK: TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = UIView()
        
        let label = UILabel(frame: CGRect(x: 10, y: 5, width: tableView.frame.size.width, height: 15))
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "Нажмите кнопку \"Save\" по завершению редактирования"
        header.addSubview(label)
        
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: QuestionViewCell.reuseID, for: indexPath) as! QuestionViewCell
        let data = self.data[index].questions
        cell.configure(with: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = QuestionViewCell()
        return cell.heightForCell()
    }
}
