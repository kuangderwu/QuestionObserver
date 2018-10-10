//
//  QuestionGroupView.swift
//  QuestionStrategy
//
//  Created by apple on 2018/10/7.
//  Copyright © 2018 Kuang-Der Wu. All rights reserved.
//

import UIKit

class QuestionGroupView: UIView {

    var tableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
        tableView = UITableView(frame: self.frame, style: UITableView.Style.plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        self.addSubview(tableView)
    }
}
