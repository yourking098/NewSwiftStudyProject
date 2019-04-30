//
//  UIImageViewViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/4/30.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class UIImageViewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        self.title = "图像控件（UIImageView）的用法";
        
        // 1，使用图像控件显示图片
        let image = UIImage(named: "horse")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 10, y: 100, width: 350, height: 200)
        // 2，改变图片
        imageView.image = UIImage(named: "horse")
        // 3，从文件目录中获取图片
        let path = Bundle.main.path(forResource: "b", ofType: "jpg")
        let pathImage = UIImage(contentsOfFile: path ?? "")
        imageView.image = pathImage
        // 4，从网络地址获取图片
        let url = URL(string: "http://k.zol-img.com.cn/sjbbs/7692/a7691515_s.jpg")
        
        let data = try! Data(contentsOf: url!)
        imageView.image = UIImage(data: data)
        
        // 5，使用图像控件实现动画播放
        imageView.animationImages = [pathImage,image] as? [UIImage]
        imageView.animationDuration = 5
        imageView.startAnimating()
        
        // 6，图像控件实现图片居中裁剪
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        view.addSubview(imageView)
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
