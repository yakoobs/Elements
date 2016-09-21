//
//  GameViewModelTests.swift
//  Elements
//
//  Created by Jakub Sokołowski on 2/8/16.
//  Copyright © 2016 jakub.sokolowski. All rights reserved.
//

import XCTest
@testable import Elements


class GameViewModelTests: XCTestCase {
    var gameViewModel: GameViewModel!
    
    override func setUp() {
        gameViewModel = GameViewModel()
    }
    
    override func tearDown() {
        gameViewModel = nil
    }
    
    
    func testDrawingNextElement() {
        for _ in 1...100 {
            let query = gameViewModel.queryTitle
            gameViewModel.drawNext()
            let secondQuery = gameViewModel.queryTitle
            
            XCTAssertNotEqual(query, secondQuery, "Two drawn queries should not be the same")
        }
    }
    
    func testThatThereAre4Answers() {
        XCTAssertEqual(gameViewModel.answers.count, 4, "There should be 4 answers prepared")
    }
    
    func testThatOneOfTheAnswersIsCorrect() {
        let expectation = self.expectation(description: "correct answer is present")
        for answer in gameViewModel.answers {
            if gameViewModel.isCorrect(answer: answer) {
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 0.1) { (error) -> Void in
            print("There should be at least one correct answer")
        }
    }
}
