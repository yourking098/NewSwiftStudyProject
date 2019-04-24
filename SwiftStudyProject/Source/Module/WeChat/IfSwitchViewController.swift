//
//  IfSwitchViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/4/23.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class IfSwitchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        //区间运算符可以用来表示两个操作数之间的范围集合。
        self.title = "if、switch控制流";
        
        self.IfMethod()
        self.SwitchMethod()
        self.SwitchSectionMethod()
        self.SwitchSingleSectionMethod()
        self.SwitchTrupleMethod()
        self.SwitchWhereMethod()
    }
    
    func IfMethod() {
        let count = 5
        if count >= 3 {
            print("yes")
        }else{
            print("no")
        }
    }
    
    //Swift中不需要在case块中显示地使用break跳出switch。如果想要实现C风格的落入特性，可以给需要的case分支插入fallthrough语句
    func SwitchMethod() {
        let fruit = "apple"
        switch fruit{
        case "apple":
            print("good")
            break
        //fallthrough
        case "banana","orange":
            print("great")
            break
        default:
            print("bad")
        }
    }
    
    //case分支进行区间匹配
    func SwitchSectionMethod() {
        let age = 5
        switch age {
        case 0...11:
            print("正太")
        case 12...30:
            print("少年")
        default:
            print("大叔")
        }
    }
    
    //case单侧区间匹配
    func SwitchSingleSectionMethod() {
        let num = 0
        switch num {
        case ..<0:
            print("负数")
        case 0:
            print("0")
        case 0...:
            print("正数")
        default:
            print("未知")
        }
    }
    
    // 使用元组匹配（判断属于哪个象限）
    func SwitchTrupleMethod() {
        let point = (2,2)
        switch point {
        case (0,0):
            print("坐标在原点")
        case (_,0):
            print("坐标在x轴上")
        case (0,_):
            print("坐标在y轴上")
        case (-3...3, -3...3):
            print("坐标在长宽为6的正方形内")
        default:
            print("在什么地方")
        }
    }
    
    //case中还可以使用where关键字来做额外的判断条件
    func SwitchWhereMethod()  {
        let height = 1.72
        switch height{
        case 1...3 where height == 1.72:
            print("case 1")
        case 1...3 where height == 2:
            print("case 2")
        default:
            print("default")
        }
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
