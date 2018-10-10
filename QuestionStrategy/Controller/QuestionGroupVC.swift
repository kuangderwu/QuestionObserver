//
//  QuestionGroupVC.swift
//  QuestionStrategy
//
//  Created by apple on 2018/10/7.
//  Copyright © 2018 Kuang-Der Wu. All rights reserved.
//

import UIKit

class QuestionGroupVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var questionGroupView: QuestionGroupView!
    var tableView: UITableView!
    var questionGroups: [QuestionGroup] = [QuestionGroup]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        tableView.delegate = self
        tableView.dataSource = self
        
        questionGroups = fakeQuestionGroups()
        updateUI()
    }
    
    func fakeQuestionGroups() -> [QuestionGroup] {
        
        var questionGroup = QuestionGroup(name: "Math", course: .math, sourceType: .json)
        questionGroups.append(questionGroup)
        questionGroup = QuestionGroup(name: "Geography", course: .geography, sourceType: .xml)
        questionGroups.append(questionGroup)

        return questionGroups
    }
    
    
    func updateUI() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func setupLayout() {
        title = "Exam App"
        navigationController?.navigationBar.backgroundColor = UIColor(red: 22/255, green: 160/255, blue: 133/255, alpha: 1.0)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Setting", style: UIBarButtonItem.Style.plain, target: self, action: #selector(settingBtnTouched))
        
        questionGroupView = QuestionGroupView(frame: self.view.frame)
        questionGroupView.frame = self.view.bounds
        view.addSubview(questionGroupView)
        tableView = questionGroupView.tableView
    }
    
    @objc func settingBtnTouched() {
        // call to setting Page        
        let orderSettingVC = OrderSettingVC()
        present(orderSettingVC, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionGroups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = questionGroups[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let questionVC = QuestionVC()
        questionVC.questionGroup = questionGroups[indexPath.row]
        self.show(questionVC, sender: self)
    }

}
