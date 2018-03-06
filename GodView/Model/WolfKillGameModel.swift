//
//  WolfKillGameModel.swift
//  GodView
//
//  Created by LuoLiu on 2017/12/20.
//  Copyright © 2017年 66. All rights reserved.
//

import UIKit

struct WolfKillGameModel {
    var numOfPlayers: Int = 0
    var players: [PlayerModel] = []
    var gameTitle: String = ""
    var gameDetail: String = ""
}

struct WolfKillResultOnDay {
    var day: Int = 0
}
