//
//  EnumDataTypesViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/4/23.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class EnumDataTypesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        //区间运算符可以用来表示两个操作数之间的范围集合。
        self.title = "枚举";
        
        
        let directionToHead = CompassPoint.east
        print(directionToHead)
        
        
        let earthsOrder = Planet.earth.rawValue //rawValue来获取他的原始值:3
        print("获取枚举值：\(earthsOrder)")
        
        
        let directionDescription = Direction.up.description()
        print("重写枚举description方法：\(directionDescription)")
        // Do any additional setup after loading the view.
    }
    
}

enum CompassPoint {
    case north
    case south
    case east
    case west
}

enum Planet: Int {
    case mercury = 1
    case venus = 2
    case earth = 3
}

enum Direction {
    case up
    case down
    //重写description方法
    func description() -> String {
        switch self {
        case .up:
            return "向上"
        case .down:
            return "向下"
        }
    }
}
