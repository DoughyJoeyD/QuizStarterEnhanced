//
//  ViewController.swift
//  QuizStarterEnhanced
//
//  Created by Joey Devlin on 7/12/18.
//  Copyright © 2018 Brandon&Joey. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {

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

    @IBOutlet weak var questionText: UILabel!
    
    
    @IBOutlet weak var answerOne: UIButton!
    @IBOutlet weak var answerTwo: UIButton!
    @IBOutlet weak var answerThree: UIButton!
    @IBOutlet weak var answerFour: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
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
    func prettyButtons() {
        answerOne.backgroundColor = nil
    }
    @IBAction func playGame(_ sender: UIButton) {
        if sender === playButton {
            round = 0
            score = 0
            startGame()
        }
    }
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
    
    var number = 0
    func startGame() {
        number = getNumber()
        answerOne.setTitle(questions.possibleAnswers[number][0], for: .normal)
        answerTwo.setTitle(questions.possibleAnswers[number][1], for: .normal)
        answerThree.setTitle(questions.possibleAnswers[number][2], for: .normal)
        answerFour.setTitle(questions.possibleAnswers[number][3], for: .normal)
        unhideButtons()
        scoreLabel.isHidden = false
        scoreLabel.text = "\(score)"
        
        questionText.text = questions.questions[number]
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        let answer = questions.answers[number]
        round += 1
        if (sender === answerOne && answer == questions.possibleAnswers[number][0]) || (sender === answerTwo && answer == questions.possibleAnswers[number][1]) || (sender === answerThree && answer == questions.possibleAnswers[number][2]) || (sender === answerFour && answer == questions.possibleAnswers[number][3]) {
            questionText.text = "Correct!"
            score += 1
        }else {
            questionText.text = "Sorry Thats Not The Right Answer!"
        }
        if round > 9 {
        usedNumbers = [50]
         gameOver()
            }
        else {
            loadNextRound(delay: 1)
        }
        
    }
    
    func gameOver() {
        hideButtons()
        scoreLabel.text = "\(score)"
        questionText.text = "Congrats you scored \(score)!"
        playButton.isHidden = false
        playButton.setTitle("Play Again?", for: .normal)
        
    }
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
    
}


