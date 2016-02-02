//
//  GameManager.swift
//  Elements
//
//  Created by Jakub Sokołowski on 2/2/16.
//  Copyright © 2016 jakub.sokolowski. All rights reserved.
//

import Foundation

class GameManager {
    let elementsManager = ElementsManager()
    private var gameElements = [GameElement]()
    
    private func prepareGameElements() {
        
    }
    
    func drawNextGameElement() -> GameElement {
        
        //todo: it's just a stub data
        return GameElement(element: Element(dictionary: Dictionary()), answers: [])
    }
}