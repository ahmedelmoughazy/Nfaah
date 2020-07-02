//
//  OrderViewController.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/1/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation
import UIKit

class OrderViewController: BaseViewController<OrderPresenter> {
    
    // MARK: - Public Variables

    // MARK: - Private Variables

    // MARK: - Computed Variables

    // MARK: - IBOutlets
    @IBOutlet private weak var titleLabel: UILabel!
    // MARK: - Custom Setter

    // MARK: - View controller lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        setUpView()
    }
}

// MARK: - IBActions
extension OrderViewController {

}

// MARK: - Private
extension OrderViewController {
    private func setUpView() {
        titleLabel.font = FontFamily._29LTAzer.medium.font(size: 17)
        titleLabel.text = L10n.Order.Screen.Title.newOrder
    }
}

// MARK: - Protocal
extension OrderViewController: OrderViewProtocol {

}
