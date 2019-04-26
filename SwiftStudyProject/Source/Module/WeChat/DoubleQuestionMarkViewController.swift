//
//  DoubleQuestionMarkViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/4/26.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class DoubleQuestionMarkViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        //区间运算符可以用来表示两个操作数之间的范围集合。
        self.title = "闭包";
        // Do any additional setup after loading the view.
        
        //Swift 提供了双问号操作符（??），英文叫 Double Question Mark。可以用来快速对 nil 进行条件判断。当我们获取一个可选值（optional value）时，如果希望其为 nil 的情况下返回一个非 nil 值，那么就可以把这个返回值放在 ?? 后面。下面演示几个常见的使用场景。
       
        // 1，可选值不为nil则使用可选值，为nil则使用默认值
        // 比如我们把 userName 这个参数值显示在 label 中，但希望 userName 如果为 nil 的话便显示"未知用户"。
        
        //这个我们可以使用三元条件运算来实现
//        var userName:String?
//        self.label.text = userName != nil ? userName : "未知用户"
        
        // 但使用双问号操作符会更加简单：
//        var userName:String?
//        self.label.text = userName ?? "未知用户"
        
        // 2，as? 类型转换后处理nil值
//        let message = json["message"] as? String ?? "no message"
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
