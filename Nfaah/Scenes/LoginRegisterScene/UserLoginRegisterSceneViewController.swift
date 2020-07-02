//
//  UserLoginRegisterSceneViewController.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/2/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation
import UIKit

class UserLoginRegisterSceneViewController: BaseViewController<UserLoginRegisterScenePresenter> {
    
    // MARK: - Public Variables

    // MARK: - Private Variables

    // MARK: - Computed Variables

    // MARK: - IBOutlets
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var nameView: UIView!
    @IBOutlet weak private var nameTextField: UITextField!
    @IBOutlet weak private var mobileView: UIView!
    @IBOutlet weak private var mobileTextField: UITextField!
    @IBOutlet weak private var emailTextField: UITextField!
    @IBOutlet weak private var passwordTextField: UITextField!
    @IBOutlet weak private var signButton: UIButton!
    @IBOutlet weak private var chooseAnotherWayLabel: UILabel!

    // MARK: - Custom Setter

    // MARK: - View controller lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.tabBarController?.navigationController?.navigationBar.isHidden = true
        self.navigationController?.tabBarController?.tabBar.isHidden = true
        self.navigationController?.tabBarController?.tabBar.isTranslucent = true
        self.navigationController?.navigationBar.isHidden = true
        
        presenter.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.tabBarController?.tabBar.isHidden = false
        self.navigationController?.tabBarController?.tabBar.isTranslucent = true
    }
}

// MARK: - IBActions
extension UserLoginRegisterSceneViewController {
    @IBAction func backButtonAction(_ sender: UIButton) {
        presenter.dismissView()
    }
}

// MARK: - Private
extension UserLoginRegisterSceneViewController {

}

// MARK: - Protocal
extension UserLoginRegisterSceneViewController: UserLoginRegisterSceneViewProtocol {
    func setUpView(with type: AuthType) {
        
        titleLabel.font = FontFamily._29LTAzer.medium.font(size: 17)
        
        chooseAnotherWayLabel.font = FontFamily._29LTAzer.regular.font(size: 15)
        chooseAnotherWayLabel.text = L10n.Sign.Screen.chooseWay
        
        switch type {
        case .login:
            nameView.isHidden = true
            mobileView.isHidden = true
            titleLabel.text = L10n.Sign.Screen.title
            signButton.setTitle(L10n.Sign.Screen.title, for: .normal)
        case .register:
            nameView.isHidden = false
            mobileView.isHidden = false
            titleLabel.text = L10n.Sign.Screen.New.title
            signButton.setTitle(L10n.Sign.Screen.New.title, for: .normal)
        }
        
        nameTextField.font = FontFamily._29LTAzer.medium.font(size: 17)
        nameTextField.placeholder = L10n.Sign.Screen.fullName
        
        mobileTextField.font = FontFamily._29LTAzer.medium.font(size: 17)
        mobileTextField.placeholder = L10n.Sign.Screen.mobile
        
        emailTextField.font = FontFamily._29LTAzer.medium.font(size: 17)
        emailTextField.placeholder = L10n.Sign.Screen.email
        
        passwordTextField.font = FontFamily._29LTAzer.medium.font(size: 17)
        passwordTextField.placeholder = L10n.Sign.Screen.password
        
        signButton.titleLabel?.font = FontFamily._29LTAzer.regular.font(size: 17)
        signButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        signButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        signButton.layer.shadowOpacity = 1.0
        signButton.layer.shadowRadius = 0.0
        signButton.layer.masksToBounds = false
    }
}
