//
//  HomePresenter.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/1/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation

class HomePresenter: BasePresenter, HomePresenterProtocol {
    
    private var view: HomeViewProtocol?
    private var model: HomeModelProtocol?
    weak var delegate: HomeVCDelegate?
    
    init(view: HomeViewProtocol, model: HomeModelProtocol) {
        self.view = view
        self.model = model
    }
    
    func getOrders() {
        view?.renderViewWithData(data: [Order]())
        self.view?.showLoading?(allowNavigation: false)
        model?.getOrders() { result in
            switch result {
            case .success(let orders):
                self.view?.clearData()
                self.view?.renderViewWithData(data: orders)
            case .failure(let error):
                self.view?.showErrorMassege?(errorMessage: error.localizedDescription)
            }
            self.view?.hideLoading?()
        }
    }
}
