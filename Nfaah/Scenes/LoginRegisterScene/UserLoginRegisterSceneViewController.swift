//
//  UserLoginRegisterSceneViewController.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/2/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FBSDKLoginKit
import GoogleSignIn

class UserLoginRegisterSceneViewController: BaseViewController<UserLoginRegisterScenePresenter> {
    
    // MARK: - Public Variables
    
    // MARK: - Private Variables
    private var textFields = [UITextField]()
    private var type: AuthType?
    
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
    @IBOutlet weak private var socialButtonsStackView: UIStackView!
    @IBOutlet weak private var googleSignInButton: GIDSignInButton!
    
    // MARK: - View controller lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.tabBarController?.navigationController?.navigationBar.isHidden = true
        self.navigationController?.tabBarController?.tabBar.isHidden = true
        self.navigationController?.tabBarController?.tabBar.isTranslucent = true
        self.navigationController?.navigationBar.isHidden = true
        
        presenter.viewDidLoad()
        setupGoogleSignIn()
        setupFaceBookSignIn()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.tabBarController?.tabBar.isHidden = false
        self.navigationController?.tabBarController?.tabBar.isTranslucent = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

// MARK: - IBActions
extension UserLoginRegisterSceneViewController {
    @IBAction func backButtonAction(_ sender: UIButton) {
        presenter.dismissView()
    }
    
    @IBAction func signInOrRegisterAction(_ sender: UIButton) {
        let allHaveText = textFields.allSatisfy { $0.text?.isEmpty == false }
        
        if allHaveText {
            self.showLoading(allowNavigation: false)
            switch type {
            case .login:
                signInAuth()
            case .register:
                signUpAuth()
            default:
                print("Not Valid Type")
            }
        } else {
            showErrorMassege(errorMessage: L10n.Sign.Screen.emptyFields)
        }
        
    }
    
}

// MARK: - Private
extension UserLoginRegisterSceneViewController {
    private func setupGoogleSignIn() {
        GIDSignIn.sharedInstance().presentingViewController = self
        GIDSignIn.sharedInstance().delegate = self
    }
    
    private func setupFaceBookSignIn() {
        let faceBookSignInButton = FacebookButton(permissions: ["public_profile", "email"])
        faceBookSignInButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
        faceBookSignInButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 46).isActive = true
        socialButtonsStackView.addArrangedSubview(faceBookSignInButton)
        faceBookSignInButton.delegate = self
    }
    
    private func signInAuth() {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            //successful login
            strongSelf.hideLoading()
            let user = User(email: email, name: authResult?.user.displayName)
            strongSelf.presenter.logUserIn(user: user)
        }
    }
    
    private func signUpAuth() {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            guard error == nil else {
                self.hideLoading()
                self.showErrorMassege(errorMessage: error!.localizedDescription)
                return
            }
            //successful login
            let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
            changeRequest?.displayName = self.nameTextField.text
            changeRequest?.commitChanges { (error) in
                self.hideLoading()
                let user = User(email: email, name: authResult?.user.displayName, phone: self.mobileTextField.text)
                self.presenter.logUserIn(user: user)
            }
        }
    }
    
    private func sendFIRAuthCredential(credentials: AuthCredential) {
        Auth.auth().signIn(with: credentials) { (authResult, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                //successful login
                let user = User(email: authResult?.user.email,
                                name: authResult?.user.displayName,
                                image: authResult?.user.photoURL?.absoluteString,
                                phone: authResult?.user.phoneNumber)
                self.presenter.logUserIn(user: user)
            }
        }
    }
}

// MARK: - Protocal
extension UserLoginRegisterSceneViewController: UserLoginRegisterSceneViewProtocol {
    func setUpView(with type: AuthType) {
        
        self.type = type
        
        titleLabel.font = FontFamily._29LTAzer.medium.font(size: 17)
        
        chooseAnotherWayLabel.font = FontFamily._29LTAzer.regular.font(size: 15)
        chooseAnotherWayLabel.text = L10n.Sign.Screen.chooseWay
        
        nameTextField.font = FontFamily._29LTAzer.medium.font(size: 17)
        nameTextField.placeholder = L10n.Sign.Screen.fullName
        
        mobileTextField.font = FontFamily._29LTAzer.medium.font(size: 17)
        mobileTextField.placeholder = L10n.Sign.Screen.mobile
        
        emailTextField.font = FontFamily._29LTAzer.medium.font(size: 17)
        emailTextField.placeholder = L10n.Sign.Screen.email
        
        passwordTextField.font = FontFamily._29LTAzer.medium.font(size: 17)
        passwordTextField.placeholder = L10n.Sign.Screen.password
        
        switch type {
        case .login:
            nameView.isHidden = true
            mobileView.isHidden = true
            titleLabel.text = L10n.Sign.Screen.title
            signButton.setTitle(L10n.Sign.Screen.title, for: .normal)
            
            textFields.append(emailTextField)
            textFields.append(passwordTextField)
        case .register:
            nameView.isHidden = false
            mobileView.isHidden = false
            titleLabel.text = L10n.Sign.Screen.New.title
            signButton.setTitle(L10n.Sign.Screen.New.title, for: .normal)
            
            textFields.append(nameTextField)
            textFields.append(mobileTextField)
            textFields.append(emailTextField)
            textFields.append(passwordTextField)
        }
        
        signButton.titleLabel?.font = FontFamily._29LTAzer.regular.font(size: 17)
        signButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        signButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        signButton.layer.shadowOpacity = 1.0
        signButton.layer.shadowRadius = 0.0
        signButton.layer.masksToBounds = false
    }
}

// MARK: - Google Sign In
extension UserLoginRegisterSceneViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        // Perform any operations on signed in user here.
        //        let userId = user.userID                  // For client-side use only!
        //        let idToken = user.authentication.idToken // Safe to send to the server
        //        let fullName = user.profile.name
        //        let givenName = user.profile.givenName
        //        let familyName = user.profile.familyName
        //        let email = user.profile.email
        
        guard let auth = user.authentication else { return }
        let credentials = GoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
        sendFIRAuthCredential(credentials: credentials)
    }
}

// MARK: - FaceBook Sign In
extension UserLoginRegisterSceneViewController: LoginButtonDelegate {
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        guard let token = AccessToken.current?.tokenString else { return }
        
        let credentials = FacebookAuthProvider.credential(withAccessToken: token)
        sendFIRAuthCredential(credentials: credentials)
    }
}

// MARK: - TextFields Delegate
extension UserLoginRegisterSceneViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextField:
            nameTextField.becomeFirstResponder()
        case mobileTextField:
            mobileTextField.becomeFirstResponder()
        case passwordTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            emailTextField.becomeFirstResponder()
        default:
            emailTextField.resignFirstResponder()
        }
        
        return true
    }
    
}
