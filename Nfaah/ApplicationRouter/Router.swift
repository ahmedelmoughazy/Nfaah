//
//  Router.swift
//  Nfaah
//
//  Created by Ahmed Refaat on 7/1/20.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation

import UIKit

protocol Router {
    
    var navigationController: UINavigationController { get }
    var rootViewController: UIViewController? { get }
    func present(_ module: Showable, animated: Bool)
    func push(_ module: Showable, animated: Bool, completion: (() -> Void)?)
    func pop(animated: Bool)
    func dismissModule(animated: Bool, completion: (() -> Void)?)
}
