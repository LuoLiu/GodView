//
//  UIStoryboard+Extension.swift
//  GodView
//
//  Created by LuoLiu on 2017/12/20.
//  Copyright © 2017年 66. All rights reserved.
//

import UIKit

enum StoryboardName: String {
    case main = "Main"
    case gameProcess = "GameProcess"
}

extension UIStoryboard {

    convenience init(name: StoryboardName, bundle sbBundleOrNil: Bundle? = nil) {
        self.init(name: name.rawValue, bundle: sbBundleOrNil)
    }

    func instantiateViewControllerWithClass<T: UIViewController>(type: T.Type) -> T {
        guard let vc = instantiateViewController(withIdentifier: "\(T.self)") as? T else {
            fatalError("Not found ViewController with identifier: \(T.self)")
        }
        return vc
    }
}
