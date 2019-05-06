//
//  UIGestureRecognizerViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/5/6.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class UIGestureRecognizerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        self.title = " 各种手势检测大全（UIGestureRecognizer及其子类）";
        
        // Do any additional setup after loading the view.
        
        // UIGestureRecognizer 有许多子类，用于监听一些常见的手势事件，这些子类主要有：
        
        //1，UISwipeGestureRecognizer：滑动（快速移动）
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipe(_:)))
        swipeUp.direction = .up//注意1：如果 UISwipeGestureRecognizer 在不指定方向的时候，默认向右滑动才会触发事件。如果要指定方向，需要设置 direction 属性
        self.view.addGestureRecognizer(swipeUp)
        
        //如果各个方向都要响应，只要多定义几个 UISwipeGestureRecognizer 就可以了
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipe(_:)))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
        
        /**
        2，UIScreenEdgePanGestureRecognizer：边缘滑动
        （1）这个是 UISwipeGestureRecognizer 的子类，与后者不同的时。UIScreenEdgePanGestureRecognizer 只触发从边缘开始的划动操作，比如从左侧边缘开始向右滑动。
        （2）UIScreenEdgePanGestureRecognizer 没有 direction 属性，增加了个 edges 属性。表示要响应哪个边缘的划动操作。可以是从左边缘向右滑动，或右边缘向左、上边缘向下、下边缘向上、或响应全部边缘滑动。**/
        let edge = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(edge(_:)))
        edge.edges = UIRectEdge.right//从右边缘开始滑动
        self.view.addGestureRecognizer(edge)
        
        /**
        3，UITapGestureRecognizer：轻点手势（点击）
         （1）可以通过 numberOfTouchesRequired 属性设置触摸点数，比如设置 2 表示必须两个手指触摸时才会触发
         （2）通过 numberOfTapsRequired 属性设置点击次数，单击设置为 1，双击设置为 2
         （3）如果一个控件既监听了单击事件也监听了双击事件，默认当双击事件触发的时候也同时会触发单击事件。如果想双击时不触发单击，需要通过 require(toFail:) 进行设置
        **/
        
        //单击监听
        let tapSingle = UITapGestureRecognizer(target: self, action: #selector(tapSingleDid(_:)))
        tapSingle.numberOfTouchesRequired = 1//设置触摸点数
        tapSingle.numberOfTapsRequired = 1//设置点击次数
        self.view.addGestureRecognizer(tapSingle)
        
        //双击监听
        let tapDouble = UITapGestureRecognizer(target: self, action: #selector(tapDoubleDid(_:)))
        tapDouble.numberOfTouchesRequired = 1
        tapDouble.numberOfTapsRequired = 2
        tapSingle.require(toFail: tapDouble)//声明点击事件需要双击事件检测失败后才会执行
        self.view.addGestureRecognizer(tapDouble)
        
        //4，UIPinchGestureRecognizer：捏合手势（两个手指进行放大缩小）
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(pinchDid(_:)))
        self.view.addGestureRecognizer(pinch)
        
        // 5，UIRotationGestureRecognizer：旋转手势（两个手指进行旋转）
        let rotation = UIRotationGestureRecognizer(target: self, action: #selector(rotationDid(_:)))
        self.view.addGestureRecognizer(rotation)
        
        
        //6，UIPanGestureRecognizer：拖动手势
        let rect1 = UIView(frame:CGRect(x:0, y:0, width:100, height:100))
        rect1.center = self.view.center
        rect1.backgroundColor = UIColor.orange
        self.view.addSubview(rect1)
        
        let pan1 = UIPanGestureRecognizer(target: self, action: #selector(panDid(_:)))
        rect1.addGestureRecognizer(pan1)
        
        let rect2 = UIView(frame:CGRect(x:150, y:300, width:100, height:100))
        rect2.backgroundColor = UIColor.yellow
        self.view.addSubview(rect2)
        let pan2 = UIPanGestureRecognizer(target: self, action: #selector(panDid(_:)))
        rect2.addGestureRecognizer(pan2)
        
        //7，UILongPressGestureRecognizer：长按
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPressDid(_:)))
        self.view.addGestureRecognizer(longPress)
    }
    
    @objc func swipe(_ recognizer:UISwipeGestureRecognizer) {
        if recognizer.direction == .up {
            print("向上滑动")
        } else if recognizer.direction == .down {
            print("向下滑动")
        }
        let point = recognizer.location(in: self.view)
        print(point.x)
        print(point.y)
    }
    
    @objc func edge(_ recognizer:UIScreenEdgePanGestureRecognizer) {
        print("right edgeswipe ok")
        let point = recognizer.location(in: self.view)
        //这个点是滑动的起点
        print(point.x)
        print(point.y)
    }

    @objc func tapSingleDid(_ recognizer:UITapGestureRecognizer) {
        print("单击了")
    }
    
    @objc func tapDoubleDid(_ recognizer:UITapGestureRecognizer) {
        print(recognizer.numberOfTapsRequired)
        print("双击了")
    }
    
    @objc func pinchDid(_ recognizer:UIPinchGestureRecognizer) {
        print("捏合手势：\(recognizer.scale)")
        //获取两个触摸点的坐标
        print(recognizer.location(ofTouch: 0, in: self.view))
        print(recognizer.location(ofTouch: 1, in: self.view))
    }
    
    @objc func rotationDid(_ recognizer:UIRotationGestureRecognizer) {
        //旋转的弧度转换为角度
        print("弧度：\(recognizer.rotation)")
        print("角度：\(recognizer.rotation * (180/CGFloat.pi))")
    }
    
    @objc func panDid(_ recognizer:UIRotationGestureRecognizer) {
        if recognizer.state == .began {
            print("拖动响应开始")
        } else if recognizer.state == .ended {
            print("拖动响应结束")
        }
        let point:CGPoint = recognizer.location(in: self.view)
        //设置矩形的位置
        recognizer.view?.center = point
    }
    
    @objc func longPressDid(_ recognizer:UILongPressGestureRecognizer) {
        if recognizer.state == .began {
            print("长按响应开始")
        } else {
            print("长按响应结束")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
