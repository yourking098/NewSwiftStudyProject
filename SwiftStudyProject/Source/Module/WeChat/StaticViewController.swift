//
//  StaticViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/4/24.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class StaticViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        /**
         static 可以在类、结构体、或者枚举中使用。而 class 只能在类中使用。
         static 可以修饰存储属性，static 修饰的存储属性称为静态变量(常量)。而 class 不能修饰存储属性。
         static 修饰的计算属性不能被重写。而 class 修饰的可以被重写。
         static 修饰的静态方法不能被重写。而 class 修饰的类方法可以被重写。
         class 修饰的计算属性被重写时，可以使用 static 让其变为静态属性。
         class 修饰的类方法被重写时，可以使用 static 让方法变为静态方法。
         
         **/
        
        //区间运算符可以用来表示两个操作数之间的范围集合。
        self.title = "类方法、静态方法";
        // Do any additional setup after loading the view.
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


/**
 类和结构体有许多相同之处，也有许多不同之处。
 
 二者区别如下：
 1，类可以继承，结构体不可以
 2，可以让一个类的实例来反初始化，释放存储空间，结构体做不到
 3，类的对象是引用类型，而结构体是值类型。所以类的赋值是传递引用，结构体则是传值。
 
 相同点：
 1，类和结构体都可以扩展
 2，定义属性用于储存值
 3，定义方法用于提供功能
 4，定义下标用于通过下标语法访问值
 5，定义初始化器用于生成初始化值
**/

struct StructAccount {
    var amount : Double = 0.0                 //账户金额
    var owner : String = ""                   //账户名
    
    static var interestRate : Double = 0.668  //利率
    
    static func interestBy(amount : Double) -> Double {
        return interestRate * amount
    }
}

class ClassAccount {
    var amount : Double = 0.0                 //账户金额
    var owner : String = ""                   //账户名
    
    static var interestRate : Double = 0.668  //利率
    
    static func interestBy(amount : Double) -> Double {
        return interestRate * amount
    }
}
