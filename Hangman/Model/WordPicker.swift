//
//  WordPicker.swift
//  Hangman
//
//  Created by Trevor Williams on 10/16/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import Foundation
    
class WordPicker {
    var phrases : NSArray = []
    
    init() {
        let path = Bundle.main.path(forResource: "phrases", ofType: "plist")
        phrases = NSArray.init(contentsOfFile: path!)!
    }
    
    
    func pickWord() -> String { //picks a random word from phrases and formats it to be displayed
        let wordList = WordPicker()
        let length = phrases.count - 1
        let index = Int.random(in: 0 ... length)
        let picked = Array(wordList.phrases[index] as! String)
        var retArr = [Character]()
        for i in 0...(picked.count - 1) {
            retArr.append(picked[i])
            retArr.append(" ")
        }
        return String(retArr)
    }
   
    
    func hideWord(currentWord word: String) -> String { //puts a word into format "____ ____"
        let arrWord = Array(word)
        let len = arrWord.count
        var retArr = [Character]()
        
        for i in 0...(len - 1) {
            if arrWord[i] != " " {
                retArr.append("_")
            } else {
                retArr.append(" ")
            }
        }
        return String(retArr)
    }
}



