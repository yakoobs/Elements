//
//  ElementsLoaderTests.swift
//  Elements
//
//  Created by Jakub Sokołowski on 2/1/16.
//  Copyright © 2016 jakub.sokolowski. All rights reserved.
//

import XCTest
@testable import Elements


class ElementsLoaderTests: XCTestCase {

    var elementsManager: ElementsManager!
    
    override func setUp() {
        super.setUp()
        elementsManager = ElementsManager()
    }
    
    override func tearDown() {
        elementsManager = nil
        super.tearDown()
    }

    func testInitializedManagerContainsAllElements() {
        let kExpectedNumberOfElements = 109 //Based on number of items in Elements.plist
        XCTAssertEqual(elementsManager.elements.count, kExpectedNumberOfElements, "Elements table should contain expected number of items")
    }
    
    func testFirstElementIsTheExpectedOne() {
        let element = elementsManager.elements.first
        let expectedSymbol = "Ac"
        XCTAssertEqual(element?.symbol, expectedSymbol, "Element's symbol is not the same as the expected one")
    }
    
    

}
