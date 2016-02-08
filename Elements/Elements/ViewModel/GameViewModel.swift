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
    
    init() {
        drawNext()
    }
    
    func drawNext() {
        gameEngine.drawNextGameElement()
    }
    
    var queryTitle: String {
        return gameEngine.query
    }
    
    var answers: [String] {
        return gameEngine.answers
    }
    
    func isAnswerCorrect(answer: String) -> Bool {
        return gameEngine.isUserAnswerCorrect(answer)
    }
}
