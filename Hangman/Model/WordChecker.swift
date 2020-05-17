//
//  WordChecker.swift
//  Hangman
//
//  Created by Trevor Williams on 10/16/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import Foundation

class WordChecker {
    
    var currWord: [Character]
    
    init(currentWord str: String) {
        currWord = Array(str)
    }
    
    func wordContains(letter l: Character) -> Bool { //checks if currentWord contains a certain letter
        return currWord.contains(l)
    }
    
    func replace(letter l: Character, guessString str: String) -> String { //if a letter is in currentWord, this updates the "___ ___" word
        let len = str.count
        var guessArr = Array(str)
        for i in 0...(len - 1) {
            if currWord[i] == l {
                guessArr[i] = l
            }
        }
        return String(guessArr)
    }
    
    
}










