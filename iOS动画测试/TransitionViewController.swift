//
//  TransitionViewController.swift
//  iOS动画测试
//
//  Created by liquan on 2019/6/15.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

import UIKit

class TransitionViewController: UIViewController {
    
    private var layer:CALayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let transition = CATransition.init()
        transition.duration = 2
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromBottom
        layer = CALayer.init()
        layer.frame = CGRect.init(x: 0, y: 300, width: UIScreen.main.bounds.size.width
            , height: 300)
        layer.backgroundColor = UIColor.yellow.cgColor
        layer.actions = ["backgroundColor":transition]
        view.layer.addSublayer(layer)
    }
    
    @IBAction func clickButton(_ sender: Any) {
        layer.backgroundColor = UIColor.red.cgColor
    }
    
}
