//
//  ViewController.swift
//  QuizStarterEnhanced
//
//  Created by Joey Devlin on 7/12/18.
//  Copyright © 2018 Brandon&Joey. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    var gameSound: SystemSoundID = 0
    var firstGame = 0
    let questions = QnA()
    var score = 0
    var round = 0
    var usedNumbers = [50]
    let colorsArray = [UIColor.blue,UIColor.red, UIColor.green, UIColor.orange, UIColor.brown, UIColor.cyan, UIColor.darkGray, UIColor.purple, UIColor.yellow]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionText.text = "Welcome To the Game!"
        hideButtons()
        playButton.setTitle("Start Game", for: .normal)
        scoreLabel.isHidden = true
        view.backgroundColor = colorsArray[GKRandomSource.sharedRandom().nextInt(upperBound:colorsArray.count)]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//Labels
    @IBOutlet weak var questionText: UILabel!
    
//Buttons
    @IBOutlet weak var answerOne: UIButton!
    @IBOutlet weak var answerTwo: UIButton!
    @IBOutlet weak var answerThree: UIButton!
    @IBOutlet weak var answerFour: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
 
//Button Hiding/Unhiding Functions
    func unhideButtons() {
        answerOne.isHidden = false
        answerTwo.isHidden = false
        answerThree.isHidden = false
        answerFour.isHidden = false
        playButton.isHidden = true
    }
    
    func hideButtons() {
        answerOne.isHidden = true
        answerTwo.isHidden = true
        answerThree.isHidden = true
        answerFour.isHidden = true
    }
//Main Logic
    //If the play button is pushed
    @IBAction func playGame(_ sender: UIButton) {
        if sender === playButton {
            // Load & Play game sound, set round and score to 0 and start the game
            loadGameStartSound()
            playSound()
            round = 0
            score = 0
            startGame()
        }
    }
    // Creates new instance for the number and checks if its already been used
    func getNumber() -> Int {
        let rawNumber = GKRandomSource.sharedRandom().nextInt(upperBound: questions.questions.count)
        if usedNumbers.contains(rawNumber) {
            getNumber()
            
        }
        else {
            usedNumbers.append(rawNumber)
            number = rawNumber
        }
        return number
    }
    // Create the number var
    var number = 0
    // Grab the number, set the answer buttons and hide the play again button
    func startGame() {
        number = getNumber()
        answerOne.setTitle(questions.possibleAnswers[number][0], for: .normal)
        answerTwo.setTitle(questions.possibleAnswers[number][1], for: .normal)
        answerThree.setTitle(questions.possibleAnswers[number][2], for: .normal)
        answerFour.setTitle(questions.possibleAnswers[number][3], for: .normal)
        unhideButtons()
        scoreLabel.isHidden = false
        scoreLabel.text = "\(score)"
        
        //Change the screen text to match the question[number]
        
        questionText.text = questions.questions[number]
    }
    // When an answer is selected
    @IBAction func checkAnswer(_ sender: UIButton) {
        let answer = questions.answers[number]
        round += 1
        // If the button text "String" matches the question answer "String" , then score +1 & print correct
        if (sender === answerOne && answer == questions.possibleAnswers[number][0]) || (sender === answerTwo && answer == questions.possibleAnswers[number][1]) || (sender === answerThree && answer == questions.possibleAnswers[number][2]) || (sender === answerFour && answer == questions.possibleAnswers[number][3]) {
            questionText.text = "Correct!"
            score += 1
            // Else do this
        }else {
            questionText.text = "Sorry Thats Not The Right Answer!"
        }
        // Stops the game at 10 rounds
        if round > 9 {
        usedNumbers = [50]
         gameOver()
            }
        else {
            loadNextRound(delay: 1)
        }
        
    }
    
    // When the game ends(Above 10 rounds) the play again button is called and other buttons hidden
    func gameOver() {
        hideButtons()
        scoreLabel.text = "\(score)"
        // Screen text shows your score
        questionText.text = "Congrats you scored \(score)!"
        playButton.isHidden = false
        playButton.setTitle("Play Again?", for: .normal)
        
    }
    // Delays the next round from starting
    func loadNextRound(delay seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.startGame()
        }
    }
    // loads the Game sound
    func loadGameStartSound() {
        let path = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundUrl = URL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(soundUrl as CFURL, &gameSound)
    }
    // plays the Game sound
    func playSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    
}


