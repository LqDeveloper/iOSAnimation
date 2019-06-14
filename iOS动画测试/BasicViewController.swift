//
//  BasicViewController.swift
//  iOS动画测试
//
//  Created by liquan on 2019/6/14.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

import UIKit
/*
 #ifndef AnimationKeyPathName_h
 2 #define AnimationKeyPathName_h
 3 #import <Foundation/Foundation.h>
 4 /* CATransform3D Key Paths */
 5 /* 旋转x,y,z分别是绕x,y,z轴旋转 */
 6 static NSString *kCARotation = @"transform.rotation";
 7 static NSString *kCARotationX = @"transform.rotation.x";
 8 static NSString *kCARotationY = @"transform.rotation.y";
 9 static NSString *kCARotationZ = @"transform.rotation.z";
 10
 11 /* 缩放x,y,z分别是对x,y,z方向进行缩放 */
 12 static NSString *kCAScale = @"transform.scale";
 13 static NSString *kCAScaleX = @"transform.scale.x";
 14 static NSString *kCAScaleY = @"transform.scale.y";
 15 static NSString *kCAScaleZ = @"transform.scale.z";
 16
 17 /* 平移x,y,z同上 */
 18 static NSString *kCATranslation = @"transform.translation";
 19 static NSString *kCATranslationX = @"transform.translation.x";
 20 static NSString *kCATranslationY = @"transform.translation.y";
 21 static NSString *kCATranslationZ = @"transform.translation.z";
 22
 23 /* 平面 */
 24 /* CGPoint中心点改变位置，针对平面 */
 25 static NSString *kCAPosition = @"position";
 26 static NSString *kCAPositionX = @"position.x";
 27 static NSString *kCAPositionY = @"position.y";
 28
 29 /* CGRect */
 30 static NSString *kCABoundsSize = @"bounds.size";
 31 static NSString *kCABoundsSizeW = @"bounds.size.width";
 32 static NSString *kCABoundsSizeH = @"bounds.size.height";
 33 static NSString *kCABoundsOriginX = @"bounds.origin.x";
 34 static NSString *kCABoundsOriginY = @"bounds.origin.y";
 35
 36 /* 透明度 */
 37 static NSString *kCAOpacity = @"opacity";
 38 /* 背景色 */
 39 static NSString *kCABackgroundColor = @"backgroundColor";
 40 /* 圆角 */
 41 static NSString *kCACornerRadius = @"cornerRadius";
 42 /* 边框 */
 43 static NSString *kCABorderWidth = @"borderWidth";
 44 /* 阴影颜色 */
 45 static NSString *kCAShadowColor = @"shadowColor";
 46 /* 偏移量CGSize */
 47 static NSString *kCAShadowOffset = @"shadowOffset";
 48 /* 阴影透明度 */
 49 static NSString *kCAShadowOpacity = @"shadowOpacity";
 50 /* 阴影圆角 */
 51 static NSString *kCAShadowRadius = @"shadowRadius";
 52 #endif /* AnimationKeyPathName_h */
 */
class BasicViewController: UIViewController {
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func changeColor(_ sender: Any) {
        let basic = CABasicAnimation.init(keyPath: "backgroundColor");
        basic.duration = 1
        basic.fromValue = UIColor.green.cgColor
        basic.toValue = UIColor.red.cgColor
        //        显示fromValue
        //        basic.fillMode = CAMediaTimingFillMode.backwards
        //      显示toValue
        basic.fillMode = CAMediaTimingFillMode.forwards
        basic.isRemovedOnCompletion = false
        basic.delegate = self
        bgView.layer.add(basic, forKey: "backgroundColor")
    }
    
    @IBAction func changeScale(_ sender: Any) {
        let basic = CABasicAnimation.init(keyPath: "transform.scale")
        basic.fromValue = 1
        basic.toValue = 0.1
        basic.duration = 1
        basic.delegate = self
        basic.fillMode = CAMediaTimingFillMode.forwards
        //        如果不加这段代码，fillMode无法生效
        basic.isRemovedOnCompletion = false
        bgView.layer.add(basic, forKey: "size")
    }
    
    @IBAction func chnageAlpha(_ sender: Any) {
        let basic = CABasicAnimation.init(keyPath: "opacity")
        basic.fromValue  = 1.0
        basic.toValue = 0.1
        basic.duration  = 1;
        basic.delegate = self
        basic.fillMode = CAMediaTimingFillMode.forwards
        basic.isRemovedOnCompletion = false
        bgView.layer.add(basic, forKey: "opacity")
    }
}

extension BasicViewController:CAAnimationDelegate{
    func animationDidStart(_ anim: CAAnimation) {
        print("动画开始啦")
    }
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        print("动画完成啦")
    }
}
