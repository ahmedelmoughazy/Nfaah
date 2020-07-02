//
//  TabBarCoordinator.swift
//  Nfaah
//
//  Created by Ahmed Refaat on 7/1/20.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation
import UIKit

class TabBarCoordinator: Coordinator {
    
    private var rootVC: UIViewController?
    private var router: AppRouter
    var tabController: TabBarController?
    
    init(router: AppRouter) {
        self.router = router
        
    }

    func start() {
        tabController = TabBarController()
        router.navigationController.setViewControllers([tabController!], animated: true)
    }
    
    func startInProfile() {
        start()
        tabController?.setProfileAsSelectedTab()
    }
}
