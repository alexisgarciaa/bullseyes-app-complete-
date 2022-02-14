//
//  bullseyes_gameTests.swift
//  bullseyes gameTests
//
//  Created by Alexis on 12/2/22.
//

import XCTest
//We nee to import bullseyesapp
@testable import bullseyes_game

class bullseyes_gameTests: XCTestCase {
    var game: Game!

    override func setUpWithError() throws {
      game = Game()
    }

    override func tearDownWithError() throws {
      game = nil
    }

    func  testScorePositive() -> Void {
        let guess = game.target + 5
        let score = game.Point(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    func  testScoreNegative() -> Void {
        let guess = game.target - 5
        let score = game.Point(sliderValue: guess)
        XCTAssertEqual(score, 95)
    }
    
    func TestNewRound() -> Void {
        game.startNewRound (points: 100)
        XCTAssertEqual(game.score, 100)
        XCTAssertEqual(game.round, 2)
    }
    
    func  testScoreExact() -> Void {
        let guess = game.target
        let score = game.Point(sliderValue: guess)
        XCTAssertEqual(score, 200)
    }
    func  testScoreClose() -> Void {
        let guess = game.target + 2
        let score = game.Point(sliderValue: guess)
        XCTAssertEqual(score, 98 + 50)
    }

    func RestartNewRound() -> Void {
        game.startNewRound (points: 100)
        XCTAssertNotEqual(game.score, 0)
        XCTAssertNotEqual(game.round, 1)
        game.restart()
        XCTAssertEqual(game.score, 0)
        XCTAssertEqual(game.round, 1)
    }
    func TestLeaderboard() -> Void {
        game.startNewRound(points: 100)
        XCTAssertEqual(game.leaderboardEntries.count, 1)
        XCTAssertEqual(game.leaderboardEntries[0].score, 100)
        game.startNewRound(points: 200)
        XCTAssertEqual(game.leaderboardEntries.count, 2)
        XCTAssertEqual(game.leaderboardEntries[0].score, 200)
        XCTAssertEqual(game.leaderboardEntries[0].score, 100)
        
    }
}
