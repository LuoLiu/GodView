//
//  PlayerModel.swift
//  GodView
//
//  Created by LuoLiu on 2017/12/20.
//  Copyright © 2017年 66. All rights reserved.
//

import UIKit

enum PlayerType: String {
    case normal = "平民"
    case killer = "狼人"
    case witch = "女巫"
    case seer = "预言家"
    case hunter = "猎人"
    case idiot = "白痴"
}

enum PlayerStatus: String {
    case live = "存活"
    case dead_poisoned = "毒死"
    case dead_killed = "杀死"
    case out = "出局"
}

struct PlayerModel {
    var id: Int = 0
    var role: PlayerType = .normal
    var status: PlayerStatus = .live
}
