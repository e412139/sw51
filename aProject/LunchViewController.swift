//
//  LunchViewController.swift
//  aProject
//
//  Created by min liu on 2021/6/28.
//

import UIKit

class LunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.initBtn()
    }
    func initBtn(){
        // 使用 UIButton(frame:) 建立一個 UIButton
        let myButton = UIButton(
          frame: CGRect(x: 200, y: 80, width: 100, height: 30))
        // 按鈕文字
        myButton.setTitle("start", for: .normal)
        // 按鈕是否可以使用
        myButton.isEnabled = true

        // 按鈕背景顏色
        myButton.backgroundColor = UIColor.darkGray

        // 按鈕按下後的動作
        myButton.addTarget(self,action: #selector(ViewController.clickChange),for: .touchUpInside)
        // 取得螢幕的尺寸
        let fullScreenSize = UIScreen.main.bounds.size
        // 設置位置並加入畫面
        myButton.center = CGPoint(
            x: fullScreenSize.width * 0.5,
            y: fullScreenSize.height * 0.5)
        self.view.addSubview(myButton)
    }
    @objc func clickChange(){
        let tabcontroller = JGTableBarController()
        tabcontroller.tabChange()
    }
    deinit {
        // perform the deinitialization
        print("deinit LunchViewController")
    }
}
