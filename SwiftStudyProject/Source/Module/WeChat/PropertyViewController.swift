//
//  PropertyViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/4/24.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class PropertyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
         /**
         属性观察者，类似于触发器。用来监视属性的除初始化之外的属性值变化，当属性值发生改变时可以对此作出响应。有如下特点：
         1，不仅可以在属性值改变后触发didSet，也可以在属性值改变前触发willSet。
         2，给属性添加观察者必须要声明清楚属性类型，否则编译器报错。
         3，willSet可以带一个newName的参数，没有的话，该参数默认命名为newValue。
         4，didSet可以带一个oldName的参数，表示旧的属性，不带的话默认命名为oldValue。
         5，属性初始化时，willSet和didSet不会调用。只有在初始化上下文之外，当设置属性值时才会调用。
         6，即使是设置的值和原来值相同，willSet和didSet也会被调用
         **/
        
        self.view.backgroundColor = UIColor.white
        
        //区间运算符可以用来表示两个操作数之间的范围集合。
        self.title = "属性观察者";
        
        let people = People()
        people.firstName = "Li"
        people.lastName  = "Lei"
        people.age = 30
        people.name = "陈重"
        print(people.toSay())
    }
}

class People {
    var firstName:String = ""
    var lastName:String = ""
    var nickName:String = ""
    //计算属性
    var fullName:String {
        get {
            return firstName + lastName + nickName;
        }
//        或者直接写成
//        return firstName + lastName + nickName;
    }
    var age:Int = 0 {
        //我们需要在age属性变化前做点什么
        willSet {
            print("Will set an new value \(newValue) to age")
        }
        //我们需要在age属性发生变化后，更新一下nickName这个属性
        didSet {
            print("age changed form \(oldValue) to \(age)")
            if age < 10 {
                nickName = "Little"
            } else {
                nickName = "Big"
            }
        }
    }
    
    
    
    func toSay() -> String {
        return "我叫:\(name ?? ""),英文名是:\(fullName) " + ", 今年: \(age)岁,今天要讲的主题是：《\(title)》"
    }
    
    
    //1. 属性的读写方法
    private var _name:String?
    var name:String? {
        get {
            return _name;
        }
        set {
            _name = newValue;
        }
    }
    
    //2. 存储型属性 & 计算型属性
    /**
    存储型属性 - 需要开辟空间，以存储数据
    计算型属性 - 执行函数返回其他内存地址**/
    var title: String {
        get {
            return "Mr." + (name ?? "")
        }
        //return "Mr " + (name ?? "")
    }

    //3.计算型属性与懒加载的对比
    /**
    计算型属性
    不分配独立的存储空间保存计算结果
    每次调用时都会被执行**/

    var title2: String {
        return "Mr" + (name ?? "")
    }
    
    /*懒加载属性
     在第一次调用时，执行闭包并且分配空间存储闭包返回的数值
     会分配独立的存储空间
     与 OC 不同的是，lazy 属性即使被设置为 nil 也不会被再次调用*/
    
    lazy var title3: String = {
        return "Mr " + (self.name ?? "")
    }()
}
