//
//  myTabBarController.swift
//  ThreenitasDemoIOS
//
//  Created by George Servos  on 4/8/21.
//

import UIKit

class myTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    var textToPass : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.tabBar.shadowImage = UIImage()
        
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 16, green: 20, blue: 23, alpha: 1)
        
    }
    
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if viewController.isKind(of: SettingsTableViewController.self as AnyClass){
            let viewController = tabBarController.viewControllers?[4] as! SettingsTableViewController
            //self.navigationController?.navigationBar.topItem?.title = "Settings"
            self.navigationItem.title = "Settings"
            
        }else if viewController.isKind(of: BookCollectionViewController.self as AnyClass){
            let viewController = tabBarController.viewControllers?[0] as! BookCollectionViewController
            //self.navigationController?.navigationBar.topItem?.title = "Magazines"
            self.navigationItem.title = "Magazines"
        }
        
        
        return true
    }


    override func viewWillLayoutSubviews() {
        var tabFrame : CGRect = self.tabBar.frame
        tabFrame.size.height = tabFrame.size.height + 20.0
        tabFrame.origin.y = self.view.frame.size.height - 50
        self.tabBar.frame = tabFrame
    }
    
}

class CustomTabBar : UITabBar {
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        super.sizeThatFits(size)
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = 100
        return sizeThatFits
    }
}
