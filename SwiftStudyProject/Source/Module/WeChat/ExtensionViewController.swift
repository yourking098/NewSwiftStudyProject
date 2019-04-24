//
//  ExtensionViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/4/24.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class ExtensionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.white
        
        //区间运算符可以用来表示两个操作数之间的范围集合。
        self.title = "访问控制";
        // Do any additional setup after loading the view.
        
        /**
         Swift语言的类扩展是一个强大的工具，我们可以通过类扩展完成如下事情：
         1，给已有的类添加计算属性和计算静态属性
         2，定义新的实例方法和类方法
         3，提供新的构造器
         4，定义下标脚本
         5，是一个已有的类型符合某个协议
         
         
         注意：
          扩展只能添加新的计算型属性，不能添加存储型属性，也不能添加新的属性监视器。
         在 Swift 4 中，extension 里可以访问 private 的属性。（过去 Swift3 中是不行的）

         **/
        
        let value = 2000000000.0
        print(value.mm())
        print(value.cm())
        print(value.dm())
        print(value.m())
        print(value.km())
        
    }
    
}

extension Double
{
    func mm()->String
    {
        return "\(self/1)mm"
    }
    func cm()-> String
    {
        return "\(self/10)cm"
    }
    
    func dm()->String{
        return "\(self/100)dm"
    }
    
    func m()->String
    {
        return "\(self/1000)m"
    }
    func km()->String
    {
        return "\(self/(1000*1000))km"
    }
}
