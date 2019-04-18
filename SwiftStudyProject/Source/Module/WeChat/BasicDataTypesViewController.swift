//
//  BasicDataTypesViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/3/13.
//  Copyright © 2019 chanvalenty. All rights reserved.
//  基本数据类型

import UIKit

class BasicDataTypesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        self.title = "基本数据类型";
        
        let str:String = "hangge.com"
        print("\(str.count)个字符")
        
        if str.hasSuffix("com") {
            print("包含com")
        }
        
        let tuple = (one:"yes",two:"123")
        print("元组第一个数据：\(tuple.one)")
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
