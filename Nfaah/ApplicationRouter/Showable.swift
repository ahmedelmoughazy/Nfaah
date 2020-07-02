//
//  Showable.swift
//  Nfaah
//
//  Created by Ahmed Refaat on 7/1/20.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation
import UIKit

protocol Showable {
    func toShowable() -> UIViewController
}

extension UIViewController: Showable {
    func toShowable() -> UIViewController {
        return self
    }
}
