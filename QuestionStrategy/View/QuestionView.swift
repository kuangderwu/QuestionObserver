//
//  QuestionView.swift
//  QuestionStrategy
//
//  Created by apple on 2018/10/7.
//  Copyright © 2018 Kuang-Der Wu. All rights reserved.
//

import UIKit

class QuestionView: UIView {

    var questionLabel: UILabel!
    var nextBtn: UIButton!
    var indexLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
    
        self.backgroundColor = UIColor(red: 22/255, green: 160/255, blue: 133/255, alpha: 1.0)
        
        questionLabel = {
            let label = UILabel()
            label.textColor = UIColor.black
            label.textAlignment = .center
            label.backgroundColor = UIColor.white
            label.font = UIFont.systemFont(ofSize: 24)
            label.layer.cornerRadius = 10
            label.layer.masksToBounds = true
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        nextBtn = {
            let button = UIButton(type: UIButton.ButtonType.system)
            button.layer.cornerRadius = 10
            button.layer.masksToBounds = true
            button.setTitle("NEXT", for: UIControl.State.normal)
            button.setTitleColor(UIColor.white, for: UIControl.State.normal)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
            button.backgroundColor = UIColor.purple
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
    
        indexLabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "1/3"
            label.textColor = UIColor.white
            label.textAlignment = .center
            label.backgroundColor = UIColor.clear
            label.font = UIFont.systemFont(ofSize: 18)
            label.layer.cornerRadius = 10
            label.layer.masksToBounds = true
            return label
        }()
        
        self.addSubview(questionLabel)
        self.addSubview(nextBtn)
        self.addSubview(indexLabel)
        
        NSLayoutConstraint.activate([
            questionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            questionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            questionLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2),
            questionLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8)
            ])
        
        NSLayoutConstraint.activate([
            nextBtn.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 16),
            nextBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            nextBtn.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4),
            nextBtn.heightAnchor.constraint(equalToConstant: 32)
            ])

        NSLayoutConstraint.activate([
            indexLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -32),
            indexLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            indexLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4),
            indexLabel.heightAnchor.constraint(equalToConstant: 32)
            ])
        
    }

}
