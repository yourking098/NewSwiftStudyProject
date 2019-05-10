//
//  AlamofireUploadBreakContinueViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/5/9.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit
import Alamofire

class AlamofireUploadBreakContinueViewController: UIViewController {

    var stopDownloadButton:UIButton!
    var continueDownloadButton:UIButton!
    var progressView:UIProgressView!
    var cancleData:Data!
    var destination:DownloadRequest.DownloadFileDestination!
    
    var downloadRequest:DownloadRequest!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "HTTP网络操作库Alamofire使用详解3（文件下载，断点续传）";
        
        // Do any additional setup after loading the view.
        stopDownloadButton = UIButton(frame: CGRect(x: 0, y: 150, width: 130, height: 50))
        stopDownloadButton.setTitle("停止下载", for: .normal)
        stopDownloadButton.setTitleColor(.green, for: .normal)
        stopDownloadButton.titleLabel?.font = .systemFont(ofSize: 30)
        stopDownloadButton.backgroundColor = .white
        stopDownloadButton.addTarget(self, action: #selector(stopDownload), for: .touchUpInside)
        view.addSubview(stopDownloadButton)
        
        
        continueDownloadButton = UIButton(frame: CGRect(x: 150, y: 150, width: 130, height: 50))
        continueDownloadButton.setTitle("继续下载", for: .normal)
        continueDownloadButton.setTitleColor(.gray, for: .normal)
        
        continueDownloadButton.titleLabel?.font = .systemFont(ofSize: 30)
        continueDownloadButton.addTarget(self, action: #selector(continueDownload), for: .touchUpInside)
        view.addSubview(continueDownloadButton)
        
        
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.center = view.center
//        progressView.progress = 0
        // 2，设置进度，同时有动画效果
//        progressView.setProgress(0, animated: true)
        // 3，改变进度条颜色
//        progressView.progressTintColor = .green
//        progressView.trackTintColor = .blue
        view.addSubview(progressView)
        
        
        self.downloadFile()
    }
    
    
    //七，使用Alamofire进行文件下载
    func downloadFile() {
        //指定下载路径（文件名不变）
        self.destination = {_,response in
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileURL = documentsURL.appendingPathComponent(response.suggestedFilename!)
            //两个参数表示如果有同名文件则会覆盖，如果路径中文件夹不存在则会自动创建
            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
        }
       //开始下载
        self.downloadRequest = Alamofire.download("https://raw.githubusercontent.com/yourking098/NewSwiftStudyProject/master/rocketLounch.gif", to: self.destination)
        self.downloadRequest.downloadProgress(queue: DispatchQueue.main) { progress in
            self.progressView.progress = Float(exactly: progress.fractionCompleted) ?? 0
            print("已下载：\(progress.completedUnitCount/1024)KB")
            print("总大小：\(progress.totalUnitCount/1024)KB")
        }
        self.downloadRequest.responseData { response in
            
            switch response.result {
            case .success(let data):
                print("下载完毕")
                break
            case .failure:
                self.cancleData = response.resumeData//意外终止的话，把已下载的数据储存起来
            }
            
            print(response)
            
            
            if let imagePath = response.destinationURL?.path {
                let image = UIImage(contentsOfFile: imagePath)
            }
            if let data = response.result.value {
                print("下载完毕")
                let image = UIImage(data: data)
            }
        }
    }

    @objc func stopDownload(_ sender:UIButton) {
        self.downloadRequest.cancel()
    }
    
    @objc func continueDownload(_ sender:UIButton) {
        if let cancleData = self.cancleData {
            self.downloadRequest = Alamofire.download(resumingWith: cancleData, to: self.destination)
            
        }
    }
    
}
    


