# 專案名稱 SwiftWithViewControlleer

純code使用swift與UIKit框架對於ViewController應用與切換

## 功能 Features

- ViewController 與 array 的運用
- ViewController 與 TableBar 運用
- 取得 api 資料運用
- UINavigationController 換頁運用

## 整體架構與流程說明
- 我在試著模擬登入畫面進到遊戲這一個 viewControlleru 應用
- SceneDelegate
  建立 UIWindow，並指定 rootViewController = JGTableBarController()，即從 UITabBarController 開始
  一開始 tab bar 被隱藏，會先顯示 LunchViewController
- JGTableBarController
  管理多個頁面（tab）: HomePageVC、DashboardVC 、 NotifyVC 、 ViewController
  預設會先顯示 LunchViewController，等使用者點擊「Start」按鈕後才切換並顯示底部的 TabBar
  tabChange() 函數負責切換 tab 畫面與顯示 tab bar
- LunchViewController
  畫面為紅底，有一顆「Start」按鈕。
  點擊按鈕會呼叫 JGTableBarController.tabChange() 顯示主畫面
- HomePageVC（首頁）
  使用 UINavigationController 包裝 
  畫面上有標題與按鈕，點擊可前往 HomePage2VC，在 HomePage2VC 點擊後會 push HomePage3VC
－ViewController
  一個輸入框：預設為 100，可以輸入 gem 數量。
  幾個 label 用來顯示「轉換結果」與 gem 對應的 coins。
  一個按鈕點擊後會呼叫 Guild Wars 2 的 API 進行查詢。
  使用 Alamofire 搭配 SwiftyJSON 解析 API 資料。
  API URL 範例：
  https://api.guildwars2.com/v2/commerce/exchange/gems?quantity=100 

## 使用技術 Tech Stack

- UIKit
- UINavigationController
- UITabBarController
- HandyJSON
- SwiftyJSON
- Alamofire

## 安裝與執行方式 Getting Started
Clone 此專案：
    ```bash
    git clone https://github.com/e412139/sw51.git
    ```

