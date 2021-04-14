//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Larisa on 11.04.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var discriptionLabel: UILabel!
    
    @IBOutlet var navigationBarLabel: UINavigationItem!
    
    
    var resultFinishedAnswers: [Answer]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        returnUnicleAnimal(answer: resultFinishedAnswers)
        
        navigationBarLabel.hidesBackButton = true
        
    }
    
    private func returnUnicleAnimal(answer: [Answer]) {
        var arrayAnimal: [AnimalType] = []
        for index in answer {
            let animal = index.type
            arrayAnimal.append(animal)
            }
        let duplicates = Array(Set(arrayAnimal.filter({ (i: AnimalType) in arrayAnimal.filter({ $0 == i }).count > 1})))

        if duplicates.contains(.dog) {
            resultLabel.text = "Вы - \(String(AnimalType.dog.rawValue))"
            discriptionLabel.text = AnimalType.dog.definition
        } else if duplicates.contains(.cat) {
            resultLabel.text = "Вы - \(String(AnimalType.cat.rawValue))"
            discriptionLabel.text = AnimalType.cat.definition
        } else if duplicates.contains(.rabbit) {
            resultLabel.text = "Вы - \(String(AnimalType.rabbit.rawValue))"
            discriptionLabel.text = AnimalType.rabbit.definition
        } else if duplicates.contains(.turtle) {
            resultLabel.text = "Вы - \(String(AnimalType.turtle.rawValue))"
            discriptionLabel.text = AnimalType.turtle.definition
        }
    }
    
}
