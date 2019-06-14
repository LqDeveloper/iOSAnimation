//
//  KeyFrameViewController.swift
//  iOS动画测试
//
//  Created by liquan on 2019/6/14.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

import UIKit

class KeyFrameViewController: UIViewController {
    
    @IBOutlet weak var bgView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backgroundColor(_ sender: Any) {
        let keyFrame = CAKeyframeAnimation.init(keyPath: "backgroundColor")
        keyFrame.duration = 3
        keyFrame.fillMode = .forwards
        keyFrame.isRemovedOnCompletion = false
        keyFrame.values = [UIColor.red.cgColor,UIColor.green.cgColor,UIColor.blue.cgColor]
        keyFrame.delegate = self
        bgView.layer.add(keyFrame, forKey: "position")
    }
    
    @IBAction func startAnimation(_ sender: Any) {
        let keyFrame = CAKeyframeAnimation.init(keyPath: "position")
        keyFrame.duration = 3
        keyFrame.fillMode = .forwards
        keyFrame.isRemovedOnCompletion = false
        let path = UIBezierPath.init(rect: CGRect.init(x: 0, y: 200, width: UIScreen.main.bounds.size.width, height: 300))
        keyFrame.path = path.cgPath
        keyFrame.delegate = self
        bgView.layer.add(keyFrame, forKey: "position")
    }
    
}

extension KeyFrameViewController :CAAnimationDelegate{
    func animationDidStart(_ anim: CAAnimation) {
        print("动画开始")
    }
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        print("动画结束")
    }
}
