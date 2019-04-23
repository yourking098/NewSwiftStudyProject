//
//  ComplexDataTypesViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/4/18.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class ComplexDataTypesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        //区间运算符可以用来表示两个操作数之间的范围集合。
        self.title = "数组";
        
        self.ArrayMethod()
        
    }
    
    //一、数组 - Array
    func ArrayMethod() {
        var types:Array = ["none","warning","error"]
        print("types数组：\(types)")
        
        var members = [String]()//声明一个空数组
        members.append("xx") //添加元素
        members += ["ksd"] //添加元素
        members.insert("first", at: 0)
        print("members数组：\(members)")
        
        members[1] = "唯楚有才是" //通过下标修改数组中的数据
        print("修改后的members数组：\(members)")
        
        members[0...2] = ["柘城枯","夸夸","圧柘城"]//通过小标区间替换数据（前3个数据）
        print("通过小标区间替换数据的members数组：\(members)")
        
        members.swapAt(1, 2)//交换元素位置（第2个和第3个元素位置进行交换）
        print("交换元素位置的members数组：\(members)")
        
        members.remove(at: 1)
        print("移除第二个的members数组：\(members)")
        
        members.removeLast()
        print("移除最后一个的members数组：\(members)")

        let addStringArr = types + members //数组组合
        print("数组组合：\(addStringArr)")
        
        for value in addStringArr {
            print("使用for in 实现数组遍历：\(value)")
        }
        
        for (index,value) in addStringArr.enumerated() {
            print("通过enumerate函数同时遍历数组的所有索引与数据，索引：\(index)数据：\(value)")
        }
        
        /////TEST///////
        let newTypes = addStringArr.filter{$0.count < 6}
        print("过滤数组元素\(newTypes)")
        
        //创建包含100个元素的数组 ["条目0", "条目1" ... "条目99"]
        let items = Array(0..<100).map{"条目\($0)"}
        print("创建0-100的数组\(items)")
        
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
