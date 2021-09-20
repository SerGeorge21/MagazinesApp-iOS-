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
        
        //title = "Magazines"

        // Do any additional setup after loading the view.
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


}
