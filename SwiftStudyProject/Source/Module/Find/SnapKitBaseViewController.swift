//
//  SnapKitBaseViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/5/10.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit
import SnapKit

class SnapKitBaseViewController: UIViewController {

    lazy var box = UIView()
    
    //外部方块
    lazy var boxOutter = UIView()
    //内部方块
    lazy var boxInner = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "自动布局库SnapKit的使用详解1（配置、使用方法、样例）";
        
        // Do any additional setup after loading the view.
        
        box.backgroundColor = .orange
        view.addSubview(box)// 注意： 使用 snp.makeConstraints 方法的元素必须事先添加到父元素的中，例如：self.view.addSubview(view)
        
        //4，SnapKit的使用方法 通过 snp.makeConstraints 方法给view添加约束，约束有几种，分别是边距，宽，高，左上右下距离，基准线。同时，添加过约束后可以有修正，修正有位移修正（inset、offset）和倍率修正（multipliedBy）
        box.snp.makeConstraints { (make:ConstraintMaker) in
            make.width.height.equalTo(100)
            make.center.equalTo(self.view)
        }
        
        
        
        boxOutter.backgroundColor = UIColor.orange
        self.view.addSubview(boxOutter)
        boxInner.backgroundColor = UIColor.green
        self.view.addSubview(boxInner)
        
        boxOutter.snp.makeConstraints { make in
            make.width.height.equalTo(200)
            make.center.equalTo(self.view)
        }
        
        boxInner.snp.makeConstraints { make in
//            make.width.height.equalTo(100)
//            make.right.equalTo(0)
//            make.bottom.equalTo(0)
            
//            make.left.lessThanOrEqualTo(boxOutter)
//            make.left.lessThanOrEqualTo(boxOutter.snp.left)
//            make.edges.equalTo(self.view)
//            make.size.greaterThanOrEqualTo(boxOutter)
//            make.center.equalTo(boxOutter)
            // 7，位移修正与倍率修正
            // （1）内位移修正：inset
//            make.center.equalTo(boxOutter).inset(UIEdgeInsets(top: 10, left: 15, bottom: 20, right: 25))
            // （2）外位移修正：offset
//            make.size.equalTo(boxOutter).offset(-50)
            
            // （3）倍率修正：multipliedBy
            make.center.equalTo(boxOutter)
            make.size.equalTo(boxOutter).multipliedBy(0.5)
        }
        
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
