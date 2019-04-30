//
//  UITextFieldViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/4/30.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class UITextFieldViewController: UIViewController,UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        self.title = "文本输入框（UITextField）";
        
        let textField = UITextField(frame: CGRect(x: 10, y: 150, width: 200, height: 30))
        //1，文本框的创建，有如下几个样式：
        /**
         UITextBorderStyle.none：无边框
         UITextBorderStyle.line：直线边框
         UITextBorderStyle.roundedRect：圆角矩形边框
         UITextBorderStyle.bezel：边线+阴影
         **/
        //设置边框样式为圆角矩形
        textField.borderStyle = .roundedRect
        // 2，修改边框颜色、粗细、圆角半径
        textField.layer.cornerRadius = 5
        textField.layer.masksToBounds = true
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.borderWidth = 1
        // 3，文本框提示文字
        textField.placeholder = "请输入姓名"
        // 4，文字大小超过文本框长度时自动缩小字号，而不是隐藏显示省略号
        textField.adjustsFontSizeToFitWidth = true
        textField.minimumFontSize = 10
        // 5，水平/垂直对齐方式
        textField.textAlignment = .right//水平右对齐
        textField.contentVerticalAlignment = .bottom //垂直向下对齐
        // 6，背景图片设置
        textField.borderStyle = .none//先要去除边框样式
        textField.background = UIImage(named: "tabbar_meHL")
        // 7，清除按钮（输入框内右侧小叉）
        textField.clearButtonMode = .whileEditing
        // 8，密码输入框
        textField.isSecureTextEntry = true
        // 9，设置文本框关联的键盘类型
        textField.keyboardType = .asciiCapable
        // 10，使文本框在界面打开时就获取焦点，并弹出输入键盘
        textField.becomeFirstResponder()
        // 11，使文本框失去焦点，并收回键盘
//        textField.resignFirstResponder()
        // 12，设置键盘 return 键的样式
        textField.returnKeyType = .join
        // 13，键盘 return 键的响应
        textField.delegate = self
        view.addSubview(textField)
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("\(textField.text ?? "")")
        return textField.resignFirstResponder()
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
