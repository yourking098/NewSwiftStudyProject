//
//  DBClass.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/4/24.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class DBClass: NSObject {

    var student = Student()
    
    //可以做一些清理工作
    deinit {
        self.student.name = ""
        self.student.number = 1
        
        //self.conn!.close()
        //self.conn = nil
    }
}
