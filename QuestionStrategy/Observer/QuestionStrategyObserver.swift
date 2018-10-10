//
//  QuestionStrategyObserver.swift
//  QuestionObserver
//
//  Created by apple on 2018/10/9.
//  Copyright © 2018 Kuang-Der Wu. All rights reserved.
//

import Foundation

// class for Observation Wrapper

class QuestionStrategyObserver: NSObject {
    
    @objc dynamic var strategy: QuestionStrategy
    
    init(strategy: QuestionStrategy) {
        self.strategy = strategy
    }
}
