//
//  UserLoginRegisterSceneCoordinator.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/2/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation

class UserLoginRegisterSceneCoordinator: Coordinator {
    var appRouter: AppRouter
    var type: AuthType
    var viewcontroller: UserLoginRegisterSceneViewController?
    
    init(appRouter: AppRouter, type: AuthType) {
        self.appRouter = appRouter
        self.type = type
    }

    private func createModule() -> UserLoginRegisterSceneViewController {
        let view = UserLoginRegisterSceneViewController()
        let model = UserLoginRegisterSceneModel()
        let presenter = UserLoginRegisterScenePresenter(view: view, model: model)
        presenter.type = type
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
extension UserLoginRegisterSceneCoordinator: UserLoginRegisterSceneVCDelegate {
    func dismissView() {
        appRouter.pop()
    }
}
