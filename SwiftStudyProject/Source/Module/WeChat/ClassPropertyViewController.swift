//
//  ClassPropertyViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/4/24.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class ClassPropertyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        //区间运算符可以用来表示两个操作数之间的范围集合。
        self.title = "类计算属性";
        // Do any additional setup after loading the view.
        
        let calculate = Calculate()
        print("calculate.sum：\(calculate.sum)")
        
        calculate.sum = 10
        print("calculate.b：\(calculate.b)")
    }
}

class Calculate {
    var a:Int = 1
    var b:Int = 1
    var sum:Int {
        get {//如果属性只要只读，只要写get，不要set方法
            return a+b
        }
        set(val){
            b = val - a
        }
        //对于set有简写方法，简写时，新赋的值默认为newValue
//        set {
//            b = newValue - a
//        }
    }
}
