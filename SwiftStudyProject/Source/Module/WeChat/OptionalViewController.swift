//
//  OptionalViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/4/25.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class OptionalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        //区间运算符可以用来表示两个操作数之间的范围集合。
        self.title = "可选型";
        // Do any additional setup after loading the view.
        
        /**
         可选类型(Optional)的介绍
         
         说明:
         
         可选类型是Swift中比较晦涩难懂的一个知识点
         先了解定义,多利用Xcode的提示来使用
         随着学习的深入,慢慢理解其中的原理和好处
         
         
         概念:
         
         在OC开发中,如果一个变量暂时不使用,可以赋值为0(基本属性类型)或者赋值为nil(对象类型)
         在Swift中,nil也是一个特殊的类型,与Int,String一样，又因为Swift是强类型语言，因此不能直接将nil赋值给其他类型的数据
         开发中碰到nil在所难免.因此推出了可选类型
         
         
         可选类型的取值:
         
         nil
         有值
         
         
         
         定义可选类型
         
         定义一个可选类型有两种写法
         
         最基本的写法
         语法糖(常用)
         
         **/
        
        // 写法一:定义可选类型
        let name1 : Optional<String> = nil
        
        // 写法二:定义可选类型,语法糖(常用)
        let name2 : String? = nil
        
        // 可选类型的使用
        
        // 演练一:给可选类型赋值
        // 定义可选类型
        var string : Optional<String> = nil
        
        // 给可选类型赋值
        // 错误写法:因此该可选类型中只能存放字符串
        //string = 123
        // 正确写法:
        string = "Hello world"
        
        // 打印结果
        print(string)
        // 结果:Optional("Hello world")\n  因为是可选类型,所有会带Optional

        
        //演练二:取出可选类型的值(解包)
        // 取出可选类型的真实值
        //！强制解包（显示解包）
        print(string!)
        // 结果:Hello world\n
        
        // 如果可选类型为nil,强制解包会出错
        string = nil
        print(string!) // 报错
        
        // 正确写法应该先判断是否为空
        if string != nil {
            print(string!)
        }
        
        
        
        // 演练三:取出可选类型的值
        // 可选绑定（隐式解包）
        if let str = string {
            //此时输出的就是str的值，而不是Optional
            print(str)
        }
        
        //演练四:取出可选类型的值
        guard let str = string else{
            return
        }
        print(str)
        
        
        //真实应用场景
        
        //系统API大量使用
        var array:[String] = [String]()
        array.append("A")
        array.append("B")
        array.append("C")
        //返回String?
//        array1.first
//        array1.last
        
        //让代码更加严谨
        // 正确写法:使用可选类型来接收
        let url : URL? = URL(string: "http://www.abc.edu.cn")
        // 该方式利用类型推导
        let url1 = URL(string: "http://www.abc.edu.cn")
        
        // 通过url来创建request对象:在使用可选类型前要先进行判断是否有值
        // 该语法成为可选绑定(如果url有值就解包赋值给tempURL,并且执行{})
        if let tempUrl = url {
            let request = URLRequest(url: tempUrl)
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
