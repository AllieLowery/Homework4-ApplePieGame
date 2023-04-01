//
//  ViewController.swift
//  Homework4-ApplePieGame
//
//  Created by Allie Lowery on 3/31/23.
//

import UIKit

class ViewController: UIViewController {

    var listOfWords = ["pizza" , "enchilada" , "coffee" , "elephant" , "television" , "computer" , "smile" , "laughter"]
    
    let incorrectMovesAllowed = 7
    
    var totalWins = 0
    var totalLosses = 0
    var currentGame: Game!
    
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
            let letterString = sender.title(for: .normal)!
            let letter = Character(letterString.lowercased())
            currentGame.playerGuessed(letter: letter)
           
            updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }

    func newRound() {
        let newWord = listOfWords.removeFirst()
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
       
        updateUI()
    }
    
    
    func updateUI() {
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
    
}

