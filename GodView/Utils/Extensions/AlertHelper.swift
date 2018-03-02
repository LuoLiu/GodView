//
//  AlertHelper.swift
//  GodView
//
//  Created by LuoLiu on 2018/3/2.
//  Copyright © 2018年 66. All rights reserved.
//

import UIKit

struct AlertHelper {

    static func showBaseAlert(title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: AlertConst.close, style: .default, handler: nil)
        alert.addAction(cancelAction)
        show(alert: alert, in: nil)
    }

    static func showAlert(vc: UIViewController? = nil, title: String? = nil, message: String? = nil, cancelAction: UIAlertAction? = nil, confirmAction: UIAlertAction? = nil) {

        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if let cancelAction = cancelAction {
            alert.addAction(cancelAction)
        }
        if let confirmAction = confirmAction {
            alert.addAction(confirmAction)
        }

        show(alert: alert, in: vc)
    }

    static func showMessagesAlert(vc: UIViewController? = nil, title: String?, messages: [String], closeAction: UIAlertAction? = nil) {

        let message = messages.reduce("") { prev, str in
            prev == "" ? str : "\(prev)\n\(str)"
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if let closeAction = closeAction {
            alert.addAction(closeAction)
        }

        show(alert: alert, in: vc)
    }

    private static func show(alert: UIAlertController, in vc: UIViewController? = nil) {
        // If no alert view controller, show alert
        let alertVC = UIApplication.topVC as? UIAlertController
        if alertVC == nil {
            if vc == nil {
                DispatchQueue.main.async {
                    UIApplication.topVC.present(alert, animated: true)
                }
                return
            }

            DispatchQueue.main.async {
                vc?.present(alert, animated: true)
            }
        }
    }
}

