//
//  OrderSettingVC.swift
//  QuestionSingleton
//
//  Created by apple on 2018/10/8.
//  Copyright © 2018 Kuang-Der Wu. All rights reserved.
//

import UIKit

class OrderSettingVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var orderSettingView: OrderSettingView!
    var tableView: UITableView!
    var appSetting = AppSettings.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView() // To clear the remaining cell
    }
    
    func setupLayout() {
        orderSettingView = OrderSettingView(frame: self.view.frame)
        orderSettingView.frame = self.view.bounds
        view.addSubview(orderSettingView)
        tableView = orderSettingView.tableView
        orderSettingView.item.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: self, action: #selector(cancelBtnTouched))
    }
    
    @objc func cancelBtnTouched() {
        self.dismiss(animated: true, completion: nil)
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return QuestionOrderType.allCases.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // setting the detault value
        appSetting.questionOrderType = QuestionOrderType.allCases[indexPath.row]
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell", for: indexPath)
        let questionOrderType = QuestionOrderType.allCases[indexPath.row]
        cell.textLabel?.text = questionOrderType.title
        
        if appSetting.questionOrderType == questionOrderType {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    

}
