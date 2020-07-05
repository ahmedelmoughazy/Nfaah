//
//  LoginProtocols.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/1/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation

protocol LoginModelProtocol: BaseModelProtocol {

}

protocol LoginPresenterProtocol: BasePresenterProtocol {

}

protocol LoginViewProtocol: BaseViewProtocol {

}
protocol LoginVCDelegate: class {
    func openWhatsappView(itemValue: String)
    func openAboutScreen()
    func dismissView()
    func showLogin(with type: AuthType)
}
