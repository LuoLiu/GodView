//
//  UIView+Extension.swift
//  GodView
//
//  Created by LuoLiu on 2017/12/19.
//  Copyright © 2017年 66. All rights reserved.
//

import UIKit

extension UIView {

    @IBInspectable var LLCornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.masksToBounds = newValue > 0
            layer.cornerRadius = newValue
        }
    }

    @IBInspectable var LLBorderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            guard newValue > 0 else { return }
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var LLBorderColor: UIColor? {
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }

    var origin: CGPoint {
        set {
            self.frame.origin = newValue
        }
        get {
            return self.frame.origin
        }
    }

    var size: CGSize {
        set {
            self.frame.size = newValue
        }
        get {
            return self.frame.size
        }
    }

    var x: CGFloat {
        set {
            self.frame.origin.x = newValue
        }
        get {
            return self.frame.origin.x
        }
    }

    var y: CGFloat {
        set {
            self.frame.origin.y = newValue
        }
        get {
            return self.frame.origin.y
        }
    }

}
