//
//  ClassInitViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/4/24.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class ClassInitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        //区间运算符可以用来表示两个操作数之间的范围集合。
        self.title = "类初始化";
        
        let student = Student()
        student.name = "陈"
        
        
        /********************************
         自定义构造函数
         ********************************/
        let person = Person(newName: "陈重煌", newAge: 22, isRefresh: false)
        print(person.say())
        
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
