//
//  StructDataTypesViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/4/23.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class StructDataTypesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        //区间运算符可以用来表示两个操作数之间的范围集合。
        self.title = "结构体";
        
        self.StructMethod()
        // Do any additional setup after loading the view.
    }
    
    //结构体
    func StructMethod() {
        var book1:BookInfo//默认构造器创建结构体实例
        var book2 = BookInfo(ID: 0021, Name: "书籍名称", Author: "test1223")//调用逐一构造器创建实例
        print("书本名称：\(book2.Name)")
        
        book2.ID = 12122 //修改内部值
        print("书本作者：\(book2.ID)")
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

struct BookInfo {
    var ID:Int = 0
    var Name:String = "Defaut"
    var Author:String = "Defaut"
}
