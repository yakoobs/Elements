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
    @IBOutlet weak var attemptsLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    @IBAction func chosenAnswerPressed(_ sender: UIButton) {
        view.isUserInteractionEnabled = false
        
        let answer = sender.currentTitle!
        let isCorrect = viewModel.userHasAnswered(answer)
        sender.backgroundColor = isCorrect ? UIColor.green : UIColor.red
        
        if !isCorrect {
            hilightCorrectAnswer()
        }
        
        drawNextAfterDelay()
    }
}

//MARK: - Private
extension GameViewController {
    fileprivate func setupSubviews() {
        attemptsLabel.text = viewModel.attempts
        pointsLabel.text = viewModel.points
        queryLabel.text = viewModel.queryTitle
        for (index,button) in answersButtons.enumerated() {
            button.setTitle(viewModel.answers[index], for: UIControlState())
            button.backgroundColor = UIColor(colorLiteralRed: 102/255, green: 255/255, blue: 204/255, alpha: 1.0)
        }
        view.isUserInteractionEnabled = true
    }
    
    fileprivate func drawNextAfterDelay() {
        runAfterDelay(seconds: viewModel.nextQuestionDelay) { [weak self] in
            let isOver = self?.viewModel.isGameOver ?? true
            if isOver {
                self?.callGameOverViewController()
            } else {
                self?.viewModel.drawNext()
                self?.setupSubviews()
            }
        }
    }
    
    fileprivate func hilightCorrectAnswer() {
        for button in answersButtons where viewModel.isCorrect(answer: button.currentTitle!) {
            button.backgroundColor = UIColor.green
        }
        
    }
    
    func callGameOverViewController() {
        // here I must add some delay just before Game Over View Controller appear or some smooth animation
        // because transformation between last incorrect answer and "game over!" inscription it's too fast
        performSegue(withIdentifier: "showGameOverSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let gameOverViewController = segue.destination as? GameOverViewController {
            gameOverViewController.viewModel = viewModel
        }
    }
    
}
