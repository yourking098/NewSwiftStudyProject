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
        
        let slider = UISlider(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        slider.center = view.center
        slider.minimumValue = 0//最小值
        slider.maximumValue = 1//最大值
        slider.value = 0.2//当前值
        slider.setValue(0.8, animated: true)
        view.addSubview(slider)
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
