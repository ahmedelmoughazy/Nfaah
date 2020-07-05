//
//  LoginCoordinator.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/1/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import UIKit

class LoginCoordinator: Coordinator {
    var appRouter: AppRouter
    var viewcontroller: LoginViewController?
    var loginRegisterSceneCoordinator: UserLoginRegisterSceneCoordinator?
    var aboutCoordinator: AboutCoordinator?
    var presenter: LoginPresenter?

    init(appRouter: AppRouter) {
        self.appRouter = appRouter
    }

    private func createModule() -> LoginViewController {
        let view = LoginViewController()
        let model = LoginModel()
        let presenter = LoginPresenter(view: view, model: model)
        presenter.delegate = self
        self.presenter = presenter
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
    func openAboutScreen() {
        let aboutCoordinator = AboutCoordinator(appRouter: appRouter)
        self.aboutCoordinator = aboutCoordinator
        aboutCoordinator.start()
    }
    
    func dismissView() {
        appRouter.pop()
    }
    
    func openWhatsappView(itemValue: String) {
        if let url = URL(string: "https://api.whatsapp.com/send?phone=\(itemValue)"),
            UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            presenter?.showErrorMessage(error: L10n.Profile.Screen.noWhatsApp)
        }
    }
    
    func showLogin(with type: AuthType) {
        let loginRegisterSceneCoordinator = UserLoginRegisterSceneCoordinator(appRouter: appRouter, type: type)
        self.loginRegisterSceneCoordinator = loginRegisterSceneCoordinator
        loginRegisterSceneCoordinator.start()
    }
}
