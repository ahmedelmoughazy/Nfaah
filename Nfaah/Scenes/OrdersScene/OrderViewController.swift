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
    
    // MARK: - IBOutlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var newOrderButton: UIButton!

    // MARK: - View controller lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        setUpView()
    }
}

// MARK: - IBActions
extension OrderViewController {
    @IBAction func orderAction(_ sender: UIButton) {
        presenter.showNewOrder()
    }
}

// MARK: - Private
extension OrderViewController {
    private func setUpView() {
        titleLabel.font = FontFamily._29LTAzer.medium.font(size: 17)
        titleLabel.text = L10n.Order.Screen.Title.newOrder
        
        descriptionLabel.font = FontFamily._29LTAzer.regular.font(size: 16)
        descriptionLabel.text = L10n.Order.Screen.Description.newOrder
        
        newOrderButton.setTitle(L10n.Order.Screen.newOrder, for: .normal)
        newOrderButton.titleLabel?.font = FontFamily._29LTAzer.medium.font(size: 14)
        newOrderButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        newOrderButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        newOrderButton.layer.shadowOpacity = 1.0
        newOrderButton.layer.shadowRadius = 0.0
        newOrderButton.layer.masksToBounds = false
        newOrderButton.layer.cornerRadius = newOrderButton.frame.width / 3
    }
}

// MARK: - Protocal
extension OrderViewController: OrderViewProtocol {

}
