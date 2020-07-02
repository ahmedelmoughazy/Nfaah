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

}
