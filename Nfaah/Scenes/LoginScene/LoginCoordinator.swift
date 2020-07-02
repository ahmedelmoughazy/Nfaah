//
//  LoginCoordinator.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/1/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation

class LoginCoordinator: Coordinator {
    var appRouter: AppRouter
    var viewcontroller: LoginViewController?
    var loginRegisterSceneCoordinator: UserLoginRegisterSceneCoordinator?
    
    init(appRouter: AppRouter) {
        self.appRouter = appRouter
    }

    private func createModule() -> LoginViewController {
        let view = LoginViewController()
        let model = LoginModel()
        let presenter = LoginPresenter(view: view, model: model)
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
extension LoginCoordinator: LoginVCDelegate {
    func dismissView() {
        appRouter.pop()
    }
    
    func showLogin(with type: AuthType) {
        let loginRegisterSceneCoordinator = UserLoginRegisterSceneCoordinator(appRouter: appRouter, type: type)
        self.loginRegisterSceneCoordinator = loginRegisterSceneCoordinator
        loginRegisterSceneCoordinator.start()
    }
}
