//
//  UIScrollViewPagingViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/5/6.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class UIScrollViewPagingViewController: UIViewController {

    let numOfPages:Int! = 3
    let pageWidth:CGFloat! = UIScreen.main.bounds.size.width
    let pageHeight:CGFloat! = 360
    
    let colorMap =  [0:UIColor.red,1:UIColor.green,2:UIColor.blue]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        self.title = "滚动视图（UIScrollView）的用法";
        
        let scrollView = UIScrollView()
        scrollView.frame = self.view.bounds
        let width:CGFloat = CGFloat(integerLiteral: numOfPages) * pageWidth
        scrollView.contentSize = CGSize(width: width, height: pageHeight)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.scrollsToTop = false
        
        for i in 0..<numOfPages {
            let viewX:CGFloat = CGFloat(integerLiteral: i) * pageWidth
            let view:UIView = UIView(frame: CGRect(x: viewX, y: 0, width: pageWidth, height: pageHeight))
            view.backgroundColor = colorMap[i]
            scrollView.addSubview(view)
        }
        view.addSubview(scrollView)
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
