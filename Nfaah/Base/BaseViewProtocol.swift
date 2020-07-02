//
//  BaseViewProtocol.swift
//  Nfaah
//
//  Created by Ahmed Refaat on 7/1/20.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation
import UIKit
@objc
protocol BaseViewProtocol: ViewLoadable, ViewFetchable, ViewMessageable {
    
}

@objc
protocol ViewLoadable {
    
    // MARK: - Load Indicator
    @objc
    optional func showLoadingOnWindow(allowNavigation: Bool)
    @objc
    optional func showLoading(allowNavigation: Bool)
    @objc
    optional func hideLoading()
}

@objc
protocol ViewFetchable {
    
    // MARK: - Load Data
    @objc
    optional func loadDataSuccess(date: Any)
    @objc
    optional func loadDataFailed(with error: Error?)
    
    @objc
    optional func showErrorMassege(errorMessage: String)
}

extension ViewLoadable where Self: UIViewController {
    
    func showLoadingOnWindow(allowNavigation: Bool) {
        
    }
    
    func showLoading(allowNavigation: Bool) {
    
    }

    func hideLoading() {
        
    }
    
    func showErrorMassege(errorMessage: String) {
        
    }

}

@objc
protocol ViewMessageable {
    
    // MARK: - Load Indicator
    @objc
    optional func showSuccessMessage(title: String?, message: String?)
    @objc
    optional func showErrorMessage(title: String?, message: String?)
}
