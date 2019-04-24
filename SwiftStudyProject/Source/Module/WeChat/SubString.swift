//
//  SubString.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/4/24.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class SubString: NSObject {
    var str:String = ""
    init(str:String) {
        self.str = str
    }
  
    subscript(start:Int,length:Int) -> String {
        get {
            let index1 = str.index(str.startIndex, offsetBy: start)
            let index2 = str.index(index1, offsetBy: length)
            let range = Range(uncheckedBounds: (lower: index1, upper: index2))
            return str.substring(with: range)
        }
        set {
            let tmp = str
            str = ""
            var s = ""
            var e = ""
            for (idx, item) in tmp.enumerated() {
                if(idx < start) {
                    s += "\(item)"
                }
                if(idx >= start + length) {
                    e += "\(item)"
                }
            }
            str = s + newValue + e
        }
    }
    
    /**下标脚本：获取/设置字符**/
    subscript(index:Int) -> String {
        get {
            return String(str[str.index(str.startIndex, offsetBy: index)])
        }
        set {
            let tmp = str
            str = ""
            for (idx, item) in tmp.enumerated() {
                if idx == index {
                    str += "\(newValue)"
                } else {
                    str += "\(item)"
                }
            }
        }
    }
}
