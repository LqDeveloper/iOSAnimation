//
//  MyView.swift
//  iOS动画测试
//
//  Created by liquan on 2019/6/14.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

import UIKit

class MyView: UIView {
//    这是隐式动画
    override func action(for layer: CALayer, forKey event: String) -> CAAction? {
        if event == "position" {
            let basic = CABasicAnimation.init(keyPath: "position")
            basic.duration = 1
            return basic
        }
        return nil
    }
}
