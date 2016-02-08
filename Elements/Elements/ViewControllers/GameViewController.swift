//
//  ViewController.swift
//  Elements
//
//  Created by Jakub Sokołowski on 1/28/16.
//  Copyright © 2016 jakub.sokolowski. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    private let viewModel = GameViewModel()
    @IBOutlet weak var queryLabel: UILabel!
    @IBOutlet var answersButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    func setupSubviews() {
        queryLabel.text = viewModel.queryTitle
        for (index,button) in answersButtons.enumerate() {
            button.setTitle(viewModel.answers[index], forState: UIControlState.Normal)
            button.backgroundColor = UIColor.whiteColor()
        }
    }
    
    
    @IBAction func chosenAnswerPressed(sender: UIButton) {
        let answer = sender.currentTitle!
        sender.backgroundColor = viewModel.isAnswerCorrect(answer) ? UIColor.greenColor() : UIColor.redColor()
        
        let seconds = 1.0
        let delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        
        dispatch_after(dispatchTime, dispatch_get_main_queue(), { [unowned self] in
            self.viewModel.drawNext()
            self.setupSubviews()
        })
    }
}

