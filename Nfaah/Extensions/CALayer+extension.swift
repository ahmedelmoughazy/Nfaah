//
//  CALayer+extension.swift
//  Nfaah
//
//  Created by Ahmed Refaat on 7/1/20.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation
import UIKit
extension CALayer {
    func setCornerRadius(radius: CGFloat, maskToBounds: Bool) {
        self.cornerRadius = radius
        self.masksToBounds = maskToBounds
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius,
                                                    height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.mask = mask
    }
    
    func modifyCornerRadius(radius: CGFloat) {
        self.cornerRadius = radius
        self.masksToBounds = true
    }
    
    func setShadow(opacity: Float, radius: CGFloat, shadowColor: CGColor) {
        self.shadowColor = shadowColor
        self.shadowOpacity = opacity
        self.shadowOffset = CGSize.zero
        self.shadowRadius = radius
        self.masksToBounds = false
    }
    
    func setBorder(borderColor: CGColor, width: CGFloat ) {
        self.borderColor = borderColor
        self.borderWidth = width
    }
}
