//
//  QuestionJSONStrategy.swift
//  QuestionStrategy
//
//  Created by apple on 2018/10/7.
//  Copyright © 2018 Kuang-Der Wu. All rights reserved.
//

import Foundation

//MARK: Handle the data from JSON file

class QuestionJSONStrategy: NSObject, QuestionStrategy {
    var questions: [Question] = [Question]()
    var currentQuestion: Question!
    
    dynamic var questionIndex: Int = 0
    
    required init(fileName: String) {
        //TODO: How to convert from JSON file to questions
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            let data = try! Data(contentsOf: URL(fileURLWithPath: path), options: Data.ReadingOptions.mappedIfSafe)
            let questionDictionary = try! JSONDecoder().decode([String: [Question]].self, from: data)
            
            if let qs = questionDictionary["questions"] {
                questions = qs
            }
        }
    }
    
    func nextQuestion() -> Question {
        if questionIndex >= questions.count {
            return self.currentQuestion
        }
        self.currentQuestion = questions[questionIndex]
        questionIndex += 1
        return self.currentQuestion
    }
    
}
