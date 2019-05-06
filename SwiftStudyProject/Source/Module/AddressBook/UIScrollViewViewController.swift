//
//  UIScrollViewViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/5/6.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class UIScrollViewViewController: UIViewController,UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        self.title = "滚动视图（UIScrollView）的用法";
        
        // 1，当图片尺寸超过屏幕时，使用UIScrollView可以实现滚动条视图，即手指触摸滚动屏幕方便浏览整个页面。
        let scrollView = UIScrollView()
        scrollView.frame = self.view.bounds
        let imageView = UIImageView(image: UIImage(named: "b.jpg"))
        scrollView.contentSize = imageView.bounds.size
        scrollView.addSubview(imageView)
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        
        //3，手势放大缩小、要实现放大缩小功能，需要指定UIScrollView的允许缩放最大比例和最小比例（默认都是是1.0）。
        scrollView.minimumZoomScale = 0.1 //最小比例
        scrollView.maximumZoomScale = 3 //最大比例
        
    }
    
    // 2，获取滚动视图移动的x,y坐标
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("x:\(scrollView.contentOffset.x)\n y\(scrollView.contentOffset.y)")
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        for subView in scrollView.subviews {
            if subView.isKind(of: UIImageView.self) {
                return subView as UIView
            }
        }
        return UIView.init()
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
