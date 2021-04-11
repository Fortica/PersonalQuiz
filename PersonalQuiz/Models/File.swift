//
//  File.swift
//  PersonalQuiz
//
//  Created by Larisa on 11.04.2021.
//

struct Question {
    let title: String
    let type: ResponseType
    let answers: [Answer]
    
    static func getQuestion() -> [Question] {
        [Question(
            title: "NJKDSNVKDS",
            type: .single,
            answers: [
                Answer(title: "fsjknrs", type: .cat),
                Answer(title: "efersgkj", type: .dog),
                Answer(title: "egege", type: .rabbit),
                Answer(title: "dsgndjks", type: .turtle)
            ]
        )
        ]
    }
    
    
}



struct Answer {
    let title: String
    let type: AnimalType
}


enum ResponseType {
    case single
    case multiple
    case ranged
}



enum AnimalType: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"

    var definition: String {
    }
