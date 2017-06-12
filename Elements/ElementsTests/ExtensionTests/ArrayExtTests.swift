//
//  ArrayExtTests.swift
//  Elements
//
//  Created by Łukasz Sokołowski on 11/06/2017.
//  Copyright © 2017 jakub.sokolowski. All rights reserved.
//

import XCTest
@testable import Elements

class ArrayExtTests: XCTestCase {
    
    func testThatSingleElementArrayIsNotChanged() {
        let kTestElement = 1
        var array = [kTestElement]
        array.shuffle()
        
        XCTAssert(array.count == 1, "Array should contain only one element")
        XCTAssert(array[0] == kTestElement, "The element of array is not the same as expected one")
    }
    
}
