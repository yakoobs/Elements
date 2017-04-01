//
//  ViewController.swift
//  Elements
//
//  Created by Jakub Sokołowski on 1/28/16.
//  Copyright © 2016 jakub.sokolowski. All rights reserved.
//

import UIKit

final class GameViewController: UIViewController {
    fileprivate let viewModel = GameViewModel()
    @IBOutlet weak var queryLabel: UILabel!
    @IBOutlet var answersButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    

    
    @IBAction func chosenAnswerPressed(_ sender: UIButton) {
        view.isUserInteractionEnabled = false
        
        let answer = sender.currentTitle!
        let isCorrect = viewModel.isCorrect(answer: answer)
        sender.backgroundColor = isCorrect ? UIColor.green : UIColor.red
        
        if !isCorrect { hilightCorrectAnswer() }
        
        drawNextAfterDelay()
    }
}

//MARK: - Private
extension GameViewController {
    fileprivate func setupSubviews() {
        queryLabel.text = viewModel.queryTitle
        for (index,button) in answersButtons.enumerated() {
            button.setTitle(viewModel.answers[index], for: UIControlState())
            button.backgroundColor = UIColor.cyan
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            
        }
        view.isUserInteractionEnabled = true
    }
    
    fileprivate func drawNextAfterDelay() {
        DispatchQueue.main.asyncAfter(deadline: viewModel.dispatchTime, execute: { [weak self] in
            self?.viewModel.drawNext()
            self?.setupSubviews()
        })
    }
    
    fileprivate func hilightCorrectAnswer() {
        for button in answersButtons where viewModel.isCorrect(answer: button.currentTitle!) {
            button.backgroundColor = UIColor.green
        }
    }
}

