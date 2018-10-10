//
//  Question.swift
//  QuestionStrategy
//
//  Created by apple on 2018/10/7.
//  Copyright © 2018 Kuang-Der Wu. All rights reserved.
//

import Foundation

class Question: NSObject, Decodable {
    
    var questionText: String
    var questionPoint: Int
    var questionAnswer: Bool
    
    init(text: String, point: Int, answer: Bool) {
        self.questionText = text
        self.questionPoint = point
        self.questionAnswer = answer
    }
    
}
