//
//  GroupViewController.swift
//  iOS动画测试
//
//  Created by liquan on 2019/6/14.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

import UIKit

class GroupViewController: UIViewController {

    @IBOutlet weak var bgView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    

    @IBAction func clickStart(_ sender: Any) {
        let basic = CABasicAnimation.init(keyPath: "transform.scale")
        basic.fromValue = 1
        basic.toValue = 0.5
        basic.duration = 3
        basic.delegate = self
        basic.beginTime = 0
        basic.fillMode = CAMediaTimingFillMode.forwards
        //        如果不加这段代码，fillMode无法生效
        basic.isRemovedOnCompletion = false
       
        
        let keyFrame = CAKeyframeAnimation.init(keyPath: "backgroundColor")
        keyFrame.duration = 3.0
        keyFrame.beginTime = 3.0
        keyFrame.fillMode = .forwards
        keyFrame.isRemovedOnCompletion = false
        keyFrame.values = [UIColor.red.cgColor,UIColor.green.cgColor,UIColor.blue.cgColor]
        keyFrame.delegate = self
        
        
        let group = CAAnimationGroup.init()
        group.animations = [basic,keyFrame]
        group.duration = 6
        bgView.layer.add(group, forKey: "group")
    }
}
extension GroupViewController:CAAnimationDelegate{
    func animationDidStart(_ anim: CAAnimation) {
        print("动画开始啦")
    }
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        print("动画完成啦")
    }
}
