//
//  ClassDeinitViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/4/24.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class ClassDeinitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        //区间运算符可以用来表示两个操作数之间的范围集合。
        self.title = "类反初始化";
        
        var dbClass:DBClass? = DBClass()
        dbClass = nil;
        
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
