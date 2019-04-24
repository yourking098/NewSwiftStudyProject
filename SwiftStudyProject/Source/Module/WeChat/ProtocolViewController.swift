//
//  ProtocolViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/4/24.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class ProtocolViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        //区间运算符可以用来表示两个操作数之间的范围集合。
        self.title = "协议（protocol）";
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

// 1，Swift中协议类似于别的语言里的接口，协议里只做方法的声明，包括方法名、返回值、参数等信息，而没有具体的方法实现。
protocol ProtocolPerson {
    //读写属性
    var name:String{get set}
    
    //只读属性
    var age:Int{get}
    
    //类型方法
    static func method1()
    
    //实例方法
    func method2() -> Int
    
    //突变方法
    mutating func method3()
}



//2，协议可以继承另一个协议
protocol Animal{
    func move()
}

protocol Bird:Animal{
    func song()
}

class Chiken:Bird{
    func song(){
        print("母鸡咯咯")
    }
    
    func move(){
        print("母鸡走")
    }
}

// 3，如果某个类集继承了某个父类，又遵循了某个协议，那么冒号后面应该先写父类，再写协议

class CC:Chiken, ProtocolPerson{
    var name: String = ""
    
    var age: Int = 0
    
    static func method1() {
        
    }
    
    func method2() -> Int {
        return 0
    }
    
    func method3() {
        
    }
}
