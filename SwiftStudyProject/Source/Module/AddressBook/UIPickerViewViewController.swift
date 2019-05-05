//
//  UIPickerViewViewController.swift
//  SwiftStudyProject
//
//  Created by chanvalenty on 2019/5/5.
//  Copyright © 2019 chanvalenty. All rights reserved.
//

import UIKit

class UIPickerViewViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    var pickerView:UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        self.title = "选择框（UIPickerView）的用法";
        
        pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.selectRow(1, inComponent: 0, animated: true)
        pickerView.selectRow(2, inComponent: 1, animated: true)
        pickerView.selectRow(3, inComponent: 2, animated: true)
        view.addSubview(pickerView)
        
        
        //建立一个按钮，触摸按钮时获得选择框被选择的索引
        let button = UIButton(frame:CGRect(x:0, y:0, width:100, height:30))
        button.center = self.view.center
        button.backgroundColor = UIColor.blue
        button.setTitle("获取信息",for:.normal)
        button.addTarget(self, action:#selector(getPickerViewValue),
                         for: .touchUpInside)
        view.addSubview(button)
    }
    //设置选择框的列数为3列,继承于UIPickerViewDataSource协议
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    //设置选择框的行数为9行，继承于UIPickerViewDataSource协议
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 9
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row)+"-"+String(component)
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if(0 == component){
            //第一列变宽
            return 100
        }else{
            //第二、三列变窄
            return 60
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    // 3，将图片作为选择框选项
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        if component == 0 {
            let image = UIImage(named: "loading00"+String(row+1))
            let imageView = UIImageView()
            imageView.image = image
            return imageView
        } else {// 5，修改选项的字体大小和颜色
            var pickerLabel = view as? UILabel
            if pickerLabel == nil {
                pickerLabel = UILabel()
                pickerLabel?.font = UIFont.systemFont(ofSize: 13)
                pickerLabel?.textAlignment = .center
            }
            pickerLabel?.text = String(row)+"-"+String(component)
            pickerLabel?.textColor = UIColor.blue
            return pickerLabel!
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //将在滑动停止后触发，并打印出选中列和行索引
        print(component)
        print(row)
    }

    @objc func getPickerViewValue() {
        let message = String(pickerView.selectedRow(inComponent: 0)) + "-"
            + String(pickerView.selectedRow(inComponent: 1)) + "-"
            + String(pickerView.selectedRow(inComponent: 2))
        let alertController = UIAlertController(title: "被选中的索引为",
                                                message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
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
