//
//  UIStepperViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/5/5.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class UIStepperViewController: UIViewController {

    var stepper:UIStepper!
    var label:UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        self.title = "微调器或叫步进器（UIStepper）的用法";
        
        stepper = UIStepper()
        stepper.center = self.view.center
        stepper.maximumValue = 10
        stepper.minimumValue = 1
        stepper.value = 5.5
        //设置每次增减的值
        stepper.stepValue = 0.5
        //设置stepper可以按住不放来连续更改值
        stepper.isContinuous = true
        //设置stepper是否循环（到最大值时再增加数值从最小值开始）
        stepper.wraps = true
        stepper.addTarget(self, action: #selector(valueChange(_:)), for: .valueChanged)
        
        // 2，使用tintColor属性可以设置微调器的颜色。 而加减符号图标，背景图片，中间分割线图片都可以替换成自己图片。
        stepper.setDecrementImage(UIImage(named: "ic_service_code_close")?.withRenderingMode(.alwaysOriginal), for: .normal)
        stepper.setIncrementImage(UIImage(named: "ic_serviceDetail_rightIcon")?.withRenderingMode(.alwaysOriginal), for: .normal)
        stepper.setDividerImage(UIImage(named: "loading001")?.withRenderingMode(.alwaysOriginal), forLeftSegmentState: .normal, rightSegmentState: .normal)
        stepper.backgroundColor = UIColor.clear
        
        self.view.addSubview(stepper)
        
        label=UILabel(frame: CGRect(x: 100, y: 190, width: 300, height: 30))
        print(stepper.value)
        label.text = "当前值为：\(stepper.value)"
        self.view.addSubview(label)
    }
    

    @objc func valueChange(_ stepper:UIStepper) {
        label.text="当前值为：\(stepper.value)"
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
