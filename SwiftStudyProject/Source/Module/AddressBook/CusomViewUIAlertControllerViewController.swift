//
//  CusomViewUIAlertControllerViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/5/5.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class CusomViewUIAlertControllerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        //        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        self.title = "自定义UIAlertController的样式2（添加自定义视图）";
        
        let alertController = UIAlertController(title: "\n\n\n\n\n\n\n\n\n\n",
                                                message: nil,
                                                preferredStyle: .actionSheet)
        
        //添加imageView控件
        let image = UIImage(named: "b.jpg")
        let imageView = UIImageView(image: image)
        //actionSheet样式尺寸
        imageView.frame = CGRect(x: 10, y: 10,
                                 width: alertController.view.bounds.size.width - 40,
                                 height: 190)
        alertController.view.addSubview(imageView)
        
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "确定", style: .default, handler: {
            action in
            print("点击了确定")
        })
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
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
