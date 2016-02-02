//
//  GameManager.swift
//  Elements
//
//  Created by Jakub Sokołowski on 2/2/16.
//  Copyright © 2016 jakub.sokolowski. All rights reserved.
//

import Foundation

class GameEngine {
    let elementsManager = ElementsManager()
    private var gameElements = [GameElement]()
    
    private func prepareGameElements() {
        gameElements = elementsManager.elements.map({ GameElement(element:$0, answers: [$0.symbol]) })
        gameElements.forEach { (element) -> () in
            addRandomIncorrectAnswers(element)
        }
        gameElements.shuffle()
    }
    
    private func addRandomIncorrectAnswers(var gameElement:GameElement) {
        let correctSymbol = gameElement.element.symbol
        var theOtherElements = elementsManager.elements.filter({$0.symbol != correctSymbol})
        theOtherElements.shuffle()
        
        var counter = 0
        repeat {
            gameElement.answers.append(theOtherElements.removeFirst().symbol)
            counter++
        }
        while counter < 3
    }
    
    func drawNextGameElement() -> GameElement {
        if gameElements.isEmpty {
            prepareGameElements()
        }
        
        return gameElements.removeFirst()
    }
}