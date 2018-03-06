//
//  ContentWithNumTableViewCell.swift
//  GodView
//
//  Created by LuoLiu on 2017/12/20.
//  Copyright © 2017年 66. All rights reserved.
//

import UIKit

class ContentWithNumTableViewCell: UITableViewCell {

    static let identifier = "ContentWithNumTableViewCell"

    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configWith(game: WolfKillGameModel) {
        numLabel.text = "\(game.numOfPlayers)"
        titleLabel.text = game.gameTitle
        detailLabel.text = game.gameDetail
    }

    func configWith(result: WolfKillResultOnDay) {
        numLabel.text = "\(result.day)"
        titleLabel.text = "Day \(result.day)"
        var str = ""
        for player in WolfKillGameManager.shared.players {
            if str.isEmpty == false {
                str.append("，")
            }
            let roleStr = "\(player.id)号 \(player.role.rawValue) \(player.status.rawValue)"
            str.append(roleStr)
        }
        detailLabel.text = "\(str)"
    }

}
