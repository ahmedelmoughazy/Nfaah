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
}

// MARK: - IBActions
extension UserLoginRegisterSceneViewController {
    @IBAction func backButtonAction(_ sender: UIButton) {
        presenter.dismissView()
    }
}

// MARK: - Private
extension UserLoginRegisterSceneViewController {
    private func setupGoogleSignIn() {
        GIDSignIn.sharedInstance().presentingViewController = self
        GIDSignIn.sharedInstance().delegate = self
    }
    
    private func setupFaceBookSignIn() {
        let faceBookSignInButton = FBLoginButton(permissions: ["public_profile", "email"])
        view.addSubview(faceBookSignInButton)
        
        faceBookSignInButton.translatesAutoresizingMaskIntoConstraints = false
        let top = NSLayoutConstraint(item: faceBookSignInButton,
                                     attribute: .top,
                                     relatedBy: .equal,
                                     toItem: googleSignInButton,
                                     attribute: .bottom, multiplier: 1,
                                     constant: 16)
        
        let leading = NSLayoutConstraint(item: faceBookSignInButton,
                                         attribute: .leading, relatedBy: .equal,
                                         toItem: view,
                                         attribute: .leading,
                                         multiplier: 1,
                                         constant: 20)
        let trailing = NSLayoutConstraint(item: faceBookSignInButton,
                                          attribute: .trailing, relatedBy: .equal,
                                          toItem: view,
                                          attribute: .trailing,
                                          multiplier: 1,
                                          constant: 20)
        
        let width = NSLayoutConstraint(item: faceBookSignInButton,
                                       attribute: .width,
                                       relatedBy: .equal,
                                       toItem: googleSignInButton,
                                       attribute: .width,
                                       multiplier: 1,
                                       constant: 0)
        
        let height = NSLayoutConstraint(item: faceBookSignInButton,
                                        attribute: .height, relatedBy: .equal,
                                        toItem: nil,
                                        attribute: .notAnAttribute,
                                        multiplier: 1,
                                        constant: 50)
        NSLayoutConstraint.activate([top, leading, trailing, width, height])
        
        faceBookSignInButton.delegate = self
    }
    
    private func sendFIRAuthCredential(credentials: AuthCredential) {
        Auth.auth().signIn(with: credentials) { (authResult, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Login Successful.")
                //successful login
                self.presenter.logUserIn()
            }
        }
    }
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
        let credentials = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
        sendFIRAuthCredential(credentials: credentials)
    }
}
