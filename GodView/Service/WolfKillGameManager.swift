//
//  WolfKillGameManager.swift
//  GodView
//
//  Created by LuoLiu on 2017/12/20.
//  Copyright © 2017年 66. All rights reserved.
//

import UIKit

enum PlayerNum: Int {
    case num6 = 6, num7, num8, num9, num10, num11, num12

    static let count: Int = {
        var max: Int = 6
        while let _ = PlayerNum(rawValue: max) { max += 1 }
        return max - 6
    }()

}

class WolfKillGameManager {

    static var shared = WolfKillGameManager()

    var players: [PlayerModel] = []

    var dayResults: [WolfKillResultOnDay] = []

    func createGame(num: PlayerNum, createPlayers: Bool) -> WolfKillGameModel {
        var game = WolfKillGameModel(numOfPlayers: 0, players: [], gameTitle: "", gameDetail: "")
        game.numOfPlayers = num.rawValue
        if createPlayers {
            game.players = self.createPlayers(num: num).sorted { $0.id < $1.id }
        } else {
            game.players = []
        }

        game.gameTitle = WolfKillGameConst.titles[num] ?? ""
        game.gameDetail = WolfKillGameConst.details[num] ?? ""
        self.players = game.players
        self.dayResults = []

        return game
    }

    private func createPlayers(num: PlayerNum) -> [PlayerModel] {
        var players: [PlayerModel] = []
        let roles: [PlayerType] = allRoles(num: num)

        let randomGenerator = Int.createRandomGenerator(range: 1...num.rawValue)
        for role in roles {
            if let id = randomGenerator() {
                let player = PlayerModel(id: id, role: role, status: .live)
                players.append(player)
            }
        }

        return players
    }

    fileprivate func allRoles(num: PlayerNum) -> [PlayerType] {
        var roles: [PlayerType] = [.normal, .normal, .normal, .killer, .killer, .witch]

        guard num.rawValue > PlayerNum.num6.rawValue else { return roles }
        roles.append(.seer)

        guard num.rawValue > PlayerNum.num7.rawValue else { return roles }
        roles.append(.killer)

        guard num.rawValue > PlayerNum.num8.rawValue else { return roles }
        roles.append(.hunter)

        guard num.rawValue > PlayerNum.num9.rawValue else { return roles }
        roles.append(.normal)

        guard num.rawValue > PlayerNum.num10.rawValue else { return roles }
        roles.append(.killer)

        guard num.rawValue > PlayerNum.num11.rawValue else { return roles }
        roles.append(.idiot)

        return roles
    }
    
}

extension Int {

    static func createRandomGenerator(range: ClosedRange<Int>) -> (() -> Int?) {
        let min = range.lowerBound
        let max = range.upperBound
        var nums: [Int] = []
        for i in min...max{
            nums.append(i)
        }

        func randomGenerator() -> Int? {
            if nums.isEmpty == false {
                let index = Int(arc4random_uniform(UInt32(nums.count)))
                return nums.remove(at: index)
            } else {
                return nil
            }
        }

        return randomGenerator
    }

}
