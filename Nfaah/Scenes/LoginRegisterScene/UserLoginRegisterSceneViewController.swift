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
import AuthenticationServices
import CryptoKit

class UserLoginRegisterSceneViewController: BaseViewController<UserLoginRegisterScenePresenter> {
    
    // MARK: - Private Variables
    private var textFields = [UITextField]()
    private var type: AuthType?
    fileprivate var currentNonce: String?
    
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
    @IBOutlet weak private var googleSignInView: UIView!
    
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
        setupAppleLogin()
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

// MARK: - Selectors
extension UserLoginRegisterSceneViewController {
    
    @objc
    @available(iOS 13.0, *)
    private func signInButtonTapped() {
        let nonce = randomNonceString()
        currentNonce = nonce
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        request.nonce = sha256(nonce)
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    @available(iOS 13, *)
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            return String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
    
    @objc
    private func googleSignInClicked() {
        GIDSignIn.sharedInstance().signIn()
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
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(googleSignInClicked))
        googleSignInView.layer.cornerRadius = 4
        googleSignInView.isUserInteractionEnabled = true
        googleSignInView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func setupFaceBookSignIn() {
        let faceBookSignInButton = FacebookButton(permissions: ["public_profile", "email"])
        faceBookSignInButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
        faceBookSignInButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40).isActive = true
        socialButtonsStackView.addArrangedSubview(faceBookSignInButton)
        faceBookSignInButton.delegate = self
    }
    
    private func setupAppleLogin() {
        if #available(iOS 13.0, *) {
            let signInButton = ASAuthorizationAppleIDButton()
            signInButton.layer.cornerRadius = 2
            signInButton.heightAnchor.constraint(equalToConstant: 42).isActive = true
            signInButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40).isActive = true
            socialButtonsStackView.addArrangedSubview(signInButton)
            
            signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchDown)
            
        } else {
            // Fallback on earlier versions
        }
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
        
        hideKeyboardWhenTappedAround()
        
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

// MARK: - Apple Sign In Delegate
@available(iOS 13.0, *)
extension UserLoginRegisterSceneViewController: ASAuthorizationControllerDelegate {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {

            guard let nonce = currentNonce else {
                fatalError("Invalid state: A login callback was received, but no login request was sent.")
            }
            guard let appleIDToken = appleIDCredential.identityToken else {
                print("Unable to fetch identity token")
                return
            }
            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                return
            }
            
            print("AppleID Credential Authorization: email: \(String(describing: appleIDCredential.email))")
            
            // Initialize a Firebase credential.
            let credential = OAuthProvider.credential(withProviderID: "apple.com",
                                                      idToken: idTokenString,
                                                      rawNonce: nonce)
            // Sign in with Firebase.
            Auth.auth().signIn(with: credential) { (authResult, error) in
                if (error != nil) {
                    // Error. If error.code == .MissingOrInvalidNonce, make sure
                    // you're sending the SHA256-hashed nonce as a hex string with
                    // your request to Apple.
                    print(error!.localizedDescription)
                    return
                }
                // User is signed in to Firebase with Apple.
                // ...
                let userName = "\(appleIDCredential.fullName?.givenName ?? "") \(appleIDCredential.fullName?.familyName ?? "")"
                let user = User(email: authResult?.user.email, name: userName)
                
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = userName
                changeRequest?.commitChanges { (error) in
                }
                self.presenter.logUserIn(user: user)
            }
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Handle error.
        print("Sign in with Apple errored: \(error)")
    }
    
}

@available(iOS 13.0, *)
extension UserLoginRegisterSceneViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: Array<Character> =
            Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length
        
        while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
                }
                return random
            }
            
            randoms.forEach { random in
                if remainingLength == 0 {
                    return
                }
                
                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        
        return result
    }
}

