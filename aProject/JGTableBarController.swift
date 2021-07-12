//
//  JGTableBarController.swift
//  testNavigationController
//
//  Created by min liu on 2021/6/28.
//

import UIKit

class JGTableBarController: UITabBarController {
    var arr1: NSArray?
    var arr2: NSArray?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.backgroundColor = UIColor.clear
        //tabbar 控制下面3個頁面
        let homeVC = HomePageVC()
        let dashboardVC = DashboardVC()
        let notifyVC = NotifyVC()
        let gw2VC = ViewController()
        //home 使用 NavigationController
        let nvHome = UINavigationController(rootViewController: homeVC)
        nvHome.navigationBar.barTintColor = UIColor.lightGray
        //tabbar 加入 3 viewcontroller
        arr2 = [nvHome, dashboardVC, notifyVC, gw2VC]
        let lunchVC = LunchViewController()
        self.tabBar.isHidden = true
        arr1 = [lunchVC]
        self.viewControllers = (arr1 as! [UIViewController])
        //設定 home是第一個tabbaritem 並指定文字樣式
//        let tabHome = self.tabBar.items![0]
//        tabHome.image = UIImage(named: "home_unselect")?.withRenderingMode(.alwaysOriginal)
//        tabHome.selectedImage = UIImage(named: "home_select")?.withRenderingMode(.alwaysOriginal)
//
//        let tabDashboard = self.tabBar.items![1]
//        tabDashboard.image=UIImage(named: "dashboard")?.withRenderingMode(.alwaysOriginal)
//        tabDashboard.selectedImage=UIImage(named: "dashboard")?.withRenderingMode(.alwaysOriginal)
//
//        let tabNotify = self.tabBar.items![2]
//        tabNotify.image=UIImage(named: "notify_unselect")?.withRenderingMode(.alwaysOriginal)
//        tabNotify.selectedImage=UIImage(named: "notify_select")?.withRenderingMode(.alwaysOriginal)
        homeVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 100)
        dashboardVC.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 200)
        notifyVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 300)
        gw2VC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 400)

    }
    func tabChange(){
        self.tabBar.isHidden = false
        self.viewControllers = (arr2 as! [UIViewController])
        self.selectedIndex = 0
//        selectedViewController = viewControllers![0]
        
//        UIApplication.shared.keyWindow?.rootViewController = self
        
        let keyWindow1 = Array(UIApplication.shared.connectedScenes)
                .compactMap { $0 as? UIWindowScene }
                .flatMap { $0.windows }
                .first(where: { $0.isKeyWindow })
        keyWindow1?.rootViewController = self
    }
    public override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("selected")
      }
    // called whenever a tab button is tapped
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("tabBarController")
//        if let firstVC = viewController as? FirstViewController {
//                firstVC.doSomeAction()
//        }
//
//        if viewController is FirstViewController {
//            print("First tab")
//        } else if viewController is SecondViewController {
//            print("Second tab")
//        }
    }
    deinit {
        // perform the deinitialization
        print("deinit JGTableBarController")
    }
}
