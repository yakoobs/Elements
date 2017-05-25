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
    var attempts = 3
    var points: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    @IBAction func chosenAnswerPressed(_ sender: UIButton) {
        view.isUserInteractionEnabled = false
        
        let answer = sender.currentTitle!
        let isCorrect = viewModel.isCorrect(answer: answer)
        sender.backgroundColor = isCorrect ? UIColor.green : UIColor.red
        
        if !isCorrect {
            hilightCorrectAnswer()
             attempts -= 1
            if attempts == 0 {
            callGameOverViewController()
            }
           
        } else {
            points += 1
        }
        
        drawNextAfterDelay()
    }
}

//MARK: - Private
extension GameViewController {
    fileprivate func setupSubviews() {
        attemptsLabel.text = String(attempts)
        pointsLabel.text = String(points)
        queryLabel.text = viewModel.queryTitle
        for (index,button) in answersButtons.enumerated() {
            button.setTitle(viewModel.answers[index], for: UIControlState())
            button.backgroundColor = UIColor(colorLiteralRed: 102/255, green: 255/255, blue: 204/255, alpha: 1.0)
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
    
    func callGameOverViewController() {
        // here I must add some delay just before Game Over View Controller appear or some smooth animation
        // because transformation between last incorrect answer and "game over!" inscription it's too fast
        let gameOverViewController  = self.storyboard?.instantiateViewController(withIdentifier: "gameOver")
            self.present(gameOverViewController!, animated: true, completion: nil)
        }

    }


extension UIView {

       @IBInspectable var cornerRadius: Double {
        get {
            return Double(self.layer.cornerRadius)
        }
        set {
            self.layer.cornerRadius = CGFloat(newValue)
        }
    }
    
       @IBInspectable var borderWidth: Double {
        get {
            return Double(self.layer.borderWidth)
        }
        set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
}









