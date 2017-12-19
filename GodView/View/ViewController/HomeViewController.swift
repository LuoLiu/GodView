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

        bindRx()
    }

    override func setupView() {
        super.setupView()
    }

    private func bindRx() {
        startButton.rx.tap
            .subscribe(onNext: {

            })
            .disposed(by: disposeBag)
    }
}

