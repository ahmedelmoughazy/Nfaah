//
//  UserLoginRegisterSceneProtocols.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/2/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation

protocol UserLoginRegisterSceneModelProtocol: BaseModelProtocol {
    func signIn(with user: User)
}

protocol UserLoginRegisterScenePresenterProtocol: BasePresenterProtocol {

}

protocol UserLoginRegisterSceneViewProtocol: BaseViewProtocol {
    func setUpView(with type: AuthType)
}
protocol UserLoginRegisterSceneVCDelegate: class {
    func dismissView()
    func logUserIn()
}

enum AuthType {
    case login
    case register
}
