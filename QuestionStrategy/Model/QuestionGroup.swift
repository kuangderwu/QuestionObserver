//
//  QuestionGroup.swift
//  QuestionStrategy
//
//  Created by apple on 2018/10/7.
//  Copyright © 2018 Kuang-Der Wu. All rights reserved.
//

import Foundation

enum SourceType: String {
    case json, xml
}

enum Course: String {
    case math, geography
}

struct QuestionGroup {
    var name: String
    var course: Course
    var sourceType: SourceType
    
}
