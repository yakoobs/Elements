//
//  GameManager.swift
//  Elements
//
//  Created by Jakub Sokołowski on 2/2/16.
//  Copyright © 2016 jakub.sokolowski. All rights reserved.
//

import Foundation

final class GameEngine {
    private let elementsManager = ElementsManager()
    private var gameElements = [GameElement]()
    private var currentGameElement: GameElement!
    private let kStartingNumberOfAttempts = 3
    private var playerMistakes = 0
    var points = 0
    
    var attempts: Int {
        return kStartingNumberOfAttempts - playerMistakes
    }

    var query: String {
        return currentGameElement.element.name
    }
    
    var answers: [String] {
        return currentGameElement.answers
    }
    
    var correctAnswer: String {
        return currentGameElement.correctAnswer
    }
    
    var isGameOver: Bool {
        return playerMistakes >= kStartingNumberOfAttempts
    }
    
    private func prepareGameElements() {
        gameElements = elementsManager.elements.map({ GameElement(element:$0, answers: prepareAnswers($0) ) })
        gameElements.shuffle()
    }
    
    private func prepareAnswers(_ element:Element) -> [String] {
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
        return userAnswer == correctAnswer
    }
    
    func userHasAnswered(_ userAnswer: String) -> Bool {
        if isCorrect(userAnswer: userAnswer) {
            points += 1
            return true
        }
        playerMistakes += 1
        return false
    }
}
