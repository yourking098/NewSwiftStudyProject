//
//  ViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2018/11/1.
//  Copyright © 2018 chanvalenty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func test1() {
        let str = "sss.com"
        if !str.isEmpty {
            print(str)
        }
        print("\(str.count)个字符")
        if str.hasSuffix(".com") {
            print("YES")
        }
        let name = "valenty"
        let msg = "欢迎\(name)"
        print(msg)
        print("欢迎111",name)
        let lowercaseStr = "www.baidu.com";
        let uppercasedStr = lowercaseStr.uppercased()
        print("换成大写\(uppercasedStr)")
        
        let capitalStr = lowercaseStr.capitalized
        print("首字母大写\(capitalStr)")
        
        let tupleData = (name:"valentyTupleData",age:30);
        print("元数组\(tupleData.name)")
    }
    
    func sectionOperate() {
        let fruit = ["apple","yellow","green"]
        for i in (0..<fruit.count) {
            print("第\(i+1)个水果是\(fruit[i])")
        }
        for i in (0..<fruit.count).reversed() {
            print("第\(i+1)个水果是\(fruit[i])")
        }
        
        //挑选字母大小写
        let words = "Hangge.com"
        let interval = "a"..."z";
        var str = ""
        for c in words.characters {
            if !interval.contains(String(c)) {
                str.append("\(c),")
            }
        }
        if !str.isEmpty {
            print("\(str)不是小写字母")
        }
    }
    
    
    func arrayFun() {
        var types = ["none","warning","error"];//省略类型的数组声明
        var member = [String]()//声明一个空数组
        member.append("six")
        member += ["seven"]
        member.insert("xx", at: 0);//指定位置添加元素
        member[0] = "message"//通过下标修改数组中的数据
        member[0...2]=["嗰杠嘢","柘城地","柘城夺"];//通过小标区间替换数据（前3个数据）
        //member.count//获取数组元素个数
        //member.isEmpty//判断数组是否为空
        member.swapAt(1, 2)//交换元素位置（第2个和第3个元素位置进行交换）
        //member.remove(at: 2)
        //member.removeLast()
        //member.removeFirst()
        //member.removeAll(keepingCapacity: true)
        //let addArrayStr = member + types//数组组合
        //使用for in 实现数组遍历
        for value in member {
            print("\(value)")
        }
        //通过enumerate函数同时遍历数组的所有索引与数据
        for (index,value) in member.enumerated() {
            print("索引：\(index) 数据：\(value)")
        }
        //调取字符串长度小于6的数据，swift自动为闭包提供参数名缩写功能，可以直接通过$0和$1等来表示闭包中的第一个第二个参数，并且对应的参数类型会根据函数类型来进行判断
        //自动排序,不使用$0 $1这些来代替,
        let newType = types.filter { (a) -> Bool in
            return a.count < 6
        }
        print("newType -" + "\(newType)")
        
        //自动排序 使用$0,swift自动为闭包提供参数名缩写功能，可以直接通过$0和$1等来表示闭包中的第一个第二个参数，并且对应的参数类型会根据函数类型来进行判断 filter高阶函数
        let newType$ = types.filter{$0.count < 6}
        print("newType$ -" + "\(newType$)")
        
        
        //自动排序  不使用$0 $1这些来代替
        let number = [1,2,5,4,3,6,8,7];
        let sortNumber = number.sorted { (a, b) -> Bool in
            return a > b
        }
        print("numbers -" + "\(sortNumber)")
        
        //使用$0,$1,swift自动为闭包提供参数名缩写功能，可以直接通过$0和$1等来表示闭包中的第一个第二个参数，并且对应的参数类型会根据函数类型来进行判断，sorted高阶函数
        let sortNumber$ = number.sorted { $0 > $1 }
        print("sortNumber$ -" + "\(sortNumber$)")
        
        //创建包含100个元素的数组 ["条目0", "条目1" ... "条目99"]，map高阶函数
        let map = Array(0..<10).map { (a) -> String in
            return "条目\(a)"
        }
        print("map -" + "\(map)")
        
        //map高阶函数
        let map$ = Array(0...10).map {"条目\($0)"}
        print("map$ -" + "\(map$)")
    }
    
    func dictionaryFun() {
        var empty = [String: Int]();//建立个空字典
        var myDic = ["address":"hangge",
                     "url":"hangge.com"]  //声明一个字典
        myDic["address"] = "china"
        //myDic.removeValue(forKey: "url");//删除"name"这个key值
        //myDic["name"] = nil
        //myDic.keys//访问字典的key集合
        //myDic.values//访问字典的values集合
        print("\(String(describing: myDic["address"]))")
        
        for (key,value) in myDic {//遍历字典
            print("键\(key):值\(value)")
        }
        for key in myDic.keys {//只遍历字典的键（key）
            print("键\(key)");
        }
        for value in myDic.values {//只遍历字典的值（value）
            print("键\(value)");
        }
        
        //通过元组创建字典
        let tupleArray = [("Monday", 30),("Tuesday", 25),("Wednesday", 27)]
        let dictionary = Dictionary(uniqueKeysWithValues: tupleArray)
        print(dictionary)
        
        //通过键值序列创建字典
        let names = ["Apple","Pear"]
        let prices = [7,6]
        let dict = Dictionary(uniqueKeysWithValues: zip(names, prices))
        print(dict)
        
        //只有键序列、或者值序列创建字典
        let array = ["Monday", "Tuesday", "Wednesday"]
        let dict1 = Dictionary(uniqueKeysWithValues: zip(1..., array))
        let dict2 = Dictionary(uniqueKeysWithValues: zip(array, 1...))
        print("dict1：\(dict1)")
        print("dict2：\(dict2)")
        
        //字典分组
        let names1 = ["Apple", "Pear", "Grape", "Peach"]
        let dictGroup = Dictionary(grouping: names1) { $0.first! }
        print(dictGroup)
        
        //重复键的处理
        //zip配合速记+可以用来解决重复键的问题（相同的键值相加）
        let arrayComplie = ["Apple", "Pear", "Pear", "Orange"]
        let dic = Dictionary(zip(arrayComplie, repeatElement(1, count: arrayComplie.count)), uniquingKeysWith: +)
        print(dic)
        
        //到了 Swift4，我们可以直接指定一个默认值，如果不存在该键值时名，会直接返回这个值。下面代码的效果同上面是一样的。
        let dictFruit = ["Apple":1,"banana":2]
        let orange = dictFruit["orange",default:0]
        print(orange)
        
        //下面是统计一个字符串中所有单词出现的次数。可以看到了有了默认值，实现起来会简单许多。
        let str = "apple,banana,orange,apple,banana"
        var wordsCount: [String: Int] = [:]
        for word in str.split(separator: ",") {
            wordsCount["\(word)", default: 0] += 1
        }
        print(wordsCount)
        
        //结构体 - struct
        struct BookInfo {
            var BookId:Int = 0
            var Name:String = ""
            var Author:String = ""
        }
        var book1:BookInfo
        var book2 = BookInfo(BookId:0021,Name:"航歌",Author:"hangge")
        book2.Name = "tst"
        print(book2.Name)
        
        //枚举 - enum
        enum CompassPoint {
            case north
            case south
            case east
            case west
        }
        var directionToHead = CompassPoint.west
        
        enum Planet:Int {
            case mercury = 1
            case venus = 2
            case earth = 3
        }
        let earthOrder = Planet.earth.rawValue//rawValue来获取他的原始值:3
        print(earthOrder)
        let planetX = Planet(rawValue: 2)//通过原始值来寻找所对应的枚举成员:Venus
        
        enum Direction {
            case up
            case down
            func dsctription() -> String {
                switch (self) {
                case .up:
                    return "向上"
                case .down:
                    return "向下"
                }
            }
        }
        print(Direction.up.dsctription())
    }
    
    func controlState() {
        let fruit = "apple"
        switch fruit {
        case "apple":
            print("good")
            break;
        case "bannan","orange":
            print("great")
            break;
        default:
            print("bad")
        }
        
        let age = 5
        switch age {
        case 0...10:
            print("正太")
        case 12...30:
            print("少年")
        default:
            print("大叔")
        }
        
        let num = 5
        switch num {
        case ..<0:
            print("负数")
        case 0:
            print("0")
        case 0...:
            print("正数")
        default:
            print("未知")
        }
        
        
        let point = (2,2)
        switch point {
        case (0,0):
            print("坐标在原点")
        case (_,0):
            print("坐标在x轴上")
        case (0,_):
            print("坐标在y轴上")
        case (-3...3, -3...3):
            print("坐标在长宽为6的正方形内")
        default:
            print("在什么地方")
        }
        //case中还可以使用where关键字来做额外的判断条件
        let height = 1.72
        switch height {
        case 1...3 where height == 1.72:
            print("case 1")
        case 1...3 where height == 2:
            print("case 2")
        default:
            print("default")
        }
        
        //for-in循环
        for i in 0...10 {
            print("顺序：\(i)")
        }
        //遍历数组元素
        let numbers = [1,2,3,4]
        for num in numbers {
            print("数组：\(num)")
        }
        //遍历字典
        let nameOfAge = ["liley":8,"valenty":2]
        for (name,age) in nameOfAge {
            print("name:\(name),age:\(age)")
        }
        //for-each循环
        (1...10).forEach { (a) in
            if(a > 5) {
                print("\(a)")
            }
        }
        (1...5).forEach {
            print("forEach:\($0)")
        }
    }
    //无返回值的函数
    func funcState(name:String) {
        
    }
    //返回一个返回值
    func returnFunState(name:String) -> Bool {
        return true
    }
    //返回由多个值组成的复合返回值
    func returnMultiFun(name:String) -> (Int,Bool) {
        return (1,true);
    }
    //返回由多个值组成的复合返回值
    func returnComplieFun(numbers:Int...) -> Int {
        var count:Int = 0
        for number in numbers {
            count += number
        }
        return count
    }
    //如果想要同时改变函数内外的参数值，可以利用inout关键字，同时调用函数的时候给参数加上前缀“&”
    func inoutFunc(age:inout Int) {
        age += 1
    }
    
    //可以使用函数类型的参数
    func addFunState(a:Int,b:Int) -> Int {
        return a+b
    }
    func printAddFun(addFun:(Int,Int)->Int,a:Int,b:Int) {
        print("result:\(addFun(a,b))")
    }
    
    //使用函数类型的返回值
    //定义个自增函数
    func increase(input:Int) -> Int{
        return input + 1
    }
    //定义个自减函数
    func reduce(input:Int) -> Int{
        return input - 1
    }
    //定义一个返回函数类型的函数
    func chooseFunction(backwards:Bool) -> ((Int) -> Int){
        return backwards ? reduce : increase
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        //基本数据类型，及常/变量声明
        test1()
        //区间运算符（... 和 ..<）
        sectionOperate()
        //复杂数据类型说明（数组，字典，结构体，枚举）
        arrayFun()
        dictionaryFun()
        // 控制流/控制结构说明（if，switch，for，while）
        controlState()
        //函数
        funcState(name: "sdfsdf")
        let test:Bool = returnFunState(name: "kskfjsdf")
        if test {
            print("TRUE")
        }
        let multiFun:(a:Int,b:Bool) = returnMultiFun(name: "xxx")
        print("a:\(multiFun.a) b:\(multiFun.b)")
        
        let totalCount:Int = returnComplieFun(numbers: 2)
        print("complieFun\(totalCount)")
        
        var age = 22
        inoutFunc(age: &age)
        print(age)
        
        printAddFun(addFun: addFunState(a:b:), a: 5, b: 7)
        
        let aFun = chooseFunction(backwards: 3>2)
        print(aFun(3))  //2
        
    }
    
}

