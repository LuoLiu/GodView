//
//  NumberCollectionViewCell.swift
//  GodView
//
//  Created by LuoLiu on 2018/3/8.
//  Copyright © 2018年 66. All rights reserved.
//

import UIKit

class NumberCollectionViewCell: UICollectionViewCell {

    static let identifier = "NumberCollectionViewCell"

    @IBOutlet weak var numButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configWith(num: Int) {
        numButton.setTitle("\(num)", for: .normal)
    }
}
