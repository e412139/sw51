//
//  ViewController.swift
//  aProject
//
//  Created by min liu on 2021/6/27.
//

import UIKit
import HandyJSON
import SwiftyJSON
import Alamofire
class ViewController: UIViewController ,UITextFieldDelegate{
    var myTextField: UITextField?
    var coinsLabel: UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orange
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.initBtn()
        self.initTextfield()
        self.initLabel()
        self.initLabelCoins()
        self.initLabelValueCoins()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 結束編輯 把鍵盤隱藏起來
//        self.clickChange()
        myTextField?.resignFirstResponder() //要求離開我們的Responder
        self.view.endEditing(true)
        return true
    }

    func initTextfield(){
        // 使用 UITextField(frame:) 建立一個 UITextField
        myTextField = UITextField(frame: CGRect(x: 10, y: 80, width: 100, height: 40))
        myTextField?.delegate = self
        // 尚未輸入時的預設顯示提示文字
        myTextField?.placeholder = "enter value"
        myTextField?.text = "100"
        // 輸入框的樣式 這邊選擇圓角樣式
        myTextField?.borderStyle = .roundedRect

        // 輸入框右邊顯示清除按鈕時機 這邊選擇當編輯時顯示
        myTextField?.clearButtonMode = .whileEditing

        // 輸入框適用的鍵盤 這邊選擇 適用輸入 Email 的鍵盤(會有 @ 跟 . 可供輸入)
        myTextField?.keyboardType = .emailAddress

        // 鍵盤上的 return 鍵樣式 這邊選擇 Done
        myTextField?.returnKeyType = .done

        // 輸入文字的顏色
        myTextField?.textColor = UIColor.white

        // UITextField 的背景顏色
        myTextField?.backgroundColor = UIColor.lightGray
        
        self.view.addSubview(myTextField!)
    }
    func initLabel(){
        let myLabel = UILabel(frame: CGRect(x: 0, y: 150, width: 100, height: 25))
        // 文字內容
        myLabel.text = "轉換結果"

        // 文字顏色
        myLabel.textColor = UIColor.green

        // 文字的字型與大小
        myLabel.font = UIFont(name: "Helvetica-Light", size: 14)

//        // 可以再修改文字的大小
//        myLabel.font = myLabel.font.fontWithSize(24)
//
//        // 或是可以使用系統預設字型 並設定文字大小
//        myLabel.font = UIFont.systemFontOfSize(36)

        // 設定文字位置 置左、置中或置右等等
        myLabel.textAlignment = .left

        // 也可以簡寫成這樣
        myLabel.textAlignment = .center

        // 文字行數
        myLabel.numberOfLines = 1

        // 文字過多時 過濾的方式
        myLabel.lineBreakMode = NSLineBreakMode.byTruncatingTail

        // 陰影的顏色 如不設定則預設為沒有陰影
        myLabel.shadowColor = UIColor.black

        // 陰影的偏移量 需先設定陰影的顏色
        myLabel.shadowOffset = CGSize(width: 2, height: 2)
        self.view.addSubview(myLabel)
    }
    func initLabelCoins(){
        let myLabel = UILabel(frame: CGRect(x: 100, y: 150, width: 100, height: 25))
        // 文字內容
        myLabel.text = "coins"

        // 文字顏色
        myLabel.textColor = UIColor.black
        
        // 或是可以使用系統預設字型 並設定文字大小
        myLabel.font = UIFont.systemFont(ofSize: 14)

        // 設定文字位置 置左、置中或置右等等
        myLabel.textAlignment = .center

        // 文字行數
        myLabel.numberOfLines = 1

        // 文字過多時 過濾的方式
        myLabel.lineBreakMode = NSLineBreakMode.byTruncatingTail
        
        self.view.addSubview(myLabel)
    }
    func initLabelValueCoins(){
        coinsLabel = UILabel(frame: CGRect(x: 220, y: 150, width: 100, height: 25))
        // 文字內容
        coinsLabel?.text = "coins value"

        // 文字顏色
        coinsLabel?.textColor = UIColor.black
        
        // 或是可以使用系統預設字型 並設定文字大小
        coinsLabel?.font = UIFont.systemFont(ofSize: 14)

        // 也可以簡寫成這樣
        coinsLabel?.textAlignment = .center

        // 文字行數
        coinsLabel?.numberOfLines = 1

        // 文字過多時 過濾的方式
        coinsLabel?.lineBreakMode = NSLineBreakMode.byTruncatingTail

        coinsLabel?.backgroundColor = UIColor.white
        
        self.view.addSubview(coinsLabel!)
    }
    func initBtn(){
        // 使用 UIButton(frame:) 建立一個 UIButton
        let myButton = UIButton(
          frame: CGRect(x: 200, y: 80, width: 100, height: 30))
        // 按鈕文字
        myButton.setTitle("change", for: .normal)
        // 按鈕是否可以使用
        myButton.isEnabled = true

        // 按鈕背景顏色
        myButton.backgroundColor = UIColor.darkGray

        // 按鈕按下後的動作
        myButton.addTarget(self,action: #selector(ViewController.clickChange),for: .touchUpInside)
        // 取得螢幕的尺寸
        let fullScreenSize = UIScreen.main.bounds.size
        // 設置位置並加入畫面
//        myButton.center = CGPoint(
//            x: fullScreenSize.width * 0.5,
//            y: fullScreenSize.height * 0.5)
        self.view.addSubview(myButton)
    }
    @objc func clickChange(){
        //有文字內容且大於1
        let textfieldInt: Int? = Int((myTextField?.text!)!)
        if !(myTextField?.text!.isEmpty)! && textfieldInt! > 1{
            print("coins is = \((myTextField?.text)!)")
            let url = "https://api.guildwars2.com/v2/commerce/exchange/gems?quantity=" + (myTextField?.text)!
            Alamofire.request(url).validate().responseJSON { response in
                    switch response.result {
                    case .success:
                        print("Validation Successful)")

                        if let json = response.data {
                            do{
                                let data = try JSON(data: json)
                                let coins = data["coins_per_gem"]
                                let quantity = data["quantity"]
                                print("DATA coins: \(coins)")
                                self.coinsLabel?.text = coins.stringValue
                                print("DATA quantity: \(quantity)")
                            }
                            catch{
                                print("JSON Error")
                            }

                        }
                    case .failure(let error):
                        print(error)
                    }
                }
        }
        
        
        /**
         {
           "coins_per_gem": 2193,
           "quantity": 219319
         }
         */

        
//        jsonpaser
        
//        let jsonString = "{\"age\":24,\"name\":\"Micheal\",\"sex\":\"男\"}"
//        guard let model = PersonModel.deserialize(from: jsonString) else {return}
//
//        // 打印出model的name
//        print(model.name ?? "")
//
//
//        let json = "{ \"people\": [{ \"firstName\": \"Paul\", \"lastName\": \"Hudson\", \"isAlive\": true }, { \"firstName\": \"Angela\", \"lastName\": \"Merkel\", \"isAlive\": true }, { \"firstName\": \"George\", \"lastName\": \"Washington\", \"isAlive\": false } ] }"
//        if let data = json.data(using: .utf8) {
//            if let json = try? JSON(data: data) {
//                for item in json["people"].arrayValue {
//                    print(item["firstName"].stringValue)
//                }
//            }
//        }
    }
}
class PersonModel: HandyJSON {
    
    var name: NSString!
    var age: Int?
    var sex: String?
    var tel: String?
    
    required init() {
        
    }
}
