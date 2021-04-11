//
//  QuestionsViewController.swift
//  PersonalQuiz
//
//  Created by Larisa on 11.04.2021.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButton: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multiplesLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet var rangedSlider: UISlider!
    
    @IBOutlet var questionProgressView: UIProgressView!
    
    private let questions = Question.getQuestions()
    private var answerChoosen: [Answer] = []
    private var currentAnwers: [Answer] {
        questions[questionIndex].answers
    }
    private var questionIndex = 0
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @IBAction func singleButtonAnswerPressed(_ sender: UIButton) {
        guard let buttonIndex = singleButton.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnwers[buttonIndex]
        answerChoosen.append(currentAnswer)
        nextQustion()
    }
    
    @IBAction func multipleAnswerButtonPressed() {
    }
    @IBAction func rangedAnswerButtonPressed() {
    }
    
}

// MARK: - Private Methods
extension QuestionsViewController {
    private func setupUI() {
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden.toggle()
        }
        let currentQustions = questions[questionIndex]
        questionLabel.text = currentQustions.title
        let totalProgress = Float(questionIndex) / Float(questions.count)
        questionProgressView.setProgress(totalProgress, animated: true)
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        showCurrentAnswers(for: currentQustions.type)
      
    }
    private func showCurrentAnswers(for type: ResponseType) {
        switch type {
        case .single: showSingleStackView(with: currentAnwers)
        case .multiple: showMultipleStackView(with: currentAnwers)
        case .ranged: break
        }
    }
    
    private func showSingleStackView(with answers: [Answer]) {
        singleStackView.isHidden.toggle()
        
        for(button, answer) in zip(singleButton, answers) {
            button.setTitle(answer.title, for: .normal)
            
        }
    }
    
    private func showMultipleStackView(with answers: [Answer]) {
        multipleStackView.isHidden.toggle()
        
        for(label, answers) in zip(multiplesLabels, answers) {
            label.text = answers.title
        }
    }
    
    private func nextQustion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            setupUI()
            return
        }
        
        performSegue(withIdentifier: "showResult", sender: nil)
    }
    
}
