//
//  UserLoginRegisterSceneProtocols.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/2/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation

protocol UserLoginRegisterSceneModelProtocol: BaseModelProtocol {
    func signUp(with user: User, completion: @escaping (Bool) -> Void)
    func signIn(with user: User, completion: @escaping (Bool) -> Void)
}

protocol UserLoginRegisterScenePresenterProtocol: BasePresenterProtocol {

}

protocol UserLoginRegisterSceneViewProtocol: BaseViewProtocol {
    func setUpView(with type: AuthType)
}
protocol UserLoginRegisterSceneVCDelegate: AnyObject {
    func dismissView()
    func logUserIn()
}

enum AuthType {
    case login
    case register
}
