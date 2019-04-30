//
//  UILabelViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/4/29.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class UILabelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        self.title = "文本标签（UILabel）";
        
        // Do any additional setup after loading the view.
        //1，标签的创建
        let label = UILabel(frame: CGRect(x: 10, y: 120, width: 300, height: 100))
        label.text = "www.baidu.com"
        // 2，背景颜色和文字颜色的设置
        label.textColor = .white
//        label.backgroundColor = .black
        // 3，对齐方式的设置
        label.textAlignment = .right
        // 4，文字阴影的设置
        label.shadowColor = UIColor.gray  //灰色阴影
        label.shadowOffset = CGSize(width:1.5, height:1.5)  //阴影的偏移量
        // 5，字体的设置
        label.font = UIFont(name:"Zapfino", size:25)
        // 6，文字过长时的省略方式
        label.lineBreakMode = .byTruncatingTail  //隐藏尾部并显示省略号
        // 7，文字大小自适应标签宽度
        label.adjustsFontSizeToFitWidth = true //当文字超出标签宽度时，自动调整文字大小，使其不被截断
        // 8，使标签可以显示多行文字
        label.numberOfLines = 2  //显示两行文字（默认只显示一行，设为0表示没有行数限制）
        // 9，设置文本高亮
        //设置文本高亮
        label.isHighlighted = true
        //设置文本高亮颜色
        label.highlightedTextColor = UIColor.green
        self.view.addSubview(label)
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
