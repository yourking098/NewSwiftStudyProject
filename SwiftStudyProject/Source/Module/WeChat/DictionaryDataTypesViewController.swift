//
//  DictionaryDataTypesViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/4/23.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class DictionaryDataTypesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        //区间运算符可以用来表示两个操作数之间的范围集合。
        self.title = "字典";
        
        self.DictionMethod();
        // Do any additional setup after loading the view.
    }
    
    //字典 - Dictionary（即键值对）
    func DictionMethod() {
        var empty = [String: Int]()  //建立个空字典
        
        var myDic = ["name":"hangge",
                     "url":"hangge.com"]  //声明一个字典
        
        myDic["address"] = "china" //添加或修改key值
        myDic.removeValue(forKey: "name")  //删除"name"这个key值
        myDic["name"] = nil  //同样可以删除"name"这个key值
        
        //myDic.keys  //访问字典的key集合
        //myDic.values //访问字典的values集合
        //遍历字典
        for (key,value) in myDic {
            print("遍历字典键值：\(key):\(value)");
        }
        
        //只遍历字典的键（key）
        for key in myDic.keys {
            print("只遍历字典的键：\(key)");
        }
        
        //只遍历字典的值（value）
        for value in myDic.values {
            print("只遍历字典的值：\(value)");
        }
        
        //过滤字典元素
        let dict2 = myDic.filter {$0.value.count < 6}
        print("过滤字典元素：\(dict2)")
        
        //通过元组创建字典
        let tupleArray = [("Monday", 30),  ("Tuesday", 25),  ("Wednesday", 27)]
        let dictionary = Dictionary(uniqueKeysWithValues: tupleArray)
        print("通过元组创建字典：\(dictionary)") //["Monday": 30, "Tuesday": 25, "Wednesday": 27]
        
        //通过键值序列创建字典
        let names = ["Apple", "Pear"]
        let prices = [7, 6]
        let dict = Dictionary(uniqueKeysWithValues: zip(names, prices))
        print("通过键值序列创建字典：\(dict)") //["Pear": 6,  "Apple": 7]
        
        //只有键序列、或者值序列创建字典
        let array = ["Monday", "Tuesday", "Wednesday"]
        let dict3 = Dictionary(uniqueKeysWithValues: zip(1..., array))
        let dict4 = Dictionary(uniqueKeysWithValues: zip(array, 1...))
        print("值序列创建字典：\(dict3)")
        print("键序列创建字典：\(dict4)")
        
        //字典分组（比如下面生成一个以首字母分组的字典）
        let groupNames = ["Apple", "Pear", "Grape", "Peach"]
        let groupDict = Dictionary(grouping: groupNames) { $0.first! }
        
        print("字典分组：\(groupDict)") //["P": ["Pear", "Peach"], "G": ["Grape"], "A": ["Apple"]]
        
        //重复键的处理
        let repeatArray = ["Apple", "Pear", "Pear", "Orange"]
        let repeatDic = Dictionary(zip(repeatArray, repeatElement(1, count: array.count)), uniquingKeysWith: +)
        print("重复键的处理：\(repeatDic)") // ["Pear": 2, "Orange": 1, "Apple": 1]
        
        //下面使用元组创建字典时，遇到相同的键则取较小的那个值
        let duplicatesArray = [("Monday", 30),  ("Tuesday", 25),  ("Wednesday", 27), ("Monday", 28)]
        let dic = Dictionary(duplicatesArray, uniquingKeysWith: min)
        print("相同的键取较小的值：\(dic)") //["Monday": 28, "Tuesday": 25, "Wednesday": 27]
        
        //字典合并
        var mergeDic = ["one": 10, "two": 20]
        
        //merge方法合并 修改原始Dictionary
        let tuples = [("one", 5),  ("three", 30)]
        mergeDic.merge(tuples, uniquingKeysWith: min)
        print("merge字典合并：\(mergeDic)")
        
        //merging方法合并 返回一个全新的Dictionary
        let dic2 = ["one": 0, "four": 40]
        let mergingDic3 = mergeDic.merging(dic2, uniquingKeysWith: min)
        print("merging字典合并：\(mergingDic3)")
        
        //5，字典默认值
        let defaultDic1 = ["apple": 1, "banana": 2 ]
        var orange:Int
        if let value = defaultDic1["orange"] {
            orange = value
        }else{
            orange = 0
        }
        print("字典默认值1：\(orange)")
        
        
        let defaultFruit = defaultDic1["fruit",default:2]
        print("字典默认值：\(defaultFruit)")
        
        //下面是统计一个字符串中所有单词出现的次数。可以看到了有了默认值，实现起来会简单许多。
        let str = "apple banana orange apple banana"
        var wordsCount: [String: Int] = [:]
        for word in str.split(separator: " ") {
            wordsCount["\(word)", default: 0] += 1
        }
        print("字符串中所有单词出现的次数\(wordsCount)")
        
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
