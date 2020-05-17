//
//  HangmanViewController
//  Hangman
//
//  Created by David [Entei] Xiong on 2/19/19.
//  Copyright © 2019 iosdecal. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let picker = WordPicker()
        let pick = picker.pickWord().uppercased()
        currentGuess.text = "Current Guess:"
        currentWord = pick
        wordCheck = WordChecker(currentWord: currentWord)
        correctGuesses.text = picker.hideWord(currentWord: currentWord)
        incorrectString = " "
        incorrectGuesses.text = incorrectString
        hangingImage.image = #imageLiteral(resourceName: "hangman1")
        incorrectCount = 0
        showButtons()
        guessedLettersArr = [UIButton]()
    }
    
    
    
    var guessedLettersArr: [UIButton?] = [] //used for getting buttons back to non-hidden state during restarts
    var wordCheck: WordChecker!
    var currentWord: String = "" //word chosen from Model
    var guessLetter: UIButton! //letter currently chosen
    var incorrectString: String = "" //list of characters guessed already, in string form
    var incorrectCount: Int = 0 //number of incorrect guesses

    @IBOutlet weak var hangingImage: UIImageView! //images depicting state of game
    
    @IBOutlet weak var correctGuesses: UILabel! //either a letter or _, depending on what user has guessed
    
    @IBOutlet weak var incorrectGuesses: UILabel! //label of what has been guessed
    
    @IBOutlet weak var currentGuess: UILabel! //letter of last keyboard button pressed
    
    
    
    
    @IBAction func letterPressed(_ sender: UIButton) { //when user presses keyboard button
        if let letter = sender.titleLabel?.text {
            currentGuess.text = "Current Guess: \(letter)"
            guessLetter = sender
        }
    }
    
    @IBAction func guessPressed(_ sender: UIButton) { //when user guesses a certain letter
        let button = Character(guessLetter.titleLabel!.text!)
        if wordCheck.wordContains(letter: button) { //if letter is in currentWord
            correctGuesses.text = wordCheck.replace(letter: button, guessString: correctGuesses.text!)
            if correctGuesses.text == currentWord {
                performSegue(withIdentifier: "winGame",
                sender: sender)
            }
            
        } else { //if letter is not in currentWord
            incorrectCount += 1
            switch incorrectCount {
            case 1:
                hangingImage.image = #imageLiteral(resourceName: "hangman2")
            case 2:
                hangingImage.image = #imageLiteral(resourceName: "hangman3")
            case 3:
                hangingImage.image = #imageLiteral(resourceName: "hangman4")
            case 4:
                hangingImage.image = #imageLiteral(resourceName: "hangman5")
            case 5:
                hangingImage.image = #imageLiteral(resourceName: "hangman6")
            case 6:
                hangingImage.image = #imageLiteral(resourceName: "hangman7")
                performSegue(withIdentifier: "loseGame",
                sender: sender)
            default:
                hangingImage.image = #imageLiteral(resourceName: "hangman1")
            }
            incorrectStr(button: button)
        }
        guessLetter.isHidden = true
        guessedLettersArr.append(guessLetter)
        currentGuess.text = "Current Guess:  "
    }
    
    func incorrectStr(button str: Character) { //adds an incorrect letter to incorrectGuesses
        if incorrectString == " " {
            incorrectString.append("\(str)")
            incorrectGuesses.text = incorrectString
        } else {
            incorrectString.append(", \(str) ")
            incorrectGuesses.text = incorrectString
        }
    }
    
    @IBAction func exit(_ sender: Any) { //takes user back to main menu
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func restart(_ sender: Any) { //restarts game
        viewDidLoad()
    }
    
    func showButtons() { //unhides buttons during restarts
        for button in guessedLettersArr {
            button?.isHidden = false
        }
    }
}

