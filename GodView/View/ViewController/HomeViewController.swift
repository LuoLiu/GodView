//
//  HomeViewController.swift
//  GodView
//
//  Created by LuoLiu on 2017/12/19.
//  Copyright © 2017年 66. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func setupView() {
        super.setupView()

        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: ContentWithNumTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ContentWithNumTableViewCell.identifier)
    }

}

extension HomeViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlayerNum.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContentWithNumTableViewCell.identifier, for: indexPath) as! ContentWithNumTableViewCell

        if let game = gameForIndexPath(indexPath, createPlayers: false) {
            cell.configWith(game: game)
        }

        return cell
    }
}

extension HomeViewController : UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if let game = gameForIndexPath(indexPath, createPlayers: true) {
            let vc = PlayersViewController.instance(players: game.players, userMode: .player)
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension HomeViewController {

    fileprivate func gameForIndexPath(_ indexPath: IndexPath, createPlayers: Bool) -> WolfKillGameModel? {
        let num = PlayerNum.num6.rawValue + indexPath.row
        if let playerNum = PlayerNum(rawValue: num) {
            return WolfKillGameManager.shared.createGame(num: playerNum, createPlayers: createPlayers)
        }
        return nil
    }

}
