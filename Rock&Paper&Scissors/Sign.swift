//
//  Sign.swift
//  Rock&Paper&Scissors
//
//  Created by Alexander Kovzhut on 04.12.2020.
//

import Foundation
import UIKit
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .papper
    } else {
        return .scissors
    }
}


enum Sign {
    case rock, papper, scissors
    
    var emoji: String {
        switch self {
        case .rock:
            return "👊"
        case .papper:
            return "🤚"
        default:
            return "🖖"
        }
}
    func getResult(_ oposite: Sign) -> GameState {
        switch (self, oposite) {
        case (.rock, .rock), (.scissors, .scissors), (.papper, .papper):
            return .draw
        case (.rock, .scissors), (.papper, .rock), (.scissors, .papper):
            return .win
        //default:
        //return .loses
        case (.rock, .papper), (.papper, .scissors), (.scissors, .rock):
            return .loses
        }
}
}



//let rock = "👊"
//let papper = "🤚"
//let scissors = "🖖"
