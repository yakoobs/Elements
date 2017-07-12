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
    
    private let viewModel = GameViewModel()
    
    //We don't have in WatchKit a method to disable UI for user interactions..
    private var isUIEnabbled = true
    
    override func awake(withContext context: Any?) {
        setupUI()
    }
    
    private func setupUI() {
        buttons.enumerated().forEach { (index, button) in
            button.setBackgroundColor(.darkGray)
            button.setTitle(viewModel.answers[index])
        }
        questionLabel.setText(viewModel.queryTitle)
    }

    //MARK - User did select the answer - buttons handlers
    //It's not possible to send any argument in the WKInterfaceButton's IBAction, so every single button has its own action
    @IBAction func didSelectAnswer1() {
        didSelect(answerAtIndex: 0)
    }
    
    @IBAction func didSelectAnswer2() {
        didSelect(answerAtIndex: 1)
    }
    
    @IBAction func didSelectAnswer3() {
        didSelect(answerAtIndex: 2)
    }
    
    @IBAction func didSelectAnswer4() {
        didSelect(answerAtIndex: 3)
    }
    
    private func didSelect(answerAtIndex index: Int) {
        guard isUIEnabbled else { return }
        isUIEnabbled = false
        buttons[index].setBackgroundColor(.red)
        buttons[viewModel.correctAnswerIndex].setBackgroundColor(.green)
        
        viewModel.drawNext()
        runAfterDelay(seconds: viewModel.nextQuestionDelay) {[weak self] in
            self?.isUIEnabbled = true
            self?.setupUI()
        }
    }
}
