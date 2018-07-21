//
//  QuestionClass.Swift
//  QuizStarterEnhanced
//
//  Created by Joey Devlin on 7/20/18.
//  Copyright © 2018 Brandon&Joey. All rights reserved.
//

import Foundation


class RawQuestions {
    
    class func getQuestions() -> [Question] {
        return [
        
        Question(question: "The Moon is about how many miles away from the Earth?", possibleAnswers: ["10,000", "1,000,000", "250,000", "500,000"], rightAnswer: "250,000"),
        Question(question: "About how many miles away is the sun, from the earth?", possibleAnswers: ["1 Million", "10 Million", "100 Million", "1 Billion"], rightAnswer: "100 Million"),
        Question(question: "What is the 5th planet from the sun?", possibleAnswers: ["Mars", "Jupiter", "Earth", "Venus"], rightAnswer: "Jupiter"),
        Question(question: "Which planet is the hottest?", possibleAnswers: ["Venus", "Earth", "Neptune", "Uranus"], rightAnswer: "Venus" ),
        Question(question: "What type of galaxy is the most common in the universe?", possibleAnswers: ["Spiral", "Barred Spiral","Irregular", "Elliptical galaxies"], rightAnswer: "Elliptical galaxies"),
        Question(question: "What is the coldest place in the Universe?", possibleAnswers: ["Antarctica", "The Boomerang Nebula", "Mercury", "Chomia L5K"], rightAnswer: "The Boomerang Nebula"),
        Question(question: "What is the hottest place in the known universe?", possibleAnswers: ["The Constellation Virgo", "The Sun", "Death Valley", "Qaynus"], rightAnswer: "The Constellation Virgo"),
        Question(question: "How old is the universe in light years", possibleAnswers: ["13.8 Billion Light Years", "15 Billion Light Years", "100 Billion Light Years", "100 Million Light Years"], rightAnswer: "13.8 Billion Light Years"),
        Question(question: "How many planets are in the Solar System?", possibleAnswers: ["Ten Planets", "Seven Planets", "Eight Planets", "Six Planets"], rightAnswer: "Eight Planets"),
        Question(question: "What is the largest planet in our Solar System?", possibleAnswers: ["Earth", "Mars", "Jupiter", "Venus"], rightAnswer: "Jupiter"),
        Question(question: "What is the smallest planet in our Solar System?", possibleAnswers: ["Earth", "Mercury", "Neptune", "Mars"], rightAnswer: "Mercury"),
        Question(question: "What is the most common type of star in our Galaxy?", possibleAnswers: ["Red Dwarf", "Blue Dwarf", "Blue Supergiant", "Red Supergiant"], rightAnswer: "Red Dwarf"),
        Question(question: "Which type of star is the largest in our Galaxy?", possibleAnswers: ["Red Dwarf", "Blue Dwarf", "Blue Supergiant", "Red Supergiant"], rightAnswer: "Red Supergiant"),
        Question(question: "What is the closest star to our sun?", possibleAnswers: ["Sirius", "Vega", "Deneb", "Proxima Centauri"], rightAnswer: "Proxima Centauri"),
        Question(question: "What has a gravitation pull so strong, not even light can escape it?", possibleAnswers: ["A Planet", "A Star", "A Black Hole", "Your mom"], rightAnswer: "A Black Hole"),
        Question(question: "How many moons does Jupiter have?", possibleAnswers: ["67", "150", "13", "25"], rightAnswer: "67"),
        Question(question: "What flavor ice cream did Baskin-Robbins release in 1969 to ommemorate America's landing on the moon?", possibleAnswers: ["Rocky Road", "MoooonChip", "Lunar Cheesecake", "Outerspace Orange"], rightAnswer: "Lunar Cheesecake")
        ]
    }
    
    
}
