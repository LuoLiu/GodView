//
//  HomeTableViewCell.swift
//  GodView
//
//  Created by LuoLiu on 2017/12/20.
//  Copyright © 2017年 66. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    static let identifier = "HomeTableViewCell"

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
    
}
