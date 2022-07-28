//
//  SimpleCalc.swift
//  CountOnMe
//
//  Created by Moltes Touvabien on 08/07/2022.
//  Copyright © 2022 Vincent Saluzzo. All rights reserved.
//

import Foundation
import UIKit

class CountOnMe{
    
    func calculate(temporaryArrayElements: [String]) -> [String]{
        
        var operationsToReduce = temporaryArrayElements
//        var elements: [Any]
        
        enum operand{
            case null
            case addition
            case multiplication
            case division
            case subtraction
            }
        
        while operationsToReduce.count > 1 {
            let left = Int(operationsToReduce[0])!
            let operand = operationsToReduce[1]
            let right = Int(operationsToReduce[2])!
            
            let result: Int
            switch operand {
            case "+": result = left + right
            case "-": result = left - right
            case "x": result = left * right
            case "/": result = left / right
            default: fatalError("Unknown operator !")
            }
            
            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            operationsToReduce.insert("\(result)", at: 0)
            
        }
        return operationsToReduce
    }
    // Error check computed variables
    func expressionIsCorrect(elements: [String])-> Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/"
    }

    func expressionHaveEnoughElement(elements: [String])-> Bool {
        return elements.count >= 3
    }

    func canAddOperator(elements: [String])-> Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/"
    }

    func expressionHaveResult(textviewtext: String)-> Bool {
        return textviewtext.firstIndex(of: "=") != nil
    }
}
