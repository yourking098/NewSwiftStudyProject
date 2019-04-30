//
//  UISegmentedControlViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/4/30.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class UISegmentedControlViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        self.title = "分段选择控件（UISegmentedControl）的用法";
        
        // 1，选择控件的创建，并监听控件选择值
        let items = ["选项一", "选项二",UIImage(named: "tabbar_meHL")
            ] as [Any]
        let segment = UISegmentedControl(items: items)
        
        segment.selectedSegmentIndex = 1
        segment.addTarget(self, action: #selector(self.segmentDidchange(_:)), for: .valueChanged)
        
        // 2，选择控件中选项的添加和删除
        segment.insertSegment(withTitle: "新增选项", at: 1, animated: true)//添加文字选项
        segment.insertSegment(with: UIImage(named: "tabbar_me")!, at: 1, animated: true)//添加图片选项
        segment.removeSegment(at: 1, animated: true)//移除选项
        // 3，修改选项颜色（包括图片选项）
        segment.tintColor = .red
        // 4，修改选项颜色（包括图片选项）
        segment.setTitle("swift title", forSegmentAt: 1)
        // 5，修改选项图片
        segment.setImage(UIImage(named: "tabbar_mainframeHL")!, forSegmentAt: 1)//图片会自动变成红色
        segment.setImage(UIImage(named: "tabbar_contactsHL")!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), forSegmentAt: 0)//图标保留原来的颜色
        // 6，修改选项内容偏移位置
        segment.setContentOffset(CGSize(width: 10, height: 7), forSegmentAt: 0)
        
        segment.center = self.view.center
        view.addSubview(segment)
        
    }
    
    @objc func segmentDidchange(_ segment:UISegmentedControl) {
        print("\(segment.selectedSegmentIndex)")
        print("\(segment.titleForSegment(at: segment.selectedSegmentIndex) ?? "")")
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
