//
//  Game.swift
//  Bullseye
//
//  Created by Evans Yeung on 2/26/21.
//

import Foundation

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1

    func calculatePoints(sliderValue: Int) -> Int {
        // If you have a method that only has a single line of code, you don't need to use the return keyword
        // 100 - abs(target - sliderValue)
        let difference = abs(target - sliderValue)
        var bonus = 0

        if difference == 0 {
            bonus = 100
        }
        else if (difference <= 2) {
            bonus = 50
        }

        return 100 - difference + bonus
    }

    // mutating keyword indicates when you invoke this method, it will change values in the struct itself
    mutating func startNewRound(points: Int) {
        target = Int.random(in: 1...100)
        score += points
        round += 1
    }

    mutating func restart() {
        target = Int.random(in: 1...100)
        score = 0
        round = 1
    }
}
