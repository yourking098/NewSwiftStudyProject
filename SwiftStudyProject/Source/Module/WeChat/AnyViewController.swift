//
//  AnyViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/4/25.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class AnyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        //区间运算符可以用来表示两个操作数之间的范围集合。
        self.title = "Any、AnyObject与类型转化";
        // Do any additional setup after loading the view.
        
        
        
        /**
         Any、AnyObject
         Any是一个空协议集合的别名，它表示没有实现任何协议，因此它可以是任何类型，包括类实例与结构体实例。可以表示任何类型，包括函数类型。
         AnyObject是一个成员为空的协议，任何对象都实现了这个协议。可以表示任何类类型的实例。
         **/
        
        let arrayData:[Any] = [12,"zhangsan"]
        
        
        /**
         类型转化符号
         
         is : 使用类型检查操作符 （ is ）来检查一个实例是否属于一个特定的子类。如果实例是该子类类型，类型检查操作符返回 true ，否则返回 false 。
         **/
        
        // 2.取出数组中的第一个和最后一个元素
        let objFirst = arrayData.first
        let objLast = arrayData.last
        
        // 3.判断第一个元素是否是一个Int类型
        if objFirst is Int {
            print("是Int类型")
        } else {
            print("非Int类型")
        }
        
        /**
         as : 类型转换操作符（ as? 或 as! ）进行向下类型转换至其子类类型。
         
         如果不确定向下转换类型是否能够成功，使用条件形式的类型转换操作符 （ as? ）
         如果确定向下转换类型会成功时，使用强制形式的类型转换操作符（ as! ）
         **/
        // 4.转成真正的类型来使用
        // 4.1.as? 将Any转成可选类型,通过判断可选类型是否有值,来决定是否转化成功了
        let name = objLast as? String
        print("\(name)")//Optional("zhangsan")
        
        // 4.2.as! 将Any转成具体的类型,如果不是该类型,那么程序会崩溃
        let name1 = objLast as! String
        print("\(name1)")//zhangsan
        
        
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
