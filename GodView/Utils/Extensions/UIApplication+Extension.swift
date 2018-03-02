//
//  UIApplication+Extension.swift
//  GodView
//
//  Created by LuoLiu on 2018/3/2.
//  Copyright © 2018年 66. All rights reserved.
//

import UIKit

extension UIApplication {
    static var topVC: UIViewController {
        guard let rootVC = shared.keyWindow?.rootViewController else { return UIViewController() }
        return topViewController(with: rootVC)
    }

    private static func topViewController(with rootViewController: UIViewController,filterMainTabVC: Bool = true) -> UIViewController {

        if let navi = rootViewController as? UINavigationController, let visibleVC = navi.visibleViewController {
            return topViewController(with: visibleVC)
        }

        if let presentedVC = rootViewController.presentedViewController {
            if presentedVC.isKind(of: UIAlertController.self) == false {
                return topViewController(with: presentedVC)
            }
        }

        return rootViewController
    }
}
