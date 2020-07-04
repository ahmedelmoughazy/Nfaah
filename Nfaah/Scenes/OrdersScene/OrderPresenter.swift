//
//  OrderPresenter.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/1/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation

class OrderPresenter: BasePresenter, OrderPresenterProtocol {
    
    private var view: OrderViewProtocol?
    private var model: OrderModelProtocol?
    weak var delegate: OrderVCDelegate?

    init(view: OrderViewProtocol, model: OrderModelProtocol) {
        self.view = view
        self.model = model
    }

    func showNewOrder() {
        delegate?.showNewOrder()
    }
}
