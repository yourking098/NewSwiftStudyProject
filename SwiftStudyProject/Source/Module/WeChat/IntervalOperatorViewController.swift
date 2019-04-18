//
//  IntervalOperatorViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/4/18.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class IntervalOperatorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        //区间运算符可以用来表示两个操作数之间的范围集合。
        self.title = "区间运算符";
        
        //1，闭区间运算符：a...b
        for iCount in 1...100 {
            print("\(iCount)")
        }
        
        // 2，半闭区间运算符：a..<b
        var fruits:Array = ["apple","orange","banana"]
        let fruitsCount = fruits.count
        for i in 0..<fruitsCount {
            print("\(fruits[i])")
        }
        
        //3，倒序循环
        for i in (0..<fruitsCount).reversed() {
            print("\(fruits[i])")
        }
        
        //4，字符串范围也可以使用区间运算符
        let words = "Hangge.com"
        let index = words.index(words.startIndex, offsetBy: 4)
        print("index:\(words[index])")
        
        let index2 = words.index(words.startIndex, offsetBy: words.count-1)
        print("index2:\(words[index2])")
        
        //substring已废弃
        let range1 = Range(uncheckedBounds: (lower: index, upper: index2))
        let newWords = words.substring(with: range1)
        print("\(newWords)")
        
        //使用区间运算符
        let index3 = words.index(words.startIndex, offsetBy: 5)..<words.index(words.startIndex, offsetBy: 8)
        print("index3:\(words[index3])")//e.c
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
