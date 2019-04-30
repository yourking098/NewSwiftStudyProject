//
//  UIProgressViewViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/4/30.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class UIProgressViewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        self.title = "进度条（UIProgressView）的用法";
        
        // 1，创建进度条
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.center = view.center
        progressView.progress = 0.2
        // 2，设置进度，同时有动画效果
        progressView.setProgress(0.8, animated: true)
        // 3，改变进度条颜色
        progressView.progressTintColor = .green
        progressView.trackTintColor = .blue
        view.addSubview(progressView)
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
