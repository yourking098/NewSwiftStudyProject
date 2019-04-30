//
//  UIButtonViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/4/29.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class UIButtonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        self.title = "按钮（UIButton）";
        
        /**
         1，按钮的创建
         （1）按钮有下面四种类型：
         UIButtonType.system：前面不带图标，默认文字颜色为蓝色，有触摸时的高亮效果
         UIButtonType.custom：定制按钮，前面不带图标，默认文字颜色为白色，无触摸时的高亮效果
         UIButtonType.contactAdd：前面带“+”图标按钮，默认文字颜色为蓝色，有触摸时的高亮效果
         UIButtonType.detailDisclosure：前面带“!”图标按钮，默认文字颜色为蓝色，有触摸时的高亮效果
         UIButtonType.infoDark：为感叹号“!”圆形按钮
         UIButtonType.infoLight：为感叹号“!”圆形按钮
         （注意：自ios7起，infoDark、infoLight、detailDisclosure效果都是一样的）
         **/
        // 1，按钮的创建
        let button = UIButton(frame: CGRect(x: 10, y: 150, width: 300, height: 50))
        // 2，按钮的文字设置 
        button.setTitle("普通状态", for: .normal)
        button.setTitle("触摸状态", for: .highlighted)
        button.setTitle("禁用状态", for: .disabled)
        // 3，按钮文字颜色的设置
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.green, for: .highlighted)
        button.setTitleColor(.gray, for: .disabled)
        // 4，按钮文字阴影颜色的设置
        button.setTitleShadowColor(.green, for: .normal)
        button.setTitleShadowColor(.yellow, for: .highlighted)
        button.setTitleShadowColor(.gray, for: .disabled)
        // 5，按钮文字的字体和大小设置
        button.titleLabel?.font = .systemFont(ofSize: 40)
        // 6，按钮背景颜色设置
        button.backgroundColor = .white
        
        view.addSubview(button)
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
