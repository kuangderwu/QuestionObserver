//
//  QuestionStrategy.swift
//  QuestionStrategy
//
//  Created by apple on 2018/10/7.
//  Copyright © 2018 Kuang-Der Wu. All rights reserved.
//

import Foundation

@objc protocol QuestionStrategy {
    
    var questions: [Question] { get set }
    var questionIndex: Int { get set }
    
    init(fileName: String)
    
    func nextQuestion() -> Question
}
