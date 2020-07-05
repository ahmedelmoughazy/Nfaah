//
//  LoginViewController.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/1/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: BaseViewController<LoginPresenter> {

    // MARK: - IBOutlets
    @IBOutlet private weak var aboutButton: UIButton!
    @IBOutlet private weak var contactButton: UIButton!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var registerButton: UIButton!
    @IBOutlet private weak var clientButton: UIButton!

    // MARK: - View controller lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        setUpView()
    }
}

// MARK: - IBActions
extension LoginViewController {
    @IBAction func aboutAction(_ sender: UIButton) {
        presenter.openAboutScreen()
    }
    
    @IBAction func contactAction(_ sender: UIButton) {
        presenter.openWhatsappView(itemValue: "+9677377449960")
    }
    
    @IBAction func loginAction(_ sender: UIButton) {
        presenter.showLogin(with: .login)
    }
    
    @IBAction func registerAction(_ sender: UIButton) {
        presenter.showLogin(with: .register)
    }
    
    @IBAction func alreadyClientAction(_ sender: UIButton) {
    }
}

// MARK: - Private
extension LoginViewController {
    private func setUpView() {
        aboutButton.setTitle(L10n.Login.Screen.about, for: .normal)
        aboutButton.titleLabel?.font = FontFamily._29LTAzer.regular.font(size: 17)
        
        contactButton.setTitle(L10n.Login.Screen.contact, for: .normal)
        contactButton.titleLabel?.font = FontFamily._29LTAzer.regular.font(size: 17)
        
        loginButton.setTitle(L10n.Login.Screen.login, for: .normal)
        loginButton.titleLabel?.font = FontFamily._29LTAzer.regular.font(size: 17)
        
        loginButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        loginButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        loginButton.layer.shadowOpacity = 1.0
        loginButton.layer.shadowRadius = 0.0
        loginButton.layer.masksToBounds = false
        
        registerButton.setTitle(L10n.Login.Screen.newLogin, for: .normal)
        registerButton.titleLabel?.font = FontFamily._29LTAzer.regular.font(size: 17)
        
        registerButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        registerButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        registerButton.layer.shadowOpacity = 1.0
        registerButton.layer.shadowRadius = 0.0
        registerButton.layer.masksToBounds = false
        
        clientButton.setTitle(L10n.Login.Screen.client, for: .normal)
        clientButton.titleLabel?.font = FontFamily._29LTAzer.regular.font(size: 15)
    }
}

// MARK: - Protocal
extension LoginViewController: LoginViewProtocol {

}
