//
//  WolfKillViewController.swift
//  GodView
//
//  Created by LuoLiu on 2017/12/19.
//  Copyright © 2017年 66. All rights reserved.
//

import UIKit

class WolfKillViewController: BaseViewController {

    @IBOutlet weak var roleLabel: UILabel!
    
    fileprivate var player = PlayerModel()

    static func instance(player: PlayerModel) -> WolfKillViewController {
        let sb = UIStoryboard(name: .main)
        let vc = sb.instantiateViewControllerWithClass(type: WolfKillViewController.self)
        vc.player = player

        return vc
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        roleLabel.text = player.role.rawValue
    }

    override func setupView() {
        super.setupView()
    }

    @IBAction func close(_ sender: Any) {
        closeVC()
    }
    
}
