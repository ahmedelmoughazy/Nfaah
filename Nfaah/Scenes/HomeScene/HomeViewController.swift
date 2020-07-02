//
//  HomeViewController.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/1/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: BaseViewController<HomePresenter> {
    
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
extension HomeViewController {

}

// MARK: - Private
extension HomeViewController {
    private func setUpView() {
        titleLabel.font = FontFamily._29LTAzer.medium.font(size: 17)
        titleLabel.text = L10n.Home.Screen.title
    }
}

// MARK: - Protocal
extension HomeViewController: HomeViewProtocol {

}
