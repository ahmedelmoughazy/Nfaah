//
//  ProfileCoordinator.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/1/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import UIKit

class ProfileCoordinator: Coordinator {
    var appRouter: AppRouter
    var viewcontroller: ProfileViewController?
    var newOrderCoordinator: NewOrderCoordinator?

    init(appRouter: AppRouter) {
        self.appRouter = appRouter
    }

    private func createModule() -> ProfileViewController {
        let view = ProfileViewController()
        let model = ProfileModel()
        let presenter = ProfilePresenter(view: view, model: model)
        presenter.delegate = self
        view.setPresenter(presenter: presenter)
        return view
    }

    func start() {
        let viewcontroller = self.createModule()
        appRouter.push(viewcontroller, animated: true, completion: nil)
        self.viewcontroller = viewcontroller
    }

}
// MARK: - Delegetes
extension ProfileCoordinator: ProfileVCDelegate {
    func dismissView() {
        appRouter.pop()
    }
    
    func showNewOrder() {
        let newOrderCoordinator = NewOrderCoordinator(appRouter: appRouter)
        self.newOrderCoordinator = newOrderCoordinator
        newOrderCoordinator.start()
    }
    
    func logout() {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        appDelegate?.applicationCoordinator?.logoutUnauthedUser()
    }
}
