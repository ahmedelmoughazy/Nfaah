//
//  LoginPresenter.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/1/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation

class LoginPresenter: BasePresenter, LoginPresenterProtocol {
    
    private var view: LoginViewProtocol?
    private var model: LoginModelProtocol?
    weak var delegate: LoginVCDelegate?

    init(view: LoginViewProtocol, model: LoginModelProtocol) {
        self.view = view
        self.model = model
    }

    func showLogin(with type: AuthType) {
        delegate?.showLogin(with: type)
    }
    
    func openAboutScreen() {
        delegate?.openAboutScreen()
    }
    
    func openWhatsappView(itemValue: String) {
        delegate?.openWhatsappView(itemValue: itemValue)
    }

    func showErrorMessage(error: String) {
        view?.showErrorMessage?(errorMessage: error)
    }
}
