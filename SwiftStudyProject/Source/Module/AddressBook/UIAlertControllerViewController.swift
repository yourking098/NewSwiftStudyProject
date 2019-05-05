//
//  UIAlertControllerViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/5/5.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class UIAlertControllerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        self.title = "告警提示框（UIAlertController）的用法";
        //自 iOS8 起，苹果就建议告警框使用 UIAlertController 来代替 UIAlertView 和 UIActionSheel。下面总结了一些常见的用法。
        
        self.action()
    }
    
    //1，简单的应用（同时按钮响应Handler使用闭包函数）
    func action() {
        let alertController = UIAlertController(title: "系统提示", message: "你确定离开么？", preferredStyle: .alert)
        let cancleAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        // 3，按钮使用“告警”样式（文字颜色变红，用来来警示用户  destructive）
        let okAction = UIAlertAction(title: "好的", style: .destructive) { action in
            print("点击了确定")
            self.actionSheet()
        }
        alertController.addAction(cancleAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // 2，除了弹出，还可以使用从底部向上滑出的样式
    // （注意：如果上拉菜单中有“取消”按钮的话，那么它永远都会出现在菜单的底部，不管添加的次序是如何）
    func actionSheet() {
        let alertController = UIAlertController(title: "保存或删除数据", message: "删除数据将不可恢复", preferredStyle: .actionSheet)
        let cancleAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let deleteAction = UIAlertAction(title: "删除", style: .destructive, handler: nil)
        let saveAction = UIAlertAction(title: "保存", style: .default) { action in
            self.alertTextField()
        }
        alertController.addAction(cancleAction)
        alertController.addAction(deleteAction)
        alertController.addAction(saveAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // 4，添加任意数量文本输入框（比如可以用来实现个登陆框）
    func alertTextField() {
        let alertController = UIAlertController(title: "系统登录", message: "请输入用户名和密码", preferredStyle: .alert)
        alertController.addTextField { (textFiled:UITextField) in
            textFiled.placeholder = "用户名"
        }
        alertController.addTextField { (textFiled:UITextField) in
            textFiled.placeholder = "密码"
            textFiled.isSecureTextEntry = true
        }
        let cancleAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "好的", style: .default) { (action:UIAlertAction) in
            let login = alertController.textFields!.first!
            let password = alertController.textFields!.last!
            print("用户名：\(login.text) 密码：\(password.text)")
            
            self.saveSuccessAlert()
        }
        alertController.addAction(cancleAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // 6，提示框弹出后，过段时间自动移除
    func saveSuccessAlert() {
        //使用类扩展
        UIAlertController.showAlert(message: "保存成功！")
        
//        let alertContoller = UIAlertController(title: "保存成功！", message: nil, preferredStyle: .alert)
//        self.present(alertContoller, animated: true, completion: nil)
//        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
//            self.presentedViewController?.dismiss(animated: true, completion: nil)
//        }
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

extension UIAlertController {
    //在指定视图控制器上弹出普通消息提示框
    static func showAlert(message: String, in viewController: UIViewController) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "确定", style: .cancel))
        viewController.present(alert, animated: true)
    }
    
    //在根视图控制器上弹出普通消息提示框
    static func showAlert(message: String) {
        if let vc = UIApplication.shared.keyWindow?.rootViewController {
            showAlert(message: message, in: vc)
        }
    }
    
    //在指定视图控制器上弹出确认框
    static func showConfirm(message: String, in viewController: UIViewController,
                            confirm: ((UIAlertAction)->Void)?) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "取消", style: .cancel))
        alert.addAction(UIAlertAction(title: "确定", style: .default, handler: confirm))
        viewController.present(alert, animated: true)
    }
    
    //在根视图控制器上弹出确认框
    static func showConfirm(message: String, confirm: ((UIAlertAction)->Void)?) {
        if let vc = UIApplication.shared.keyWindow?.rootViewController {
            showConfirm(message: message, in: vc, confirm: confirm)
        }
    }
}
