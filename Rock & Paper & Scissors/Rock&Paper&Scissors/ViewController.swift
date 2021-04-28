//
//  ViewController.swift
//  Rock&Paper&Scissors
//
//  Created by Alexander Kovzhut on 04.12.2020.
//

import Foundation
import UIKit
import GameplayKit


class ViewController: UIViewController {
    

    @IBOutlet weak var robotChoise: UIButton!
    @IBOutlet var mainFon: UIView!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resetButton.isHidden = true
    }
    
    func play(_ sign: Sign){
        let computerSign = randomSign()
        robotChoise.setTitle(computerSign.emoji, for: .normal)
        
        switch sign {
        case .rock:
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case .papper:
            rockButton.isHidden = true
            paperButton.isHidden = false
            scissorsButton.isHidden = true
        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = false
        }
        resetButton.isHidden = false
        
        let result = sign.getResult(computerSign)
        
        switch result {
        case .win:
            statusLabel.text = "You are win!!!"
            self.view.backgroundColor = UIColor.blue
        case .loses:
            statusLabel.text = "You are lose!!!"
            self.view.backgroundColor = UIColor.red
        case .draw:
            statusLabel.text = "Its are drow!!!"
            self.view.backgroundColor = UIColor.brown
        case .start:
            reset()
        }
        
    }
    
    func reset () {
        statusLabel.text = "Rock, Paper, Scissors"
        mainFon.backgroundColor = UIColor.darkGray
        
        rockButton.isHidden = false
        paperButton.isHidden = false
        scissorsButton.isHidden = false
        resetButton.isHidden = false
        
        resetButton.isHidden = true
    }
    
     //MARK: -IBAction
    
    @IBAction func rockButtonPressed(_ sender: UIButton) {
        play(.rock)
    }
    @IBAction func paperButtonPressed(_ sender: UIButton) {
        play(.papper)
    }
    @IBAction func scissorsButtonPressed(_ sender: UIButton) {
        play(.scissors)
    }
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        reset()
    }
}

