//
//  AlamofireFirstViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/5/6.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit
import Alamofire

class AlamofireFirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = " HTTP网络操作库Alamofire使用详解1（配置，以及数据请求）";
        /**
         一，Alamofire的说明与配置
         1，什么是Alamofire
         （1）Alamofire 的前身是 AFNetworking。AFNetworking 是 iOS 和 OS X 上很受欢迎的第三方HTTP网络基础库。
         （2）其实 AFNetwork 的前缀 AF 便是 Alamofire 的缩写。
         （3）Swift发布后，AFNetworking的作者又用Swift语言写了个相同功能的库，这便是 Alamofire。
         （4）Alamofire 本质是基于`URLSession`，并做了封装。使用 Alamofire 可以让我们网络请求相关代码（如获取数据，提交数据，上传文件，下载文件等）更加简洁易用。
         关于Cookie：
         Alamofire是基于URLRequest封装的，所以Cookie会自动保存，就和浏览器请求是一个效果。而且网站Set_cookie多久，本地的Cookie就多久，每次请求的时候都会自动带上cookie，直到过期。（所以像登陆session这些的都不用我们手动去处理）
         
         
         2，Alamofire的功能特性：
         （1）链式的请求/响应方法
         （2）URL / JSON / plist参数编码
         （3）上传类型支持：文件（File ）、数据（Data ）、流（Stream）以及MultipartFormData
         （4）支持文件下载，下载支持断点续传
         （5）支持使用NSURLCredential进行身份验证
         （6）HTTP响应验证
         （7）TLS Certificate and Public Key Pinning（https证书有效性验证引发的安全问题）
         （8）Progress Closure & NSProgress
        **/
        
        /**
         二，使用Alamofire进行数据请求
          1，以GET请求为例
        **/
        //（1）不带参数，不带结果处理
        Alamofire.request("https://httpbin.org/get")
        //（2）带参数，不带结果处理
        Alamofire.request("https://httpbin.org/get", parameters: ["foo": "bar"])
        //（3）带参数，也带结果处理（这里以返回结果为json格式的为例）
        Alamofire.request("https://httpbin.org/get",parameters: ["foo": "bar"]).responseJSON { response in
            print("response.request：\(response.request)")// original URL request 请求的原始URL
            print("response.response：\(response.response)")// URL response 响应头
            print("response.data：\(response.data)")// server data
            debugPrint("response.result：\(response.result)")// result of response serialization
            if let resultJson = response.result.value {
                debugPrint("resultJson：\(resultJson)")
            }
        }
        
        // 2，响应处理（Response Handling）
       /**  （1）除了上面样例使用的responseJSON（处理json类型的返回结果）外，Alamofire还提供了许多其他类型的响应处理方法：
         response()
         responseData()
         responseString(encoding: NSStringEncoding)
         responseJSON(options: NSJSONReadingOptions)
         responsePropertyList(options: NSPropertyListReadOptions)
         **/
        // （2）Response Handler
        Alamofire.request("https://httpbin.org/get",parameters: ["foo":"bar"]).response { response in
            debugPrint("Request: \(response.request)")
            debugPrint("Response: \(response.response)")
            debugPrint("Error: \(response.error)")
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                debugPrint("Data: \(utf8Text)")
            }
        }
        // （3）Response Data Handler
        Alamofire.request("https://httpbin.org/get", parameters: ["foo":"bar"]).responseData { response in
            debugPrint("All Response Info:\(response)")
            if let data = response.result.value,let utf8Text = String(data: data, encoding: .utf8) {
                print("UTF-8Data: \(utf8Text)")
            }
        }
        // （4）Response String Handler
        Alamofire.request("https://httpbin.org/get", parameters:["foo":"bar"]).responseString { response in
            print("Success: \(response.result.isSuccess)")
            print("Response String: \(response.result.value)")
        }
        
        // （5）Response JSON Handler
        Alamofire.request("https://30paotui.com/article/list").responseJSON { response in
            if response.result.isSuccess {
                print("30paotui.com：\(response.result.value)")
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
