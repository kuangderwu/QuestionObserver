//
//  QuestionOrderType.swift
//  QuestionSingleton
//
//  Created by apple on 2018/10/8.
//  Copyright © 2018 Kuang-Der Wu. All rights reserved.
//

import Foundation

enum QuestionOrderType: Int {
    case sequential
    case random
    
    static var allCases: [QuestionOrderType] = [.sequential, .random]
    
    var title: String {
        switch self {
        case .sequential:
            return "Sequential"
        case .random:
            return "Random"
        }
    }
}
