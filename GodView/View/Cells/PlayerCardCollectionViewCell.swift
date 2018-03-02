//
//  PlayerCardCollectionViewCell.swift
//  GodView
//
//  Created by LuoLiu on 2017/12/20.
//  Copyright © 2017年 66. All rights reserved.
//

import UIKit

class PlayerCardCollectionViewCell: UICollectionViewCell {

    static let identifier = "PlayerCardCollectionViewCell"

    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var roleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configWith(player: PlayerModel, userMode: UserMode) {
        numLabel.text = "\(player.id)"
        if userMode == .god {
            roleLabel.isHidden = false
            roleLabel.text = player.role.rawValue
        } else {
            roleLabel.isHidden = true
        }
    }

}
