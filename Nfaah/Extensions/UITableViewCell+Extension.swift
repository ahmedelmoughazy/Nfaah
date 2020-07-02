//
//  UITableViewCell+Extension.swift
//  Nfaah
//
//  Created by Ahmed Refaat on 7/2/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import UIKit

extension UITableViewCell {
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
}
