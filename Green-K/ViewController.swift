//
//  ViewController.swift
//  Green-K
//
//  Created by Wissa Azmy on 11/15/19.
//  Copyright © 2019 Wissa Azmy. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {
    var tabBarHeight: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        // Do any additional setup after loading the view.
    }
    
    func setupTabBar(){
        tabBarHeight = tabBar.layer.frame.height
        
        let homeController = createNavController(viewController: HomeVC(), selected: UIImage(named: "homeBtn_selected")!, unselected: UIImage(named: "homeBtn_default")!)
        let cartController = createNavController(viewController: CartVC(), selected: UIImage(named: "selected-shopping-cart")!, unselected: UIImage(named: "default-shopping-cart")!)
        let storeController = createNavController(viewController: StoreVC(), selected: UIImage(named: "box_open")!, unselected: UIImage(named: "box_closed")!)
        let menuController = createNavController(viewController: StoresVC(), selected: UIImage(named: "menuBtn_selected")!, unselected: UIImage(named: "menuBtn_default")!)
      
        viewControllers = [homeController, cartController, storeController, menuController]
        
    }
    
    func createNavController(viewController: UIViewController , selected: UIImage, unselected : UIImage) -> UINavigationController{
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.image = unselected
        navController.tabBarItem.selectedImage = selected
        
        return navController
    }
    
    
}


