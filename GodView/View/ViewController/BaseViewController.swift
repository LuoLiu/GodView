//
//  BaseViewController.swift
//  GodView
//
//  Created by LuoLiu on 2017/12/19.
//  Copyright © 2017年 66. All rights reserved.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {

    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    func setupView() {
        // override in sub class
    }

}
