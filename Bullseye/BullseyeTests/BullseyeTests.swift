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
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }

    func testScoreNegative() throws {
        let guess = game.target - 5
        let score = game.points(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }

}
