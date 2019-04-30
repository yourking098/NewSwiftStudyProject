//
//  UITextViewViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/4/30.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class UITextViewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        self.title = "多行文本输入框（UITextView）的用法";
        // 1，多行文本控件的创建
        let textView = UITextView(frame: CGRect(x: 10, y: 100, width: 200, height: 100))
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.gray.cgColor
        // 2，是否可编辑
        textView.isEditable = true
        // 3，内容是否可选
//        textView.isSelectable = false
        // 4，属性font设置字体，textColor设置字体颜色，textAlignment设置对齐方式
        //5，给文字中的电话号码和网址自动加链接
//        textView.dataDetectorTypes = []//不加链接
        textView.dataDetectorTypes = .link//只有网址加链接
        // 6，自定义选择内容后的菜单
        let mail = UIMenuItem(title: "邮件", action: #selector(self.onMail))
        let weixin = UIMenuItem(title: "微信", action: #selector(self.onWeixin))
        let menu = UIMenuController()
        menu.menuItems = [mail,weixin]
        
        view.addSubview(textView)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func onMail() {
        print("Mail")
    }
    
    @objc func onWeixin() {
        print("Weixin")
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
