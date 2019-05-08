//
//  UIDatePickerViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/5/6.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class UIDatePickerViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "日期选择控件（UIDatePicker）的用法";
        
        // Do any additional setup after loading the view.
         //创建日期选择器
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 100, width: 300, height: 216))
        //3，将日期选择器区域设置为中文，则选择器日期显示为中文
        datePicker.locale = Locale(identifier: "zh_CN")
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        // 4，改变控件时间选择模式
        datePicker.datePickerMode = .date// 默认情况下日期选择控件里面选项既有日期，又有时间。我们可以修改选择模式，让它只有其中一种。
        //5，修改文字颜色
        datePicker.backgroundColor = UIColor.black
        datePicker.setValue(UIColor.white, forKey: "textColor")
        self.view.addSubview(datePicker)
    }
    
    @objc func dateChanged(_ datePicker:UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        print(formatter.string(from: datePicker.date))
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
