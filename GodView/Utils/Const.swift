//
//  Const.swift
//  GodView
//
//  Created by LuoLiu on 2017/12/21.
//  Copyright © 2017年 66. All rights reserved.
//

import Foundation

struct Const {

}

struct WolfKillGameConst {

    static let titles: [PlayerNum: String] = [.num6: "六人局",
                                              .num7: "七人局",
                                              .num8: "八人局",
                                              .num9: "九人局",
                                              .num10: "十人局",
                                              .num11: "十一人局",
                                              .num12: "十二人局"]

    static let details: [PlayerNum: String] = [.num6: "3民2狼1女巫",
                                               .num7: "3民2狼1女巫1预言家",
                                               .num8: "3民3狼1女巫1预言家",
                                               .num9: "3民3狼1女巫1预言家1猎人",
                                               .num10: "4民3狼1女巫1预言家1猎人",
                                               .num11: "4民4狼1女巫1预言家1猎人",
                                               .num12: "4民4狼1女巫1预言家1猎人1白痴"]
}
