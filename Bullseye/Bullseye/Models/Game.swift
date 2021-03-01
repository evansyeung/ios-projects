//
//  Game.swift
//  Bullseye
//
//  Created by Evans Yeung on 2/26/21.
//

import Foundation

struct LeaderboardEntry {
    let score: Int
    let date: Date
}

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    var leaderboardEntries: [LeaderboardEntry] = []

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
        addToLeaderboardEntry(points: points)
    }

    mutating func restart() {
        target = Int.random(in: 1...100)
        score = 0
        round = 1
    }

    mutating func addToLeaderboardEntry(points: Int) {
        leaderboardEntries.append(LeaderboardEntry(score: points, date: Date()))
        leaderboardEntries.sort { $0.score > $1.score}
    }
}
