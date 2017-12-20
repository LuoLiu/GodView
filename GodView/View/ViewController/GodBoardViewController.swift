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
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func setupView() {
        super.setupView()

        setBackButton()
        tableView.tableFooterView = UIView()
    }

}
