//
//  GameOverViewController.swift
//  Elements
//
//  Created by Łukasz Sokołowski on 25/05/2017.
//  Copyright © 2017 jakub.sokolowski. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {
    
    var viewModel: GameViewModel?
    
    @IBOutlet weak var finalScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finalScoreLabel.text = viewModel?.points
    }
}
