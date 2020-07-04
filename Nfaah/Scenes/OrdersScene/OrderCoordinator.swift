//
//  OrderCoordinator.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/1/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation
import FirebaseAuth

class OrderCoordinator: Coordinator {
    var appRouter: AppRouter
    var viewcontroller: OrderViewController?
    var newOrderCoordinator: NewOrderCoordinator?
    
    init(appRouter: AppRouter) {
        self.appRouter = appRouter
    }

    private func createModule() -> OrderViewController {
        let view = OrderViewController()
        let model = OrderModel()
        let presenter = OrderPresenter(view: view, model: model)
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
extension OrderCoordinator: OrderVCDelegate {
    func showNewOrder() {
        if Auth.auth().currentUser != nil {
            let newOrderCoordinator = NewOrderCoordinator(appRouter: appRouter)
            self.newOrderCoordinator = newOrderCoordinator
            newOrderCoordinator.start()
        } else {
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            appDelegate?.applicationCoordinator?.logUserIn()
        }

    }
    
    func dismissView() {
        appRouter.pop()
    }
}
