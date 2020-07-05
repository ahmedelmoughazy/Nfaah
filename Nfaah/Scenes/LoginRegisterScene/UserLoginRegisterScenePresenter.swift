//
//  UserLoginRegisterScenePresenter.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/2/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation

class UserLoginRegisterScenePresenter: BasePresenter, UserLoginRegisterScenePresenterProtocol {
    
    private var view: UserLoginRegisterSceneViewProtocol
    private var model: UserLoginRegisterSceneModelProtocol
    weak var delegate: UserLoginRegisterSceneVCDelegate?
    var type: AuthType?

    init(view: UserLoginRegisterSceneViewProtocol, model: UserLoginRegisterSceneModelProtocol) {
        self.view = view
        self.model = model
    }

    func viewDidLoad() {
        guard let screenType = type else { return }
        view.setUpView(with: screenType)
    }
    
    func logUserIn(user: User) {
        model.signIn(with: user) { success in
            if !success {
                self.view.showErrorMassege?(errorMessage: L10n.NewOrder.Screen.Order.error)
            }
        }
        delegate?.logUserIn()
    }
    
    func dismissView() {
        delegate?.dismissView()
    }
}
