//
//  NewOrderPresenter.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/3/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation

class NewOrderPresenter: BasePresenter, NewOrderPresenterProtocol {
    
    private var view: NewOrderViewProtocol?
    private var model: NewOrderModelProtocol?
    weak var delegate: NewOrderVCDelegate?

    init(view: NewOrderViewProtocol, model: NewOrderModelProtocol) {
        self.view = view
        self.model = model
    }

    func dismissView() {
        delegate?.dismissView()
    }
    
    func add(order: Order) {
        view?.showLoading?(allowNavigation: false)
        model?.add(order: order) { success in
            if !success {
                self.view?.showErrorMassege?(errorMessage: L10n.NewOrder.Screen.Order.error)
            }
            self.view?.hideLoading?()
            self.dismissView()
        }
    }
    
    func uploadImage(data: Data, name: String) {
        model?.uploadImage(data: data, name: name)
    }
}
