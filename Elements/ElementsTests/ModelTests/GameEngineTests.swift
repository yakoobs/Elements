//
//  GameEngineTests.swift
//  Elements
//
//  Created by Jakub Sokołowski on 2/3/16.
//  Copyright © 2016 jakub.sokolowski. All rights reserved.
//

import XCTest
@testable import Elements

class GameEngineTests: XCTestCase {

    var gameEngine: GameEngine!
    
    override func setUp() {
        super.setUp()
        gameEngine = GameEngine()
    }
    
    override func tearDown() {
        gameEngine = nil
        super.tearDown()
    }
    
    func testDrawingASignleGameElement() {
        let gameElement = gameEngine.drawNextGameElement()
        XCTAssertNotNil(gameElement, "Drawn element should not be nil")
    }
    
    func testDrawnGameElementContainsElement() {
        let gameElement = gameEngine.drawNextGameElement()
        XCTAssertNotNil(gameElement.element, "Drawn game element should should contain an element")
    }
    
    func testDrawnGameElementContainsFourAnswers() {
        let gameElement = gameEngine.drawNextGameElement()
        let expectedNumberOfAnswers = 4
        XCTAssertEqual(gameElement.answers.count, expectedNumberOfAnswers, "Expected number of answers should be equal to 4")
    }
    
    func testDrawnGameElementAnswersContainCorrectAnswer() {
        let gameElement = gameEngine.drawNextGameElement()
        let correctAnswer = gameElement.correctAnswer
        XCTAssertTrue(gameElement.answers.contains(correctAnswer), "Answers array should contain correct answer")
    }
    
    func testThatDrawingWorksAfterLargeAmountOfDraws() {
        for _ in 1...9999 {
            gameEngine.drawNextGameElement()
        }
        
        let gameElement = gameEngine.drawNextGameElement()
        XCTAssertNotNil(gameElement, "Drawn element should not be nil")
    }

}
