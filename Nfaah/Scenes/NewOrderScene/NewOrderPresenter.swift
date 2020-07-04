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
        model?.add(order: order)
    }
}
