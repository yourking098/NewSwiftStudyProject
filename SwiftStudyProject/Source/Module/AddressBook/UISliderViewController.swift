//
//  UISliderViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/4/30.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class UISliderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        self.title = "滑块（UISlider）的用法";
        // 1，滑块的创建
        let slider = UISlider(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        slider.center = view.center
        slider.minimumValue = 0//最小值
        slider.maximumValue = 1//最大值
        slider.value = 0.2//当前值
        // 2，设置滑块的值，同时有动画
        slider.setValue(0.8, animated: true)
        // 3，滑块值改变响应
        slider.isContinuous = false//滑块滑动停止后才触发ValueChanged事件
        slider.addTarget(self, action: #selector(sliderDidchange(_:)), for: .valueChanged)
        // 4，滑块左右两边槽的颜色
        slider.minimumTrackTintColor = .red//左边的颜色
        slider.maximumTrackTintColor = .green//右边的颜色
        // 5，滑块后面槽线两侧添加图标
        slider.minimumValueImage = UIImage(named: "tabbar_me")//左边图标
        slider.maximumValueImage = UIImage(named: "tabbar_meHL")//右边图标
        // 6，自定义滑块组件图片
//        slider.setMaximumTrackImage(UIImage(named: "tabbar_contactsHL"), for: .normal)//设置滑块右边部分的图片
//        slider.setMinimumTrackImage(UIImage(named: "tabbar_contacts"), for: .normal)//设置滑块左边部分的图片
//        slider.setThumbImage(UIImage(named: "tabbar_discover"), for: .normal)//设置滑块的图片
        //7，设置滑块右边部分的图片-使用三宫格缩放（左右14像素不变，中间缩放）
//        let imgTrackRight = UIImage(named: "tabbar_discover")
//        let imgRight = imgTrackRight?.stretchableImage(withLeftCapWidth: 14, topCapHeight: 0)
//        slider.setMaximumTrackImage(imgRight, for: .normal)
        view.addSubview(slider)
    }
    
    @objc func sliderDidchange(_ silder:UISlider) {
        print(silder.value)
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
