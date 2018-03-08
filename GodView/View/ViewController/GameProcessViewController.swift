//
//  GameProcessViewController.swift
//  GodView
//
//  Created by LuoLiu on 2018/3/8.
//  Copyright © 2018年 66. All rights reserved.
//

import UIKit
import RxSwift

class GameProcessViewController: BaseViewController {

    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var numCollectionView: UICollectionView!
    @IBOutlet weak var gameOverBtn: UIButton!

    static func instance() -> GameProcessViewController {
        let sb = UIStoryboard(name: .gameProcess)
        let vc = sb.instantiateViewControllerWithClass(type: GameProcessViewController.self)

        return vc
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func setupView() {
        super.setupView()

//        navigationController?.navigationBar.shadowImage = UIImage()
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.isTranslucent = true
//        navigationController?.navigationBar.backgroundColor = .clear
        setCloseButton()

        let layout = UICollectionViewFlowLayout()
        let itemWidth = (SizeConst.screenwidth * 0.75) / 3
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        numCollectionView.collectionViewLayout = layout
        numCollectionView.register(UINib(nibName: NumberCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: NumberCollectionViewCell.identifier)
    }

}

extension GameProcessViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return WolfKillGameManager.shared.players.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NumberCollectionViewCell.identifier, for: indexPath) as! NumberCollectionViewCell
        cell.configWith(num: indexPath.row + 1)

        return cell
    }
}

extension GameProcessViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO:
    }
}
