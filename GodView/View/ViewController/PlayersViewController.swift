//
//  PlayersViewController.swift
//  GodView
//
//  Created by LuoLiu on 2017/12/19.
//  Copyright © 2017年 66. All rights reserved.
//

import UIKit

enum UserMode {
    case player
    case god
}

class PlayersViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var godButton: UIButton!

    fileprivate var players: [PlayerModel] = []
    fileprivate var userMode: UserMode = .player

    static func instance(players: [PlayerModel], userMode: UserMode) -> PlayersViewController {
        let sb = UIStoryboard(name: .main)
        let vc = sb.instantiateViewControllerWithClass(type: PlayersViewController.self)
        vc.players = players
        vc.userMode = userMode

        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func setupView() {
        super.setupView()

        self.title = TilteConst.playerVC
        setBackButton()
        godButton.addTarget(self, action: #selector(showGodView), for: .touchUpInside)

        collectionView.register(UINib(nibName: PlayerCardCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PlayerCardCollectionViewCell.identifier)
    }
    
}

extension PlayersViewController {
    @objc fileprivate func showGodView() {
        if userMode == .player {
            userMode = .god
            collectionView.reloadData()
            godButton.setTitle(ButtonConst.reStart, for: .normal)
        } else {
            let cancelAction = UIAlertAction(title: AlertConst.cancel, style: .default, handler: nil)
            let confirmAction = UIAlertAction(title: AlertConst.ok, style: .default, handler: { [unowned self] _ in
                self.goBack()
            })
            AlertHelper.showAlert(message: AlertConst.reStartMsg, cancelAction: cancelAction, confirmAction: confirmAction)
        }
    }
}

extension PlayersViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return players.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayerCardCollectionViewCell.identifier, for: indexPath) as! PlayerCardCollectionViewCell
        let player = players[indexPath.item]
        cell.configWith(player: player, userMode: userMode)

        return cell
    }

}

extension PlayersViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let player = players[indexPath.item]

        switch userMode {
        case .player:
            let vc = PlayerDetailViewController.instance(player: player)
            self.present(vc, animated: true, completion: nil)
        case .god:
            let vc = WolfKillViewController.instance(player: player)
            self.present(vc, animated: true, completion: nil)
        }
    }

}

extension PlayersViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.width-20*2-10*2)/3

        return CGSize(width: width, height: width)
    }

}
