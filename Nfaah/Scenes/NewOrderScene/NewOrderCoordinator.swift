//
//  NewOrderCoordinator.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/3/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation

class NewOrderCoordinator: Coordinator {
    var appRouter: AppRouter
    var viewcontroller: NewOrderViewController?
    
    init(appRouter: AppRouter) {
        self.appRouter = appRouter
    }

    private func createModule() -> NewOrderViewController {
        let view = NewOrderViewController()
        let model = NewOrderModel()
        let presenter = NewOrderPresenter(view: view, model: model)
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
extension NewOrderCoordinator: NewOrderVCDelegate {
    func dismissView() {
        appRouter.dismissModule(animated: true, completion: nil)
    }
}
