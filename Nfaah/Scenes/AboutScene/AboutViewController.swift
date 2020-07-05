//
//  AboutViewController.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/5/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation
import UIKit

class AboutViewController: BaseViewController<AboutPresenter> {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var aboutLabel: UILabel!
    
    // MARK: - View controller lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
    }
}

// MARK: - IBActions
extension AboutViewController {
    @IBAction func closeAction(_ sender: UIButton) {
        presenter.dismissView()
    }
}

// MARK: - Private
extension AboutViewController {
    private func setUpView() {
        titleLabel.font = FontFamily._29LTAzer.medium.font(size: 17)
        titleLabel.text = L10n.Login.Screen.about
        
        let attributedString = NSMutableAttributedString(string: L10n.about)
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.lineSpacing = 5
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))

        aboutLabel.attributedText = attributedString
        aboutLabel.font = FontFamily._29LTAzer.medium.font(size: 17)
    }
}

// MARK: - Protocal
extension AboutViewController: AboutViewProtocol {
    
}
