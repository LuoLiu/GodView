//
//  QRCodeViewController.swift
//  GodView
//
//  Created by LuoLiu on 2017/12/19.
//  Copyright © 2017年 66. All rights reserved.
//

import UIKit

class QRCodeViewController: BaseViewController {

    var player: PlayerModel = PlayerModel(id: 0, role: .normal)

    static func instance(player: PlayerModel) -> QRCodeViewController {
        let sb = UIStoryboard(name: .main)
        let vc = sb.instantiateViewControllerWithClass(type: QRCodeViewController.self)
        vc.player = player

        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        print("\(player.id)")
    }

    override func setupView() {
        super.setupView()

    }

    @IBAction func close(_ sender: Any) {
        closeVC()
    }

}
