//
//  CusomUIAlertControllerViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/5/5.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class CusomUIAlertControllerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
//        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        self.title = "自定义UIAlertController的样式（标题、按钮的字体和颜色）";
        //自 iOS8 起，苹果就建议告警框使用 UIAlertController 来代替 UIAlertView 和 UIActionSheel。下面总结了一些常见的用法。
        
        let alertController = MyAlertController(title: "系统提示",
                                                message: "您确定要离开 hangge.com 吗？",
                                                preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "好的", style: .default, handler: {
            action in
            print("点击了确定")
        })
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
        
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
