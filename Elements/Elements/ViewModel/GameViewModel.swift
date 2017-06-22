//
//  GameViewModel.swift
//  Elements
//
//  Created by Jakub Sokołowski on 2/4/16.
//  Copyright © 2016 jakub.sokolowski. All rights reserved.
//

import Foundation

struct GameViewModel {
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
    
    func isCorrect(answer: String) -> Bool {
        return gameEngine.isCorrect(userAnswer: answer)
    }
    
    func userHasAnswered(_ userAnswer: String) -> Bool {
        return gameEngine.userHasAnswered(userAnswer)
    }
    
    var nextQuestionDelay: Double {
        return 1.0
    }
    
    var isGameOver: Bool {
        return gameEngine.isGameOver
    }
    
    var points: String {
        return String(gameEngine.points)
    }
    
    var attempts: String {
        return String(gameEngine.attempts)
    }
}
