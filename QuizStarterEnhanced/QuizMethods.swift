//
//  QuizMethods.swift
//  QuizStarterEnhanced
//
//  Created by Joey Devlin on 7/21/18.
//  Copyright © 2018 Brandon&Joey. All rights reserved.
//

import Foundation
import AudioToolbox

extension ViewController {


func startGame() {
    scoreLabel.isHidden = false
    round = 0
    score = 0
    loadGameStartSound()
    playSound()
    startRound()
    
    }
    
// Button Methods
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
    
    
// Question/Answer Setting Methods
    func grabQuestion() {
        currentQuestion = QuestionPicker.getRandomQuestion()
        let questionText = currentQuestion?.question
        
        if usedQuestions.contains(questionText!) {
            grabQuestion() }
            
        else {
            usedQuestions.append(questionText!)
        }
    }
    
    func setQuestionText() {
        questionText.text = currentQuestion?.question
        }
    
    func setButtonText() {
        answerOne.setTitle(currentQuestion?.possibleAnswers[0], for: .normal)
        answerTwo.setTitle(currentQuestion?.possibleAnswers[1], for: .normal)
        answerThree.setTitle(currentQuestion?.possibleAnswers[2], for: .normal)
        answerFour.setTitle(currentQuestion?.possibleAnswers[3], for: .normal)
        }
    
// Game Logic
    func startRound() {
        grabQuestion()
        setQuestionText()
        setButtonText()
        scoreLabel.text = String(score)
        
        if round == 0 {
            unhideButtons()
        }
        if round == 10 {
            gameOver()
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

// Game Sounds
    
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

// Round Delay
    
    // Delays the next round from starting
    func loadNextRound(delay seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.startRound()
        }

    }
}
