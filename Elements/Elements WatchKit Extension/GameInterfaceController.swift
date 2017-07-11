//
//  GameInterfaceController.swift
//  Elements
//
//  Created by Kuba Sokolowski on 10/07/2017.
//  Copyright © 2017 jakub.sokolowski. All rights reserved.
//

import WatchKit
import Foundation


class GameInterfaceController: WKInterfaceController {
    @IBOutlet var questionLabel: WKInterfaceLabel!

    //MARK - Buttons IBOutlets
    @IBOutlet var answerButton1: WKInterfaceButton!
    @IBOutlet var answerButton2: WKInterfaceButton!
    @IBOutlet var answerButton3: WKInterfaceButton!
    @IBOutlet var answerButton4: WKInterfaceButton!
    
    //WatchKit does not support 'UI collections" so we have to create it on our own
    private var buttons: [WKInterfaceButton] {
        return [answerButton1, answerButton2, answerButton3, answerButton4]
    }
    
    //MARK - User did select the answer - buttons handlers
    //It's not possible to send any argument in the WKInterfaceButton's IBAction, so every single button has its own action
    @IBAction func didSelectAnswer1() {
        
    }
    
    @IBAction func didSelectAnswer2() {
    }
    
    @IBAction func didSelectAnswer3() {
    }
    
    @IBAction func didSelectAnswer4() {
    }
    
    
}
