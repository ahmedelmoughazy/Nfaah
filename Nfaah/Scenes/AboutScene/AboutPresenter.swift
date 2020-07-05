//
//  AboutPresenter.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/5/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation

class AboutPresenter: BasePresenter, AboutPresenterProtocol {
    
    private var view: AboutViewProtocol?
    private var model: AboutModelProtocol?
    weak var delegate: AboutVCDelegate?

    init(view: AboutViewProtocol, model: AboutModelProtocol) {
        self.view = view
        self.model = model
    }

    func dismissView() {
        delegate?.dismissView()
    }
}
