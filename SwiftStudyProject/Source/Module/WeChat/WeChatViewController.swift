//
//  WeChatViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/1/18.
//  Copyright © 2019 chanvalenty. All rights reserved.
//  微信

import UIKit

class WeChatViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //UITableView表格
    var lessonArray = [Any]()
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
        let dataPath:String = Bundle.main.path(forResource: "WechatViewData", ofType: "plist")!
        let data:Array = NSArray(contentsOfFile: dataPath)! as Array
        lessonArray = data;
        
        
//        let lessonDict1:[String:Any] = ["controller":"BasicDataTypesViewController","title":"1、Swift - 基本数据类型，及常/变量声明"]
        
        
//        lessonArray.append(lessonDict1)
        
        self.view.addSubview(self.tableView)
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.lessonArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identify:String = "SwiftCell";
        let cell = tableView.dequeueReusableCell(withIdentifier: identify)

        var lessonDict = self.lessonArray[indexPath.row] as![String:Any]
        cell?.textLabel?.text = lessonDict["title"] as? String
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 14)
        return cell ?? UITableViewCell.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (self.lessonArray.count) > 0 {
            //        print(WeChatViewController())   //SwiftStudyProject.WeChatViewController <nameSpace.ViewController: 0x7fe04b70c890>
            var lessonDict = self.lessonArray[indexPath.row] as![String:Any]
            let currentController = lessonDict["controller"] as?String
            
            guard let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"]as? String else {
                return;
            }
            guard let className = NSClassFromString(nameSpace + "." + currentController!) as?UIViewController.Type else{
                return
            }
            let vc = className.init()
            
//            self.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
//            self.hidesBottomBarWhenPushed = false
        }
    }
    
    private lazy var tableView:UITableView = {
        let tableView = UITableView(frame: self.view.frame, style: .plain)
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SwiftCell")
        return tableView
    }()
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
