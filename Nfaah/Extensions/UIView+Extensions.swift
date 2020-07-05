//
//  UIView+Extensions.swift
//  Nfaah
//
//  Created by Ahmed Refaat on 7/1/20.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    func loadViewFromNib() {
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
        addSubview(view)
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func setCornerRadious(radious: CGFloat, hasShadow: Bool) {
        self.layer.cornerRadius = radious
        self.layer.masksToBounds = true
        
        self.clipsToBounds = false
        
        if !hasShadow { return }
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 3)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.4
    }
}
