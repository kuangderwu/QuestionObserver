//
//  OrderSettingView.swift
//  QuestionSingleton
//
//  Created by apple on 2018/10/8.
//  Copyright © 2018 Kuang-Der Wu. All rights reserved.
//

import UIKit

class OrderSettingView: UIView {

    var navibar: UINavigationBar!
    var item: UINavigationItem!
    var tableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
  
        navibar = UINavigationBar(frame: CGRect(x: 0, y:40, width: self.frame.size.width, height: 40.0))
        navibar.backgroundColor = UIColor(red: 22/255, green: 160/255, blue: 133/255, alpha: 1.0)
        item = UINavigationItem(title: "Settings")
        navibar.items = [item]
        self.addSubview(navibar)
 
        tableView = {
            let table = UITableView()
            table.register(UITableViewCell.self, forCellReuseIdentifier: "OrderCell")
            table.translatesAutoresizingMaskIntoConstraints = false
            return table
        }()

        self.addSubview(tableView)
 
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: navibar.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
    }
}
