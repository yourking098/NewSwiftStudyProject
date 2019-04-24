//
//  SubStringViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/4/24.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class SubStringViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        //区间运算符可以用来表示两个操作数之间的范围集合。
        self.title = "下标脚本方法介绍及实例";
        // Do any additional setup after loading the view.
        
        let str = SubString(str:"hangge.com")
        print(str[7,3])  //获取字符串：com
        print(str[7])  //获取字符：c
        
        str[7,3] = "COM"  //设置部分字符串
        str[0] = "H" //设置部分字符
        print(str[0,10]) //Hangge.COM
        
        
        var strSubstring = "hangge.com"
        print("String Substring:\(strSubstring[7,3])")
        print("String Substring:\(strSubstring[7])")
        
        strSubstring[7,3] = "COM"
        strSubstring[0] = "H"
        
        print("String Substring:\(strSubstring[0,10])")
        
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


extension String {
    subscript(start:Int, length:Int) -> String {
        get {
            let index1 = self.index(self.startIndex, offsetBy: start)
            let index2 = self.index(index1, offsetBy: length)
            let range = Range(uncheckedBounds: (lower: index1, upper: index2))
            return self.substring(with: range)
        }
        set {
            let tmp = self
            var s = ""
            var e = ""
            for (idx, item) in tmp.enumerated() {
                if(idx < start) {
                    s += "\(item)"
                }
                if(idx >= start + length) {
                    e += "\(item)"
                }
            }
            self = s + newValue + e
        }
    }
    
    subscript(index:Int) -> String {
        get {
            return String(self[self.index(self.startIndex, offsetBy: index)])
        }
        set {
            let tmp = self
            self = ""
            for (idx, item) in tmp.enumerated() {
                if idx == index {
                    self += "\(newValue)"
                } else {
                    self += "\(item)"
                }
            }
        }
    }
}
