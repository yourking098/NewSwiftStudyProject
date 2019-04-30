//
//  UISwitchViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/4/30.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class UISwitchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        self.title = "开关按钮（UISwitch）的用法";
        
        let uiswitch = UISwitch()
        uiswitch.center = CGPoint(x: 100, y: 150)
        uiswitch.isOn = true
        uiswitch.addTarget(self, action: #selector(switchDidChanged), for: .valueChanged)
        view.addSubview(uiswitch)
        // Do any additional setup after loading the view.
    }
    
    @objc func switchDidChanged(_ uiswitch:UISwitch) {
        print("\(uiswitch.isOn)")
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
