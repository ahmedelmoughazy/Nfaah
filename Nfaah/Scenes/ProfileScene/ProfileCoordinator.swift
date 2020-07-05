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
    var aboutCoordinator: AboutCoordinator?
    var presenter: ProfilePresenter?
    
    init(appRouter: AppRouter) {
        self.appRouter = appRouter
    }

    private func createModule() -> ProfileViewController {
        let view = ProfileViewController()
        let model = ProfileModel()
        let presenter = ProfilePresenter(view: view, model: model)
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
    
    func openWhatsappView(itemValue: String) {
        if let url = URL(string: "https://api.whatsapp.com/send?phone=\(itemValue)"),
            UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            presenter?.showErrorMessage(error: L10n.Profile.Screen.noWhatsApp)
        }
    }
    
    func openAboutScreen() {
        let aboutCoordinator = AboutCoordinator(appRouter: appRouter)
        self.aboutCoordinator = aboutCoordinator
        aboutCoordinator.start()
    }
}
