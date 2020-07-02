//
//  ApplicationCoordinator.swift
//  Nfaah
//
//  Created by Ahmed Refaat on 7/1/20.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation
import UIKit

class ApplicationCoordinator: Coordinator {
    private var window: UIWindow?
    private var navVC: UINavigationController
    private var appRouter: AppRouter
    private var tabCoordinator: TabBarCoordinator?
    
    init(appWindow: UIWindow?) {
        window = appWindow
        navVC = UINavigationController()
        navVC.navigationBar.isHidden = true
        appRouter = AppRouter(navigationController: navVC)
        self.navVC.navigationBar.isHidden = true
    }
    
    func start() {
        guard let appwindow = (UIApplication.shared.delegate?.window as? UIWindow) else { return }
        window = appwindow
        startHome()
        window?.makeKeyAndVisible()
    }
}

extension ApplicationCoordinator {
    func startHome() {
        self.tabCoordinator = TabBarCoordinator(router: appRouter)
        tabCoordinator?.start()
        window?.rootViewController = appRouter.toPresentable()
    }
}

extension ApplicationCoordinator {
    func logoutUnauthedUser() {
        UserDefaults.standard.removeObject(forKey: "token")
        tabCoordinator = TabBarCoordinator(router: appRouter)
        tabCoordinator?.startInProfile()
        window?.rootViewController = appRouter.toPresentable()
    }
}
