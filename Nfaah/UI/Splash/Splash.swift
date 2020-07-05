//
//  Splash.swift
//  Nfaah
//
//  Created by Ahmed Refaat on 7/5/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import UIKit

class Splash: UIView {
    
    @IBOutlet private weak var logoView: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadViewFromNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func start() {
        logoView.alpha = 0.0
        
        UIView.animateKeyframes(withDuration: 1.5, delay: 0.0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.5, animations: {
                self.logoView.alpha = 1.0
            })
        }, completion: { _  in
            self.removeFromSuperview()
        })
    }

}
