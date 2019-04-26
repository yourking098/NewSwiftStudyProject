//
//  GenericityViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/4/25.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class GenericityViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        //区间运算符可以用来表示两个操作数之间的范围集合。
        self.title = "闭包";
        // Do any additional setup after loading the view.
        
        
        var oneInt = 3
        var twoInt = 4
        swapTwoInts(&oneInt, &twoInt)
        print(oneInt,twoInt)
        
        
        //泛型函数
        var oneInt1 = 3
        var twoInt1 = 4
        swapTwoValues(&oneInt1, &twoInt1)
        print(oneInt1,twoInt1)
        
        var oneStr = "hello"
        var twoStr = "world"
        swapTwoValues(&oneStr, &twoStr)
        print("oneStr:\(oneStr),twoStr:\(twoStr)")
        
        var oneDouble = 10.01
        var twoDouble = 20.02
        swapTwoValues(&oneDouble, &twoDouble)
        print("oneDouble:\(oneDouble),twoDouble:\(twoDouble)")

        
        
        /**
         关联类型
         
         关联类型通过 associatedtype 关键字指定
         Element 起到了占位符的作用，指示了某种类型
         在实现的时候不能直接用 Element
         Element 在遵守协议中协议方法中明确泛型的类型
         
         **/
        TestStruct().method1(element: "Hello")
        TestStruct().method2(element: "World")
    }
    
    //一个案例引发的思考
    func swapTwoInts(_ a: inout Int, _ b: inout Int) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
   
    //如果此时我们想交换两个Double类型、或者是其他类型的值，就需要针对不同的类型写类似的方法，但是这些方法仅仅只是参数类型不同。如何解决？—— 泛型
    func swapTwoValues<T>(_ a:inout T,_ b:inout T) {
        let temA = a
        a = b
        b = temA
    }
    
    
    /**
     类型参数
     类型参数指定并命名一个占位符类型，并用<>包裹，放在函数名后面,如上面例子中的 <T>。可以用它来指定参数类型，或者返回值的类型。在真正调用的时候会被实际的类型替代，如传递的是Int，就替换为Int，如果传入的是Double类型就替换为Double等等
     类型约束
     
     上面的swapTwoValues(_:_:)函数可以用于任意类型。但是，有时在用于泛型函数需要遵循特定的类型。
     类型约束指出一个类型形式参数必须继承自特定类，或者遵循一个特定的协议、组合协议。
     语法
     
     func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
     }
     **/
    
}


/**
 关联类型
 
 关联类型通过 associatedtype 关键字指定
 Element 起到了占位符的作用，指示了某种类型
 在实现的时候不能直接用 Element
 Element 在遵守协议中协议方法中明确泛型的类型
 
 **/
protocol SomeProtocol {
    //关联类型通过 associatedtype 关键字指定
    associatedtype Element
    
    func method1(element: Element)//Element 起到了占位符的作用，指示了某种类型
    func method2(element: Element)
}

struct TestStruct: SomeProtocol {
    
    func method1(element: String) {//在实现的时候不能直接用 Element
        print("method1: \(element)")
    }
    
    func method2(element: String) {
        print("method2: \(element)")
    }
}

//给关联类型添加约束
//要遵循这个版本的 Container ，容器的 Item 必须遵循 Equatable 协议
protocol SomeProtocol2 {
    
    associatedtype Element: Equatable
    
    func method1(element: Element)
    func method2(element: Element)
}
