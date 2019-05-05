//
//  MyAlertController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/5/5.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class MyAlertController: UIAlertController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        //一、修改标题的字体和颜色
        let titleFont = UIFont.systemFont(ofSize: 20)
        let titleAttribute = NSMutableAttributedString.init(string: self.title!)
        titleAttribute.addAttributes([NSAttributedString.Key.font:titleFont,
                                      NSAttributedString.Key.foregroundColor:UIColor.red],
                                     range:NSMakeRange(0, (self.title?.count)!))
        self.setValue(titleAttribute, forKey: "attributedTitle")
        
        
        //消息内容样式（灰色斜体）
        let messageFontDescriptor = UIFontDescriptor.init(fontAttributes: [
            UIFontDescriptor.AttributeName.family:"Arial",
            UIFontDescriptor.AttributeName.name:"Arial-ItalicMT",
            ])
        let messageFont = UIFont.init(descriptor: messageFontDescriptor, size: 13.0)
        let messageAttribute = NSMutableAttributedString.init(string: self.message!)
        messageAttribute.addAttributes([NSAttributedString.Key.font:messageFont,
                                        NSAttributedString.Key.foregroundColor:UIColor.gray],
                                       range:NSMakeRange(0, (self.message?.count)!))
        self.setValue(messageAttribute, forKey: "attributedMessage")
        
    }
    
    // 二、修改按钮的样式
    override func addAction(_ action: UIAlertAction) {
        super.addAction(action)
//        self.view.tintColor = UIColor.orange
        //也可以通过设置 action.setValue 来实现
        //action.setValue(UIColor.orange, forKey:"titleTextColor")
        
        if action.style == .default {
            let iconImage = UIImage(named: "ic_serviceDetail_rightIcon")?.withRenderingMode(.alwaysOriginal)
            action.setValue(iconImage, forKey: "image")
            action.setValue(UIColor.green, forKey: "titleTextColor")
        } else if action.style == .cancel {
            let iconImage = UIImage(named: "ic_service_code_close")?.withRenderingMode(.alwaysOriginal)
            action.setValue(iconImage, forKey: "image")
            action.setValue(UIColor.red, forKey: "titleTextColor")
        }
    }
    
    // 2，在按钮上添加图标
    // （1）下面我们在确定和取消按钮上分别添加相应的图标，同时两个按钮的文字颜色也不一样。
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
