//
//  CoreMotionViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/5/6.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit
import CoreMotion

class CoreMotionViewController: UIViewController,UIAccelerometerDelegate {
    
    var ball:UIImageView!
    var speedX:UIAccelerationValue = 0
    var speedY:UIAccelerationValue = 0
    var motionManager = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "加速传感器（CoreMotion）的用法，小球加速运动并反弹样例";
        
        // Do any additional setup after loading the view.
        
        /**
         1，加速传感器可以监听到x,y,z三个方向的加速度，使用步骤如下：
         （1）实例化CMMotionManager类
         （2）向CMMotionManager的accelerometerUpdateInterval属性中设置通知间隔时间值。
         （3）使用OperationQueue.current建立一个监听队列。
         （4）使用startAccelerometerUpdates方法更新监听队列，并设置回调函数用于接受加速度通知。在回调函数中使用accelerometerData.acceleration相关属性可以获取x、y、z各个方向的加速度。
         
         2，通知频率设置建议
         accelerometerUpdateInterval表示通知频率，表示间隔多少秒通知一次。iPhone开发文档中推荐使用的通知间隔如下：
         （1）检测设备朝向：1/10 ~ 1/20
         （2）在游戏中需要实时使用加速传感器时：1/30 ~ 1/60
         （3）检测敲击设备或者剧烈摇动设备的情况下：1/70 ~ 1/100
         
         3，x,y,z轴
         （1）对于iphone手机来说，画面上下为y轴，左右为x轴，贯穿屏幕为z轴。
         （2）向上，向右，手机的前面分别是各轴的正方向。
         
         4，加速度（原始加速度）
         加速度不仅受震动手机时施加的作用力的影响，还会持续受到重力的影响。因此iphone手机如果垂直拿在手上的话，Y轴负方向将受重力作用，加速度y属性将一直为负值（最小值为-1.0）
         
         5，Gravity和UserAcceleration
         上面提到的原始的加速度（即通过startAccelerometerUpdates获取的那个值）实际上是由两种加速度合成而来的。一个是重力加速度（Gravity），一个是用户对手机施加的加速度（UserAcceleration）（当然我们也可以分别获取这两种加速度）。
         所以当手机垂直静止时，虽然UserAcceleration是0，但由于有重力加速度，所以两个合成后加速度y属性便是为负值。
         
         **/
        
        //放一个小球在中央
        ball = UIImageView(image:UIImage(named:"tabbar_discoverHL"))
        ball.frame = CGRect(x:0, y:0, width:50, height:50)
        ball.center = self.view.center
        self.view.addSubview(ball)
        
        motionManager.accelerometerUpdateInterval = 1/60
        
        if motionManager.isAccelerometerAvailable {
            let queue = OperationQueue.current
            motionManager.startAccelerometerUpdates(to: queue!, withHandler: {
                (accelerometerData, error) in
                //动态设置小球位置
                self.speedX += accelerometerData!.acceleration.x
                self.speedY +=  accelerometerData!.acceleration.y
                var posX=self.ball.center.x + CGFloat(self.speedX)
                var posY=self.ball.center.y - CGFloat(self.speedY)
                //碰到边框后的反弹处理
                if posX<0 {
                    posX=0;
                    //碰到左边的边框后以0.4倍的速度反弹
                    self.speedX *= -0.4
                    
                }else if posX > self.view.bounds.size.width {
                    posX=self.view.bounds.size.width
                    //碰到右边的边框后以0.4倍的速度反弹
                    self.speedX *= -0.4
                }
                if posY<0 {
                    posY=0
                    //碰到上面的边框不反弹
                    self.speedY=0
                } else if posY>self.view.bounds.size.height{
                    posY=self.view.bounds.size.height
                    //碰到下面的边框以1.5倍的速度反弹
                    self.speedY *= -1.5
                }
                self.ball.center = CGPoint(x:posX, y:posY)
            })
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
