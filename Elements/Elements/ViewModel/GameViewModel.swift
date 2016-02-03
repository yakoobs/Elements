//
//  GameViewModel.swift
//  Elements
//
//  Created by Jakub Sokołowski on 2/4/16.
//  Copyright © 2016 jakub.sokolowski. All rights reserved.
//

import Foundation

class GameViewModel {
    private let gameEngine = GameEngine()
    private var currentGameElement: GameElement!
    
    init() {
        drawNextElement()
    }
    
    func drawNextElement() {
        currentGameElement = gameEngine.drawNextGameElement()
    }
    
    var queryTitle: String {
        return currentGameElement.element.name
    }
    
    var answers: [String] {
        return currentGameElement.answers
    }
    
    func isAnswerCorrect(answer: String) -> Bool {
        return answer == currentGameElement.correctAnswer
    }
    
}
