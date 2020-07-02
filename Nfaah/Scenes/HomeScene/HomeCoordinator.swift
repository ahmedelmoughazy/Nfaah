//
//  HomeCoordinator.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/1/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation

class HomeCoordinator: Coordinator {
    var appRouter: AppRouter
    var viewcontroller: HomeViewController?
    
    init(appRouter: AppRouter) {
        self.appRouter = appRouter
    }

    private func createModule() -> HomeViewController {
        let view = HomeViewController()
        let model = HomeModel()
        let presenter = HomePresenter(view: view, model: model)
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
extension HomeCoordinator: HomeVCDelegate {
    func dismissView() {
        appRouter.pop()
    }
}
