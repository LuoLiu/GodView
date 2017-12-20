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
    @IBOutlet weak var startButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func setupView() {
        super.setupView()

        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: HomeTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: HomeTableViewCell.identifier)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as! HomeTableViewCell

        if let game = gameForIndexPath(indexPath) {
            cell.configWith(game: game)
        }

        return cell
    }
}

extension HomeViewController : UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if let game = gameForIndexPath(indexPath) {
            let vc = PlayersViewController.instance(players: game.players)
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

extension HomeViewController {

    fileprivate func gameForIndexPath(_ indexPath: IndexPath) -> WolfKillGameModel? {
        let num = PlayerNum.num6.rawValue + indexPath.row
        if let playerNum = PlayerNum(rawValue: num) {
            return WolfKillGameManager.shared.createGame(num: playerNum)
        }
        return nil
    }

}
