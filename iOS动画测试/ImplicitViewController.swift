//
//  ImplicitViewController.swift
//  iOS动画测试
//
//  Created by Quan Li on 2019/6/14.
//  Copyright © 2019 williamoneilchina. All rights reserved.
//

import UIKit

class ImplicitViewController: UIViewController{
    private var colorLayer:CALayer!
    private var transitionLayer:CALayer!
    private var bgView:MyView!
    override func viewDidLoad() {
        super.viewDidLoad()
        colorLayer = CALayer.init()
        colorLayer.frame = CGRect.init(x:0, y: 300, width: UIScreen.main.bounds.size.width, height: 100);
        colorLayer.backgroundColor = UIColor.red.cgColor
        self.view.layer.addSublayer(colorLayer);
        bgView = MyView.init(frame: CGRect.init(x: 0, y: 550, width:  UIScreen.main.bounds.size.width, height: 100));
        self.view.addSubview(bgView)
//        bgView.layer.backgroundColor = UIColor.red.cgColor
        
        transitionLayer = CALayer.init()
        transitionLayer.frame = CGRect.init(x:0, y: 0, width: UIScreen.main.bounds.size.width, height: 100);
        transitionLayer.backgroundColor = UIColor.red.cgColor
        let trasition = CATransition.init()
        trasition.type = CATransitionType.push;
        trasition.subtype = CATransitionSubtype.fromTop
        
        let basic = CABasicAnimation.init(keyPath: "position")
        basic.duration = 1
    
        transitionLayer.actions = ["backgroundColor":trasition,"position":basic]
        bgView.layer.addSublayer(transitionLayer)
    }
    
    //  事务
    /*
     当CALayer的属性被修改的时候，它会调用actionForKey 方法，传递属性名称，
     剩下的操作如下：
     1.图层首先检查他是否有委托 并且是否实现CALayerDelegate 协议指定的action(for layer: CALayer, forKey event: String)方法
     如果有调用并直接返回结果
     
     2.如果没有委托，或者委托没有实现， action(for layer: CALayer, forKey event: String) 方法，图层接着检查包含的属性名称
     对应的行为映射的actions字典
     
     3.如果actions字典没有包含对应的属性，那么图层接着在它的style字典中接着搜索属性名称
     
     
     4.最后如果在style 里面也没有找到对应的行为，那么图层将会直接调用定义了每个属性的标准行为defaultActionForKey
     
     UIKit是如何禁用 CATransaction隐式动画的：
     每个UIView 对它关联的图层都扮演了一个委托并提供了action(for layer: CALayer, forKey event: String)的实现方法
     当不在一个动画块的实现中，UIView 的所有图层行为返回nil,但是在动画block 范围内，他就返回一个非空值，
     
     解决方法：
     
     1.UIView 关联的图层禁用了隐式动画，对这种图层做动画唯一的方法就是使用UIView的动画函数（而不是依赖CATransaction）
     或者继承UIView，并覆盖action(for layer: CALayer, forKey event: String)或者直接创建一个显式动画
     2.对于单独的图层，我们可以实现图层的action(for layer: CALayer, forKey event: String)委托方法，或者提供一个actions字典来提供隐式动画
     */
    @IBAction func clickTransButton(_ sender: Any) {
       viewTransaction()
    }
    
    @IBAction func clickComButton(_ sender: Any) {
        CATransaction.begin()
        CATransaction.setAnimationDuration(1.0)
        CATransaction.setCompletionBlock {
            print("动画完成")
        }
        let red = Double.init((arc4random() % 255 )) / 255.0
        let green = Double.init((arc4random() % 255 )) / 255.0
        let blue = Double.init((arc4random() % 255 )) / 255.0
        colorLayer.backgroundColor = UIColor.init(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0).cgColor
        CATransaction.commit()
    }
    
    
    @IBAction func clickTransition(_ sender: Any) {
//        viewTransition()
        bgView.frame =  CGRect.init(x: 0, y: 750, width:  UIScreen.main.bounds.size.width, height: 100)
    }
    
    
    func layerTransaction(){
        CATransaction.begin()
        CATransaction.setAnimationDuration(1.0)
        let red = Double.init((arc4random() % 255 )) / 255.0
        let green = Double.init((arc4random() % 255 )) / 255.0
        let blue = Double.init((arc4random() % 255 )) / 255.0
        colorLayer.backgroundColor = UIColor.init(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0).cgColor
        CATransaction.commit()
    }
    func viewLayerTransaction(){
        CATransaction.begin()
        CATransaction.setAnimationDuration(1.0)
        let red = Double.init((arc4random() % 255 )) / 255.0
        let green = Double.init((arc4random() % 255 )) / 255.0
        let blue = Double.init((arc4random() % 255 )) / 255.0
        bgView.layer.backgroundColor = UIColor.init(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0).cgColor
        CATransaction.commit()
    }
    
    func viewTransaction() {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1.0)
        //        let action = self.bgView.action(for: self.bgView.layer, forKey: "backgroundColor")
        //        print(action)
        let red = Double.init((arc4random() % 255 )) / 255.0
        let green = Double.init((arc4random() % 255 )) / 255.0
        let blue = Double.init((arc4random() % 255 )) / 255.0
        bgView.layer.backgroundColor = UIColor.init(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0).cgColor
        UIView.commitAnimations()
    }
    
    func viewTransition() {
        let red = Double.init((arc4random() % 255 )) / 255.0
        let green = Double.init((arc4random() % 255 )) / 255.0
        let blue = Double.init((arc4random() % 255 )) / 255.0
        transitionLayer.backgroundColor = UIColor.init(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0).cgColor
        transitionLayer.frame = CGRect.init(x:0, y:100, width: UIScreen.main.bounds.size.width, height: 100);
    }
    
}
