//
//  Game.swift
//  bullseyes game
//
//  Created by Alexis on 12/2/22.
//

import Foundation
struct LeaderboardEntry {
    let score: Int
    let date: Date
}

struct Game {
    var target: Int = Int.random(in: 1...100)
    var score: Int = 0
    var round:Int = 1
    var leaderboardEntries:[LeaderboardEntry] = []
    
    init(loadTestData: Bool = false){
        if loadTestData{
            leaderboardEntries.append(LeaderboardEntry(score: Int.random(in: 60...200), date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: Int.random(in: 60...200), date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: Int.random(in: 60...200), date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: Int.random(in: 60...200), date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: Int.random(in: 60...200), date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: Int.random(in: 60...200), date: Date()))
            
        }
    }
    
    func Point(sliderValue: Int) -> Int {
        
    let difference = abs(target - sliderValue)
        let bonus : Int
        
        if difference == 0 {
            bonus = 100
        } else if difference <= 2{
            bonus = 50
        } else {
            bonus = 0
        }
        
       return 100 - difference + bonus
    }
    mutating func addToLeadboard(points: Int) {
        leaderboardEntries.append(LeaderboardEntry(score: points, date: Date()))
        leaderboardEntries.sorted{$0.score > $1.score}
    }
    
    mutating func startNewRound(points: Int) -> Void {
        score += points
        round += 1
        target = Int.random(in: 1...100)
        addToLeadboard(points: points)
    }
    
    mutating func restart() -> Void {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
}
