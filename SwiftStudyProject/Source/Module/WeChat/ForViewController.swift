//
//  ForViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/4/23.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class ForViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        //区间运算符可以用来表示两个操作数之间的范围集合。
        self.title = "for控制流";
        
        for i in 1..<10 {
            print("\(i)")
        }
        
        //遍历数组元素
        let numbers = [1,2,4,7]
        for value in numbers {
            print("遍历数组元素：\(value)")
        }
        
        //遍历字典
        let nameOfAge = ["lily":8,"Candy":24]
        for (name,age) in nameOfAge {
            print("遍历字典：\(name) 的年龄是 \(age) 岁")
        }
        
        //遍历字符串的字符
        for chare in "hangge" {
            print("遍历字符串的字符：\(chare)")
        }
        
        //for-each循环
        (1...10).forEach {
            print("for-each循环\($0)")//swift自动为闭包提供参数名缩写功能，可以直接通过$0和$1等来表示闭包中的第一个第二个参数，并且对应的参数类型会根据函数类型来进行判断
        }
        
        var i=0
        while i<100 {
            i += 1
        }
        
        repeat{
            i += 1
        } while i<100
        
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
