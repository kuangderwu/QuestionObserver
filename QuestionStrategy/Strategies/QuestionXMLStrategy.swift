//
//  QuestionXMLStrategy.swift
//  QuestionStrategy
//
//  Created by apple on 2018/10/7.
//  Copyright © 2018 Kuang-Der Wu. All rights reserved.
//

import Foundation
import UIKit
import CoreData
// Home work!

// https://stackoverflow.com/questions/31083348/parsing-xml-from-url-in-swift/31084545#31084545

class QuestionXMLStrategy: QuestionStrategy {
   
    
    var questions: [Question] = [Question]()
    
    var questionIndex: Int = 0
    
    required init(fileName: String) {
        //TODO: How to convert from JSON file to questions
        
    
    }
    
    func nextQuestion() -> Question {
        return Question(text: "", point: 10, answer: true)
    }
    
    
    
    func getDataFrom(url: URL, completion: @escaping (_ data: Data?, _ error: Error?)->()) {
        
        let session = URLSession(configuration: .default)
        
        let download = session.dataTask(with: url) { data, response, error in
            
            completion(data, error)
            
        }
        
        download.resume()
        
    }
    /*
  func  getDataFrom(url: url) { data, error in
    
        guard let data = data else {
        return
        }
    
        let parser = XMLParser(data: data)
        parser.delegate = self
    
        if parser.parse() {
        
        print(self.results)
        
        }
    
    } */
    
    // a few constants that identify what element names we're looking for inside the XML
    
    let recordKey = "record"
    let dictionaryKeys = ["EmpName", "EmpPhone", "EmpEmail", "EmpAddress", "EmpAddress1"]
    
    // a few variables to hold the results as we parse the XML
    
    var results: [[String: String]]!         // the whole array of dictionaries
    var currentDictionary: [String: String]! // the current dictionary
    var currentValue: String?
    
    // start element
    //
    // - If we're starting a "record" create the dictionary that will hold the results
    // - If we're starting one of our dictionary keys, initialize `currentValue` (otherwise leave `nil`)
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        if elementName == recordKey {
            
            self.currentDictionary = [String : String]()
            
        } else if dictionaryKeys.contains(elementName) {
            
            self.currentValue = String()
            
        }
        
    }
    
    // found characters
    //
    // - If this is an element we care about, append those characters.
    // - If `currentValue` still `nil`, then do nothing.
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        self.currentValue? += string
        
    }
    
    // end element
    //
    // - If we're at the end of the whole dictionary, then save that dictionary in our array
    // - If we're at the end of an element that belongs in the dictionary, then save that value in the dictionary
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == self.recordKey {
            
            self.results.append(self.currentDictionary)
            
            self.currentDictionary = nil
            
        } else if dictionaryKeys.contains(elementName) {
            
            self.currentDictionary[elementName] = currentValue
            
            self.currentValue = nil
            
        }
        
    }
    
    // Just in case, if there's an error, report it. (We don't want to fly blind here.)
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print(parseError)
        
        self.currentValue = nil
        self.currentDictionary = nil
        self.results = nil
    }
    
}
