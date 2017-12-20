//
//  UIViewController+Extension.swift
//  GodView
//
//  Created by LuoLiu on 2017/12/20.
//  Copyright © 2017年 66. All rights reserved.
//

import UIKit

extension UIViewController {

    func setBackButton() {
        let backImg = UIImage(named: "ic_back")!.withRenderingMode(.alwaysOriginal)
        let item = UIBarButtonItem(image: backImg, style: .plain, target: self, action: #selector(goBack))
        navigationItem.setLeftBarButton(item, animated: false)
    }

    func setCloseButton() {
        let closeImage = UIImage(named: "ic_close")!.withRenderingMode(.alwaysOriginal)
        let item = UIBarButtonItem(image: closeImage, style: .plain, target: self, action: #selector(closeVC))
        navigationItem.setLeftBarButton(item, animated: false)
    }
    

    @objc func goBack() {
        _ = navigationController?.popViewController(animated: true)
    }

    @objc func closeVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
