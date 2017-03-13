//
//  GameManager.swift
//  Elements
//
//  Created by Jakub Sokołowski on 2/2/16.
//  Copyright © 2016 jakub.sokolowski. All rights reserved.
//

import Foundation

final class GameEngine {
    fileprivate let elementsManager = ElementsManager()
    fileprivate var gameElements = [GameElement]()
    fileprivate var currentGameElement: GameElement!

    var query: String {
        return currentGameElement.element.name
    }
    
    var answers: [String] {
        return currentGameElement.answers
    }
    
    fileprivate func prepareGameElements() {
        gameElements = elementsManager.elements.map({ GameElement(element:$0, answers: prepareAnswers($0) ) })
        gameElements.shuffle()
    }
    
    fileprivate func prepareAnswers(_ element:Element) -> [String] {
        var theOtherElements = elementsManager.elements.filter({$0.symbol != element.symbol})
        theOtherElements.shuffle()
        
        var answers = [element.symbol]
        for _ in 1...3 {
            answers.append(theOtherElements.removeFirst().symbol)
        }
        
        return answers.shuffled()
    }
    
    func drawNextGameElement(){
        if gameElements.isEmpty {
            prepareGameElements()
        }
        
        currentGameElement = gameElements.removeFirst()
    }
    
    func isCorrect(userAnswer: String) -> Bool {
        return userAnswer == currentGameElement.correctAnswer
    }
}
