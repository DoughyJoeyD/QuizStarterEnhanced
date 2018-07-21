//
//  GetQuestion.swift
//  QuizStarterEnhanced
//
//  Created by Joey Devlin on 7/21/18.
//  Copyright © 2018 Brandon&Joey. All rights reserved.
//

import Foundation
import GameKit

class QuestionPicker {
    
    
    class func getRandomQuestion() -> Question {
        let questions = RawQuestions.getQuestions()
        
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: questions.count)
        
        return questions[randomNumber]
        
    }
    
}

