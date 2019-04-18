//
//  RandomViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/4/18.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class RandomViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
        self.title = "随机数";
        
        //arc4random 1-100的随机数 其生成的最大值是4294967295（2^32 - 1），最小值为0。
        let random = arc4random()%100 + 1
        print("arc4random 随机数:\(random)")
        
        //arc4random_uniform  1-100的随机数
        let temp = arc4random_uniform(100) + 1
        print("arc4random_uniform 随机数:\(temp)")
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
