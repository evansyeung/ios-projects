//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by Evans Yeung on 2/26/21.
//

import XCTest
@testable import Bullseye

class BullseyeTests: XCTestCase {

    // ! defines an optional variable (may or may not have a value)
    var game: Game!

    override func setUpWithError() throws {
        // Create instance of our Game struct
        game = Game()
    }

    override func tearDownWithError() throws {
        game = nil
    }

    func testScorePositive() throws {
        let guess = game.target + 5
        let score = game.calculatePoints(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }

    func testScoreNegative() throws {
        let guess = game.target - 5
        let score = game.calculatePoints(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }

    func testNewRound() throws {
        game.startNewRound(points: 100)
        XCTAssertEqual(game.score, 100)
        XCTAssertEqual(game.round, 2)
    }

    func testScoreExact() throws {
        // If guess was exactly the target, award 100 bonus points
        let guess = game.target
        let score = game.calculatePoints(sliderValue: guess)
        XCTAssertEqual(score, 200)
    }

    func testScoreClose() throws {
        // If guess was 2 away the target, award 50 bonus points
        let guess = game.target + 2
        let score = game.calculatePoints(sliderValue: guess)
        XCTAssertEqual(score, 98 + 50)
    }

    func testRestart() throws {
        // Simulate game has been played
        game.startNewRound(points: 100)
        XCTAssertNotEqual(game.score, 0)
        XCTAssertNotEqual(game.round, 1)

        game.restart()
        XCTAssertEqual(game.score, 0)
        XCTAssertEqual(game.round, 1)
    }

    func testLeaderboard() {
        game.startNewRound(points: 100)
        XCTAssertEqual(game.leaderboardEntries.count, 1)
        XCTAssertEqual(game.leaderboardEntries[0].score, 100)
        game.startNewRound(points: 200)
        XCTAssertEqual(game.leaderboardEntries.count, 2)
        // Leaderboard entries should always be sorted by highest points (first)
        XCTAssertEqual(game.leaderboardEntries[0].score , 200)
    }
}
