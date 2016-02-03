//
//  GameElement.swift
//  Elements
//
//  Created by Jakub Sokołowski on 2/2/16.
//  Copyright © 2016 jakub.sokolowski. All rights reserved.
//

import Foundation

struct GameElement {
    var element: Element
    var answers: [String]
    var correctAnswer: String {
        return element.symbol
    }
}