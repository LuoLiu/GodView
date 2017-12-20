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

    func createGame(num: PlayerNum) -> WolfKillGameModel {
        var game = WolfKillGameModel(numOfPlayers: 0, players: [], gameTitle: "", gameDetail: "")
        game.numOfPlayers = num.rawValue
        game.players = createPlayers(num: num)

        switch num {
        case .num6:
            game.gameTitle = "六人局"
            game.gameDetail = "3民2狼1女巫"
        case .num7:
            game.gameTitle = "七人局"
            game.gameDetail = "3民2狼1女巫1预言家"
        case .num8:
            game.gameTitle = "八人局"
            game.gameDetail = "3民3狼1女巫1预言家"
        case .num9:
            game.gameTitle = "九人局"
            game.gameDetail = "3民3狼1女巫1预言家1猎人"
        case .num10:
            game.gameTitle = "十人局"
            game.gameDetail = "4民3狼1女巫1预言家1猎人"
        case .num11:
            game.gameTitle = "十一人局"
            game.gameDetail = "4民4狼1女巫1预言家1猎人"
        case .num12:
            game.gameTitle = "十二人局"
            game.gameDetail = "4民4狼1女巫1预言家1猎人1白痴"
        }

        return game
    }

    private func createPlayers(num: PlayerNum) -> [PlayerModel] {
        var players: [PlayerModel] = []

//        let normal1 = PlayerModel(id: 1, role: .normal)
//        case .num6:
//
//        case .num7:
//        game.gameTitle = "七人局"
//        game.gameDetail = "3民2狼1女巫1预言家"
//        case .num8:
//        game.gameTitle = "八人局"
//        game.gameDetail = "3民3狼1女巫1预言家"
//        case .num9:
//        game.gameTitle = "九人局"
//        game.gameDetail = "3民3狼1女巫1预言家1猎人"
//        case .num10:
//        game.gameTitle = "十人局"
//        game.gameDetail = "4民3狼1女巫1预言家1猎人"
//        case .num11:
//        game.gameTitle = "十一人局"
//        game.gameDetail = "4民4狼1女巫1预言家1猎人"
//        case .num12:
//
//    }
        for id in 0...num.rawValue {
            let role = PlayerModel(id: id, role: .normal)
            players.append(role)
        }

        return players
    }
    
}
