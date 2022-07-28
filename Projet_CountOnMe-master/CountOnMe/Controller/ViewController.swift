//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var countOnMe = CountOnMe()
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    var elements: [String] {
        return textView.text.split(separator: " ").map { "\($0)" }
    }
    
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        
        if countOnMe.expressionHaveResult(textviewtext: textView.text) {
            textView.text = ""
        }
        
        textView.text.append(numberText)
    }
    
    private func alertVC(text: String){
        let alertVC = UIAlertController(title: "Zéro!", message: text, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
    
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        if countOnMe.canAddOperator(elements: elements) {
            textView.text.append(" + ")
        } else { alertVC(text: "Un operateur est déja mis !") }
    }
    @IBAction func tappedMultiplicationButton(_ sender: Any) {
        if countOnMe.canAddOperator(elements: elements) {
            textView.text.append(" x ")
        } else { alertVC(text: "Un operateur est déja mis !") }
    }
    @IBAction func tappedDivisionButton(_ sender: Any) {
        if countOnMe.canAddOperator(elements: elements) {
            textView.text.append(" / ")
        } else { alertVC(text: "Un operateur est déja mis !") }
    }
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        if countOnMe.canAddOperator(elements: elements) {
            textView.text.append(" - ")
        } else { alertVC(text: "Un operateur est déja mis !") }
    }

    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard countOnMe.expressionIsCorrect(elements: elements) else { alertVC(text: "Entrez une expression correcte !") }

        guard countOnMe.expressionHaveEnoughElement(elements: elements) else { alertVC(text: "Démarrez un nouveau calcul !") }
        
        // Create local copy of operations
        let operationsToReduce = elements
        
        // Iterate over operations while an operand still here
        
        let operationsToReduceFinal = countOnMe.calculate(temporaryArrayElements: operationsToReduce)
        
        textView.text.append(" = \(operationsToReduceFinal.first!)")
    }

}

