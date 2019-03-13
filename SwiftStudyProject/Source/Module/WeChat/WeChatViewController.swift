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
    var lessonDict:[String:String]?
    var lessonArray:[String]?
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
        lessonArray = ["Swift - 基本数据类型，及常/变量声明"]
        
        self.view.addSubview(self.tableView)
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.lessonArray!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identify:String = "SwiftCell";
        let cell = tableView.dequeueReusableCell(withIdentifier: identify)
        cell?.textLabel?.text = self.lessonArray![indexPath.row]
        return cell ?? UITableViewCell.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let basicDataTypesVC = BasicDataTypesViewController()
        
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(basicDataTypesVC, animated: true)
        self.hidesBottomBarWhenPushed = false
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
