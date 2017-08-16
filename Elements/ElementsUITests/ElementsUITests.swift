//
//  ElementsUITests.swift
//  ElementsUITests
//
//  Created by Jakub Sokołowski on 1/28/16.
//  Copyright © 2016 jakub.sokolowski. All rights reserved.
//

import XCTest

class ElementsUITests: XCTestCase {
    
    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func testThatAfterNewGameButtonPressedAllElementsArePresent() {
        
        let app = XCUIApplication()
        app.buttons["New Game"].tap()

        XCTAssertTrue(app.staticTexts["pointsLabel"].exists, "Points label should be accessibble on the new game screen")
        
        XCTAssertTrue(app.staticTexts["querryLabel"].exists, "Querry label should be accessibble on the new game screen")
        
        XCTAssertTrue(app.staticTexts["attemptsLabel"].exists, "Points label should be accessibble on the new game screen")
        XCTAssertTrue(app.buttons["firstButton"].exists, "Top left button should be accessibble on the new game screen")
        XCTAssertTrue(app.buttons["secondButton"].exists, "Top right button should be accessibble on the new game screen")
        XCTAssertTrue(app.buttons["thirdButton"].exists, "Bottom left button should be accessibble on the new game screen")
        XCTAssertTrue(app.buttons["fourthButton"].exists, "Bottom right button should be accessibble on the new game screen")
        
    }
    
}
