//
//  AlamofireUploadViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/5/9.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit
import Alamofire

class AlamofireUploadViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "HTTP网络操作库Alamofire使用详解2（文件上传）";
        // Do any additional setup after loading the view.
        
        //六，使用Alamofire进行文件上传
        /**
          1，Alamofire支持如下上传类型：
         File
         Data
         Stream
         MultipartFormData
         **/
        // 2，使用文件流的形式上传文件
        self.uploadFile()
        
        // 3，上传时附带上传进度
        self.uploadProcess()
        
        // 4，上传MultipartFormData类型的文件数据（类似于网页上Form表单里的文件提交）
        self.uploadMultipartFormData()
    }
    
    // 2，使用文件流的形式上传文件
    func uploadFile() {
        let fileURL = Bundle.main.url(forResource: "a", withExtension: "jpg")
        Alamofire.upload(fileURL!, to: "http://www.hangge.com/upload.php").responseJSON { response in
            debugPrint(response)
        }
    }
    
    // 3，上传时附带上传进度
    func uploadProcess() {
        let fileURL = Bundle.main.url(forResource: "a", withExtension: "jpg")
        Alamofire.upload(fileURL!, to: "http://www.hangge.com/upload.php").uploadProgress(closure: { progress in
            print("当前进度：\(progress.fractionCompleted)")
        }).responseJSON { response in
            debugPrint(response)
        }
    }
    
    // 4，上传MultipartFormData类型的文件数据（类似于网页上Form表单里的文件提交）
    func uploadMultipartFormData() {
        //（1）上传两个文件
        let fileURL1 = Bundle.main.url(forResource: "a", withExtension: "jpg")
        let fileURL2 = Bundle.main.url(forResource: "b", withExtension: "jpg")
        Alamofire.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(fileURL1!, withName: "file1")
            multipartFormData.append(fileURL2!, withName: "file2")
        }, to: "http://www.hangge.com/upload2.php", encodingCompletion: { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    debugPrint(response)
                }
            case .failure(let encodingError):
                print(encodingError)
            }
        })
    }
    
    // （2）文本参数与文件一起提交（文件除了可以使用fileURL，还可以上传NSData类型的文件数据）
    func uploadMultipartAllData() {
        //字符串
        let strData = "sdfsf".data(using: .utf8)
        //数字
        let intData = String(10).data(using: .utf8)
        //文件1
        let fileURL1 = Bundle.main.url(forResource: "a", withExtension: "jpg")
        let file1Data = try! Data(contentsOf: fileURL1!)
        //文件2
        let fileURL2 = Bundle.main.url(forResource: "b", withExtension: "jpg")
        Alamofire.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(strData!, withName: "value1")
            multipartFormData.append(intData!, withName: "value2")
            multipartFormData.append(file1Data, withName: "file1",
                                     fileName: "h.png", mimeType: "image/png")
            multipartFormData.append(fileURL2!, withName: "file2")
        }, to: "http://www.hangge.com/upload2.php") { (encodingResult:SessionManager.MultipartFormDataEncodingResult) in
            switch encodingResult {
            case .success(request: let upload, _, _):
                upload.responseJSON(completionHandler: { response in
                    debugPrint(response)
                })
                break
            case .failure(let encodingError):
                print(encodingError)
                break
            }
            
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
