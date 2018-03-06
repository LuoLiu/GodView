//
//  GodBoardViewController.swift
//  GodView
//
//  Created by LuoLiu on 2017/12/19.
//  Copyright © 2017年 66. All rights reserved.
//

import UIKit

class GodBoardViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.reloadData()
    }

    override func setupView() {
        super.setupView()

        setBackButton()
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: ContentWithNumTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ContentWithNumTableViewCell.identifier)
    }

    @IBAction func addDay(_ sender: Any) {
        let day = WolfKillGameManager.shared.dayResults.count+1
        let res = WolfKillResultOnDay(day: day)
        WolfKillGameManager.shared.dayResults.append(res)
        
        tableView.reloadData()
    }

}

extension GodBoardViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WolfKillGameManager.shared.dayResults.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContentWithNumTableViewCell.identifier, for: indexPath) as! ContentWithNumTableViewCell
        cell.configWith(result: WolfKillGameManager.shared.dayResults[indexPath.row])

        return cell
    }

}

extension GodBoardViewController : UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        AlertHelper.showBaseAlert(title: "开发中......")
//        let players = WolfKillGameManager.shared.players
//        let vc = PlayersViewController.instance(players: players, userMode: .god)
//        navigationController?.pushViewController(vc, animated: true)
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
