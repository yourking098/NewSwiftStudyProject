//
//  Person.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2018/11/2.
//  Copyright © 2018 chanvalenty. All rights reserved.
//

import UIKit

class Person: NSObject {
    //类属性
    var name:String = "valenty"
    var age:Int = 12
    //类构造函数
    init(newName:String,newAge:Int) {
        self.name = newName
        self.age = newAge
    }
    
    init(newName:String,newAge:Int,isRefresh:Bool) {
        if isRefresh {
            self.name = newName
            self.age = newAge
        }
    }
    //成员函数（实例方法）
    func say() -> String {
        return "我叫\(self.name),今年\(self.age)岁"
    }
}
