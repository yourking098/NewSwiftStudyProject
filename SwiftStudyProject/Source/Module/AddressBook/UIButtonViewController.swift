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
        button.setTitle("普通状态普通状态普通状态", for: .normal)
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
        // 7，按钮文字图标的设置
        button.setImage(UIImage(named: "tabbar_meHL"), for: .normal)//设置图标
        button.adjustsImageWhenHighlighted = false//使触摸模式下按钮也不会变暗（半透明）
        button.adjustsImageWhenDisabled = false//使禁用模式下按钮也不会变暗（半透明）
        // （2）也可以设置成保留图标原来的颜色
        let image = UIImage(named: "tabbar_meHL")?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        // 8，设置按钮背景图片
        button.setBackgroundImage(image, for: .normal)
        // 9，按钮触摸点击事件响应
        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        
        // 10，按钮文字太长时的处理方法
        button.titleLabel?.lineBreakMode = .byTruncatingMiddle
        
        view.addSubview(button)
    }
    
    /**
     常用的触摸事件类型：
     touchDown：单点触摸按下事件，点触屏幕
     touchDownRepeat：多点触摸按下事件，点触计数大于1，按下第2、3或第4根手指的时候
     touchDragInside：触摸在控件内拖动时
     touchDragOutside：触摸在控件外拖动时
     touchDragEnter：触摸从控件之外拖动到内部时
     touchDragExit：触摸从控件内部拖动到外部时
     touchUpInside：在控件之内触摸并抬起事件
     touchUpOutside：在控件之外触摸抬起事件
     touchCancel：触摸取消事件，即一次触摸因为放上太多手指而被取消，或者电话打断
     **/
    @objc func tapped(_ button:UIButton) {
        print("\(button.title(for: .normal) ?? "")")
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
