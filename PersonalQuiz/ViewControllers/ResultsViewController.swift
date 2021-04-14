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
    
    
    var answer: [Answer]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateResult()
        
        navigationItem.hidesBackButton = true
        
    }
}
// MARK: - Private Methods
extension ResultsViewController {
    private func updateResult() {
        
        var arrayAnimal: [AnimalType] = []
        arrayAnimal = answer.map{ $0.type }

        let unicleElement = Array(Set(arrayAnimal.filter({ (i: AnimalType) in arrayAnimal.filter({ $0 == i }).count > 1})))
        
        upditeUI(with: unicleElement)
        
    }
    private func upditeUI(with animal: [AnimalType]) {

        for elementAnimal in animal {
            resultLabel.text = "Вы - \(String(elementAnimal.rawValue))"
            discriptionLabel.text = elementAnimal.definition
        }
    }
}
