//
//  AlamofireFirstViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/5/6.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit
import Alamofire

class AlamofireBaseViewController: UIViewController {
    
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
        
        //        self.alamofireRequest()
        //        self.responseResult()
        self.printResult()
    }
    
    // 二，使用Alamofire进行数据请求
    func alamofireRequest() {
        /**
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
        
        // （6）同样也支持链式的返回结果处理
        Alamofire.request("http://httpbin.org/post", method: .post).responseString { response in
            print("Response String: \(response.result.value)")
            }.responseJSON { response in
                print("Response JSON: \(response.result.value)")
        }
        
        
        // 3，请求类型（HTTP Methods）
        /** 除了上面使用的 .Get 类型（不指定的话，默认都是使用Get请求）。Alamofire还定义了许多其他的HTTP 方法（HTTP Medthods）可以使用。 **/
        // 比如要使用 POST 请求，把 Alamofire.request 第二个参数做修改即可：
        Alamofire.request("http://httpbin.org/post", method: .post)
        
        
        // 4，请求参数（Parameters）
        Alamofire.request("https://httpbin.org/get", parameters: ["foo":"bar"])// https://httpbin.org/get?foo=bar
        
        // （2）使用POST类型请求的时候，参数是放在在HTTP body里传递，url上看不到
        let parameters:[String:Any] = [
            "foo":"bar",
            "baz":["a":1],
            "qux":[
                "x":1,
                "y":2,
                "z":3]
        ]
        
        Alamofire.request("https://httpbin.org/post", method: .post, parameters: parameters).response { response in
            print("\(response.request)")
        }
        
        // 5，参数编码方式（Parameter Encoding）
        /** //除了默认的方式外，Alamofire还支持URL、JSON、PropertyList以及自定义格式方式编码参数。
         比如我们想要把一个字典类型的数据，使用json格式发起POST请求（数据将放在 body 中传输）：
         **/
        let encodingParameters:[String:Any] = [
            "foo":[1,2,3],
            "bar":["baz":"qux"]
        ]
        Alamofire.request("https://httpbin.org/post", method: .get, parameters: encodingParameters, encoding: JSONEncoding.default).response { response in
            print("encodingParametersRequest：\(response.request)")
        }
        
        //6，支持自定义Http头信息（HTTP Headers）
        let headers:HTTPHeaders = [
            "Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==",
            "Accept": "application/json"
        ]
        Alamofire.request("https://httpbin.org/headers",headers: headers).responseJSON { response in
            print("\(response)")
        }
        
        
    }
    
    
    // 三，判断数据请求是否成功，并做相应的处理
    func responseResult() {
        Alamofire.request("https://httpbin.org/get", method: .get, parameters: ["foo":"bar"], encoding: URLEncoding.default).responseJSON { response in
            if response.result.isSuccess {
                print("数据获取成功!")
            } else {
                print(response.result.error)
            }
        }
        
    }
    
    
    // 四，打印调试（print和debugPrint）
    func printResult() {
        // 不管是 request对象还是 response对象都是支持打印输出的。根据不同的调试需求，我们可以自行选择使用 print 还是 debugPrint。
        // 1，打印request对象
        let request = Alamofire.request("https://httpbin.org/ip", parameters: ["foo":"bar"]).responseString { response in
            print("print response：")
            print(response)
            
            print("debugPrint response：")
            debugPrint(response)
        }
        print("print request：")
        print(request)
        
        print("debugPrint request：")
        debugPrint(request)
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
