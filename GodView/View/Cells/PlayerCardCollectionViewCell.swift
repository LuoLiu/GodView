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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configWith(player: PlayerModel) {
        numLabel.text = "\(player.id)"
    }

}
