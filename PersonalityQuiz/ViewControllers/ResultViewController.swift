//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
  
    // MARK: - IB Outlets
    @IBOutlet var animalTypeUILabel: UILabel!
    @IBOutlet var animalDefinitionUILabel: UILabel!
    
    // MARK: - Public Properties
    var answersChosen: [Answer]!

    // MARK: - Private Properties
    private var animalResult: Animal!
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        countAnimals(answers: answersChosen)
        updateTextInUILabels()
    }
}

// MARK: - Private Methods
extension ResultViewController {
    private func countAnimals(answers: [Answer]) {
        
        var animalCounter = [Animal: Int]()
        
        for answer in answers {
            
            if let animalCount = animalCounter[answer.animal] {
                animalCounter.updateValue(animalCount + 1, forKey: answer.animal)
            } else {
                animalCounter[answer.animal] = 1
            }
                
        }
        
        let animalCounterSorted = animalCounter.sorted { $0.value > $1.value }
        guard let animal = animalCounterSorted.first?.key else { return }
        
        animalResult = animal
    }

    private func updateTextInUILabels() {
        animalTypeUILabel.text = "Вы - \(animalResult.rawValue)"
        animalDefinitionUILabel.text = animalResult.definition
    }
}


