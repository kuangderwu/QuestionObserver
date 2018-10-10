//
//  AppSettings.swift
//  QuestionSingleton
//
//  Created by apple on 2018/10/8.
//  Copyright © 2018 Kuang-Der Wu. All rights reserved.
//

import Foundation

class AppSettings {
    
    private init() {}
    static var shared = AppSettings()
    
    private struct Keys {
        static var questionOrderType = "questionOrderType"
    }
    
    var questionOrderType: QuestionOrderType {
        get{
            let userDefaults = UserDefaults.standard
            let rawValue = userDefaults.integer(forKey: Keys.questionOrderType)
            return QuestionOrderType(rawValue: rawValue)!
        }
        set{
            let userDefaults = UserDefaults.standard
            userDefaults.set(newValue.rawValue, forKey: Keys.questionOrderType)
        }
    }
    
}
