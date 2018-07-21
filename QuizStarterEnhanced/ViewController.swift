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
    
    var gameSound: SystemSoundID = 0
    var firstGame = 0
    var score = 0
    var round = 0
    let colorsArray = [UIColor.blue,UIColor.red, UIColor.green, UIColor.orange, UIColor.brown, UIColor.cyan, UIColor.darkGray, UIColor.purple, UIColor.yellow]
    var usedQuestions: [String] = []
    var currentQuestion: Question?
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
 

//Main Logic
    //If the play button is pushed
    @IBAction func playGame(_ sender: UIButton) {
        if sender === playButton {
            startGame()
        }
    }

    // When an answer is selected
    @IBAction func checkAnswer(_ sender: UIButton) {
        let answer = currentQuestion?.rightAnswer
        if (sender === answerOne && answer == currentQuestion?.possibleAnswers[0]) || (sender === answerTwo && answer == currentQuestion?.possibleAnswers[1]) || (sender === answerThree && answer == currentQuestion?.possibleAnswers[2]) || (sender === answerFour && answer == currentQuestion?.possibleAnswers[3]){
            questionText.text = "Correct!"
            score += 1
            // Else do this
        }else {
            questionText.text = "Sorry Thats Not The Right Answer!"
        }
        round += 1
       loadNextRound(delay: 2)
        
    }
    
    
    
}


