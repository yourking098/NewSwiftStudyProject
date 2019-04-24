//
//  FunctionViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/4/23.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class FunctionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        //区间运算符可以用来表示两个操作数之间的范围集合。
        self.title = "自定义函数规则";
        
        let x = self.test3(name: "sdf")
        print(x.0)
        
        let xx = test4(numbers: 10,12,3,4,5)
        print(xx)
        
        
        var age = 22
        self.add(age: &age)
        print("outer age:\(age)")
        
        self.printAdditiveResult(addFun: self.additive(a:b:), a: 5, b: 7)
        
        
        //测试
        let aFun = chooseFunction(backwards: 3>2)
        print(aFun(3))  //2
    }
    
    //1，无返回值的函数
    func test1(name:String) {
        
    }
    
    //2，返回一个返回值
    func test2(name:String) -> Bool {
        return true
    }
    
    //3，返回由多个值组成的复合返回值
    func test3(name:String) -> (Int,Bool) {
        let position = 1
        let visible = false
        return (position,visible)
    }
    
    // 4，可变形参：可以接受0个或者任意数量的输入参数
    func test4(numbers:Int...) -> Int {
        var count:Int = 0
        for number in numbers{
            count += number
        }
        return count
    }
    
    // 5，如果想要同时改变函数内外的参数值，可以利用inout关键字，同时调用函数的时候给参数加上前缀“&”
    func add(age:inout Int){
        age += 1
        print("inner age:\(age)")
    }
    
    // 6，可以使用函数类型的参数
    func additive(a:Int, b:Int) -> Int{
        return a + b
    }
    //函数类型的参数
    func printAdditiveResult(addFun: (Int, Int) -> Int, a:Int, b:Int){
        print("Result:\(addFun(a,b))")
    }
    

    // 7，使用函数类型的返回值
    //定义个自增函数
    func increase(input:Int) -> Int{
        return input + 1
    }
    
    //定义个自减函数
    func reduce(input:Int) -> Int{
        return input - 1
    }
    //定义一个返回函数类型的函数
    func chooseFunction(backwards:Bool) -> (Int) -> Int{
        return backwards ? reduce : increase
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
