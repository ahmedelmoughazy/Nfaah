//
//  AboutCoordinator.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/5/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation

class AboutCoordinator: Coordinator {
    var appRouter: AppRouter
    var viewcontroller: AboutViewController?
    
    init(appRouter: AppRouter) {
        self.appRouter = appRouter
    }

    private func createModule() -> AboutViewController {
        let view = AboutViewController()
        let model = AboutModel()
        let presenter = AboutPresenter(view: view, model: model)
        presenter.delegate = self
        view.setPresenter(presenter: presenter)
        return view
    }

    func start() {
        let viewcontroller = self.createModule()
        viewcontroller.modalPresentationStyle = .fullScreen
        appRouter.present(viewcontroller, animated: true)
        self.viewcontroller = viewcontroller
    }

}
// MARK: - Delegetes
extension AboutCoordinator: AboutVCDelegate {
    func dismissView() {
        appRouter.dismissModule(animated: true, completion: nil)
    }
}
