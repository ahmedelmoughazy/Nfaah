//
//  BaseViewController.swift
//  Nfaah
//
//  Created by Ahmed Refaat on 7/1/20.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation
import UIKit
import Toast_Swift

class BaseViewController<Presenter: BasePresenterProtocol>: UIViewController, BaseViewProtocol {
    
    private var container: UIView = UIView()
    private var loadingView: UIView = UIView()
    private var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    var presenter: Presenter!
    
    public func setPresenter (presenter: Presenter) {
        self.presenter = presenter
    }
    
    func showLoading(allowNavigation: Bool) {
        container.frame = CGRect(x: 0,
                                 y: 0,
                                 width: UIScreen.main.bounds.width,
                                 height: UIScreen.main.bounds.height)
        container.center = CGPoint(x: UIScreen.main.bounds.width / 2,
                                   y: UIScreen.main.bounds.height / 2)
        container.backgroundColor = Asset.Colors.silverColor.color.withAlphaComponent(0.8)
        
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = CGPoint(x: UIScreen.main.bounds.width / 2,
                                     y: UIScreen.main.bounds.height / 2)
        loadingView.backgroundColor = .white
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0);
        activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        activityIndicator.color = Asset.Colors.bahamaBlue.color
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2,
                                           y: loadingView.frame.size.height / 2)
        activityIndicator.startAnimating()
        
        container.addSubview(loadingView)
        if #available(iOS 13.0, *) {
            UIApplication.shared.windows.last?.addSubview(container)
        } else {
            UIApplication.shared.keyWindow?.addSubview(container)
        }
        loadingView.addSubview(activityIndicator)
    }
    
    func showLoadingOnWindow(allowNavigation: Bool) {
        container.frame = CGRect(x: 0,
                                 y: 0,
                                 width: UIScreen.main.bounds.width,
                                 height: UIScreen.main.bounds.height)
        container.center = CGPoint(x: UIScreen.main.bounds.width / 2,
                                   y: UIScreen.main.bounds.height / 2)
        container.backgroundColor = Asset.Colors.silverColor.color.withAlphaComponent(0.8)
        
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = CGPoint(x: UIScreen.main.bounds.width / 2,
                                     y: UIScreen.main.bounds.height / 2)
        loadingView.backgroundColor = .white
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0);
        activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        activityIndicator.color = Asset.Colors.bahamaBlue.color
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2,
                                           y: loadingView.frame.size.height / 2)
        activityIndicator.startAnimating()
        
        container.addSubview(loadingView)
        self.view.addSubview(container)
        loadingView.addSubview(activityIndicator)
    }
    
    func hideLoading() {
        activityIndicator.stopAnimating()
        container.removeFromSuperview()
    }
    
    func showErrorMessage(errorMessage: String) {
        if #available(iOS 13.0, *) {
            UIApplication.shared.windows.last?.makeToast(errorMessage, duration: 1.0)
        } else {
            UIApplication.shared.keyWindow?.makeToast(errorMessage, duration: 1.0)
        }
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    var topDistance: CGFloat {
        return UIApplication.shared.statusBarFrame.size.height +
            (navigationController?.navigationBar.frame.height ?? 0.0)
        
    }
    
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
