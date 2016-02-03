//
//  GameManager.swift
//  Elements
//
//  Created by Jakub Sokołowski on 2/2/16.
//  Copyright © 2016 jakub.sokolowski. All rights reserved.
//

import Foundation

class GameEngine {
    private let elementsManager = ElementsManager()
    private var gameElements = [GameElement]()
    
    private func prepareGameElements() {
        gameElements = elementsManager.elements.map({ GameElement(element:$0, answers: prepareAnswers($0) ) })
        gameElements.shuffle()
    }
    
    private func prepareAnswers(element:Element) -> [String] {
        var theOtherElements = elementsManager.elements.filter({$0.symbol != element.symbol})
        theOtherElements.shuffle()
        
        var answers = [element.symbol]
        for _ in 1...3 {
            answers.append(theOtherElements.removeFirst().symbol)
        }
        return answers.shuffled()
    }
    
    func drawNextGameElement() -> GameElement {
        if gameElements.isEmpty {
            prepareGameElements()
        }
        
        return gameElements.removeFirst()
    }
}