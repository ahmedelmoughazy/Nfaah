//
//  TabBarController.swift
//  Nfaah
//
//  Created by Ahmed Refaat on 7/1/20.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation
import FirebaseAuth
import UIKit

class TabBarController: UITabBarController {
    
    var homeCoordinator: HomeCoordinator?
    var ordersCoordinator: OrderCoordinator?
    var profileCoordinator: ProfileCoordinator?
    var loginCoordinator: LoginCoordinator?

    var controllers: [UIViewController] = []
    
    let homeNav = UINavigationController()
    let ordersNav = UINavigationController()
    let profileNav = UINavigationController()
    let loginNav = UINavigationController()
    
    private var loggedIn: Bool {
        if Auth.auth().currentUser != nil {
            return true
        } else {
            return false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setHomeItem()
        setOrdersItem()
        
        if loggedIn {
            self.setProfileItem()
        } else {
            self.setLoginItem()
        }
        
        self.viewControllers = controllers
        tabBar.isTranslucent = false
        tabBar.selectionIndicatorImage = UIImage()
            .makeImageWithColorAndSize(color: Asset.Colors.bahamaBlue.color,
                                       size: CGSize(width: tabBar.frame.width/CGFloat(tabBar.items!.count) - 20,
            height: tabBar.frame.height - 10)).roundedImage
        self.selectedViewController = ordersNav
        ordersCoordinator?.start()

    }
    
    func setHomeItem() {
        let homeRouter = AppRouter(navigationController: homeNav)
        homeCoordinator = HomeCoordinator(appRouter: homeRouter)
        homeNav.tabBarItem = UITabBarItem(
            title: nil,
            image: Asset.Images.icHomeUnselected.image.withRenderingMode(.alwaysOriginal),
            selectedImage: Asset.Images.icHomeSelected.image.withRenderingMode(.alwaysOriginal))
        controllers.append(homeNav)
        homeCoordinator?.start()

    }
    
    func setOrdersItem() {
        let ordersRouter = AppRouter(navigationController: ordersNav)
        ordersCoordinator = OrderCoordinator(appRouter: ordersRouter)
        ordersNav.tabBarItem = UITabBarItem(
            title: nil,
            image: Asset.Images.icCartUnselected.image.withRenderingMode(.alwaysOriginal),
            selectedImage: Asset.Images.icCartSelected.image.withRenderingMode(.alwaysOriginal))
        controllers.append(ordersNav)
    }
    
    func setProfileItem() {
        let profileRouter = AppRouter(navigationController: profileNav)
        profileCoordinator = ProfileCoordinator(appRouter: profileRouter)
        profileNav.tabBarItem = UITabBarItem(
            title: nil,
            image: Asset.Images.icTabbarSelectedProfile.image.withRenderingMode(.alwaysOriginal),
            selectedImage: Asset.Images.icTabbarUnselectedProfile.image.withRenderingMode(.alwaysOriginal))
        controllers.append(profileNav)
        profileCoordinator?.start()
    }
    
    
    func setLoginItem() {
        let loginRouter = AppRouter(navigationController: loginNav)
        loginCoordinator = LoginCoordinator(appRouter: loginRouter)
        loginNav.tabBarItem = UITabBarItem(
            title: nil,
            image: Asset.Images.icTabbarSelectedProfile.image.withRenderingMode(.alwaysOriginal),
            selectedImage: Asset.Images.icTabbarUnselectedProfile.image.withRenderingMode(.alwaysOriginal))
        controllers.append(loginNav)
        loginCoordinator?.start()
    }
    
    func setProfileAsSelectedTab() {
        if loggedIn {
            self.selectedViewController = profileNav
        } else {
            self.selectedViewController = loginNav
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.tabBar.backgroundColor = UIColor.white
        //tabBar.frame.size.height = 60
        tabBar.isTranslucent = true
        tabBar.shadowImage = UIImage()
        tabBar.barStyle = UIBarStyle.black
        tabBar.barTintColor = UIColor.white
        tabBar.layer.setShadow(opacity: 0.5, radius: 1, shadowColor: UIColor.gray.cgColor)
        
        guard let items = tabBar.items else { return }
        for tabBarItem in items {
            tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
    }
    
    
    func resize(image: UIImage, newWidth: CGFloat, newHeight: CGFloat) -> UIImage {
        var newImage = image
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        newImage.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
}

extension TabBarController {
    func logoutFromApp() {
        
    }
}
