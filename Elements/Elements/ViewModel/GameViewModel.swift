//
//  GameViewModel.swift
//  Elements
//
//  Created by Jakub Sokołowski on 2/4/16.
//  Copyright © 2016 jakub.sokolowski. All rights reserved.
//

import Foundation

struct GameViewModel {
    fileprivate let gameEngine = GameEngine()
    
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
    
    var dispatchTime: DispatchTime {
        let kSeconds = 1.0
        let delay = kSeconds * Double(NSEC_PER_SEC)
        let dispatchTime = DispatchTime.now() + Double(Int64(delay)) / Double(NSEC_PER_SEC)
        return dispatchTime
    }
}
