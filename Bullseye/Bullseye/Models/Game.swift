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

    func points(sliderValue: Int) -> Int {
        // If you have a method that only has a single line of code, you don't need to use the return keyword
        100 - abs(target - sliderValue)
    }
}
