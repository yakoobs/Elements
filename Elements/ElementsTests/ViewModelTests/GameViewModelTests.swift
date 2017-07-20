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
            if (error != nil) {
                XCTFail("There should be at least one correct answer")
            }
        }
    }
    
    func testThatUserIncorrectAnswerIsDetected() {
        let kTestIncorrectAnswer = "xxxxx"
        let result = gameViewModel.userHasAnswered(kTestIncorrectAnswer)
        XCTAssertFalse(result, "The aswer is not correct")
    }
    
    //Correct answer index
    func testThatCorrectAnswerIndexReturnsCorrectValue() {
        let index = gameViewModel.correctAnswerIndex
        let answer = gameViewModel.answers[index]
        XCTAssertTrue(gameViewModel.isCorrect(answer: answer), "Correct anser index points incorrect answer")
    }
    
    func testThatOtherValuesExceptCorrectAnswerIndexAreIncorrect() {
        let index = gameViewModel.correctAnswerIndex
        for (i, answer) in gameViewModel.answers.enumerated() {
            if i != index {
                XCTAssertFalse(gameViewModel.isCorrect(answer: answer), "All answers with index not equal to correctAnswerIndex should be incorrect")
            }
        }
    }
    
    //Points
    func testThatInitialPointsCounterIsZero() {
        let expectedPointsString = "0"
        XCTAssertEqual(gameViewModel.points, expectedPointsString, "Incorrect initial points string value")
    }
    
    func testThatCorrectAnswersIncreasePointsCounter() {
        var correctAnswer = gameViewModel.answers[gameViewModel.correctAnswerIndex]
        let _ = gameViewModel.userHasAnswered(correctAnswer)
        var expectedPointsValue = "1"
        XCTAssertEqual(gameViewModel.points, expectedPointsValue, "Points value cointer has not increased")
        
        gameViewModel.drawNext()
        
        correctAnswer = gameViewModel.answers[gameViewModel.correctAnswerIndex]
        let _ = gameViewModel.userHasAnswered(correctAnswer)
        expectedPointsValue = "2"
        XCTAssertEqual(gameViewModel.points, expectedPointsValue, "Points value cointer has not increased")
    }
    
    //Next question delay
    func testThatNextDrawDelayTimeIsCorrect() {
        XCTAssertEqual(gameViewModel.nextQuestionDelay, 1.0, "Next question delay time is incorrect")
    }
    
    //Is game over?
    func testThatInitiallyGameIsNotOver() {
        XCTAssertFalse(gameViewModel.isGameOver, "Initially game should not be over")
    }
    
    func testThatAfter3IncorrectAnswersGameIsOver() {
        perform3IncorrectAnswers()
        XCTAssertTrue(gameViewModel.isGameOver, "Game should be over after 3 incorrect answers")
    }
    
    //Attempts
    func testThatInitialNumberOfAttemptsIsEqual3() {
        let expectedNumberOfAttemptsAtTheBeginning = "3"
        XCTAssertEqual(gameViewModel.attempts, expectedNumberOfAttemptsAtTheBeginning, " Incorrect number of attempts at the beginning")
    }
    
    func testThatAfter3IncorrectAnswersNumberOfAttemptsIsEqualZero() {
        let expectedAttemptsString = "0"
        perform3IncorrectAnswers()
        XCTAssertEqual(gameViewModel.attempts, expectedAttemptsString, "Incorrect number of attempts after 3 incorrect answers")
    }
    
    //Helpers
    func perform3IncorrectAnswers() {
        let index = gameViewModel.correctAnswerIndex
        for (i, answer) in gameViewModel.answers.enumerated() {
            if i != index {
                let _ = gameViewModel.userHasAnswered(answer)
            }
        }
    }
}
