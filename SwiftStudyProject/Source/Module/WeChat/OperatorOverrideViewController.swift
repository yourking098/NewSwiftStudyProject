//
//  OperatorOverrideViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/4/18.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class OperatorOverrideViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        //区间运算符可以用来表示两个操作数之间的范围集合。
        self.title = "运算符重载和运算符函数";
        
        //不能对默认的赋值运算符（=）进行重载，只有复合赋值运算符可以重载。三目条件运算符（a ? b : c）也不能进行重载。
        
        //1、双目运算符
        let plusCoordinate = Coordinate(x: 10,y: 10) + Coordinate(x: 20,y: 20)
        let minutesCoordinate = Coordinate(x: 50, y: 10) - Coordinate(x: 30,y: 5)
        print("双目运算符+：\(plusCoordinate)")
        print("双目运算符-：\(minutesCoordinate)")
        
        
        //2、前缀运算符、后缀运算符
        let point = Coordinate(x: 1.0, y: 1.0)
        let anotherPoint = Coordinate(x: 2.0, y: 2.0)
        
        print("前缀-（负）：\(-point)")
        print("前缀+（正）：\(+anotherPoint)")
        
        
        //3、复合赋值运算符
        var plusComPoint = Coordinate(x: 1.0, y: 1.0)
        let plusComAnotherPoint = Coordinate(x: 2.0, y: 2.0)
        
        plusComPoint += plusComAnotherPoint
        print("+=复合赋值运算符：\(plusComPoint)")
        
        var minutesComPoint = Coordinate(x: 1.0, y: 1.0)
        let minutesComAnotherPoint = Coordinate(x: 2.0, y: 2.0)
        
        minutesComPoint -= minutesComAnotherPoint
        print("-=复合赋值运算符：\(minutesComPoint)")
        
        
        //4、等价运算符
        let equalPoint = Coordinate(x: 1.0, y: 1.0)
        let anotherEqualPoint = Coordinate(x: 2.0, y: 2.0)
        
        print("相等运算符（==）：\(equalPoint == anotherEqualPoint)")
        print("不等运算符（!=）：\(equalPoint != anotherEqualPoint)")
        
        
        //5、自定义运算符
        var customPoint = Coordinate(x: 1.0, y: 6.0)
        let customAnotherPoint = +++customPoint
         print("自定义运算符（+++）：\(customAnotherPoint)")
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

//自定义运算符需要在全局作用域通过关键字operator进行定义，同时要指定prefix（前缀）、infix（中缀）或postfix（后缀）修饰符：
prefix operator  +++

struct Coordinate {
    
    var x: Double = 0.0
    var y: Double = 0.0
}

extension Coordinate {
    //1、双目运算符
    static func +(left: Coordinate, right: Coordinate) -> Coordinate {
        return Coordinate(x: left.x + right.x, y: left.y + right.y)
    }
    static func -(left: Coordinate, right: Coordinate) -> Coordinate {
        return Coordinate(x: left.x - right.x, y: left.y - right.y)
    }
    
    
    //2、前缀运算符、后缀运算符
    static prefix func +(coordinate:Coordinate) -> Coordinate {
        return Coordinate(x: +coordinate.x, y: +coordinate.y)
    }
    static prefix func -(coordinate:Coordinate) -> Coordinate {
        return Coordinate(x: -coordinate.x, y: -coordinate.y)
    }
    
    
    //3、复合赋值运算符
    static func +=(left: inout Coordinate, right:Coordinate) {
        left = Coordinate(x: left.x + right.x, y: left.y + right.y)
    }
    static func -=(left: inout Coordinate, right:Coordinate) {
        left = Coordinate(x: left.x - right.x, y: left.y - right.y)
    }
    
    
    //4、等价运算符
    static func ==(left:Coordinate,right:Coordinate) ->Bool {
        if left.x == right.x && left.y == right.y {
            return true
        }
        return false
    }
    static func !=(left:Coordinate,right:Coordinate) -> Bool {
        if left.x != right.x && left.y != right.y {
            return true
        }
        return false
    }
    
    
    //5、自定义运算符
    static prefix func +++(coordinate: inout Coordinate) -> Coordinate {
        coordinate += coordinate
        return coordinate
    }
}
