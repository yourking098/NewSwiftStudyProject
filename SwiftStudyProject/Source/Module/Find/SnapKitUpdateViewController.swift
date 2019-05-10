//
//  SnapKitUpdateViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/5/10.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit
import SnapKit

class SnapKitUpdateViewController: UIViewController {

    lazy var box = UIView()
    var sizeConstraint:Constraint!
    var stopDownloadButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "自动布局库SnapKit的使用详解2（约束的更新、移除、重做）";
        
        box.backgroundColor = UIColor.orange
        self.view.addSubview(box)
        
        //何更新、移除、代替现有的约束。
        //1，删除约束
        box.snp.makeConstraints { make in
           self.sizeConstraint =  make.width.height.equalTo(150).constraint
            make.center.equalTo(self.view)
        }
        
        
        // Do any additional setup after loading the view.
        stopDownloadButton = UIButton(frame: CGRect(x: 0, y: 150, width: 130, height: 50))
        stopDownloadButton.setTitle("移除约束", for: .normal)
        stopDownloadButton.setTitleColor(.green, for: .normal)
        stopDownloadButton.titleLabel?.font = .systemFont(ofSize: 30)
        stopDownloadButton.backgroundColor = .white
        stopDownloadButton.addTarget(self, action: #selector(stopDownload), for: .touchUpInside)
        view.addSubview(stopDownloadButton)
        
        
        
        
    }
    //移除约束
    @objc func stopDownload() {
        self.sizeConstraint.deactivate()
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
