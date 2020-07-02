//
//  ProfileViewController.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/1/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewController: BaseViewController<ProfilePresenter> {
    
    // MARK: - Private Variables
    private var adaptor = ProfileAdaptor()

    // MARK: - IBOutlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var userImage: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var profileTableView: UITableView!

    // MARK: - View controller lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        setUpView()
        setupTableView()
        presenter.createProfileItems()
    }
}

// MARK: - IBActions
extension ProfileViewController {

}

// MARK: - Private
extension ProfileViewController {
    private func setUpView() {
        titleLabel.font = FontFamily._29LTAzer.medium.font(size: 17)
        titleLabel.text = L10n.Profile.Screen.title
        
        nameLabel.font = FontFamily._29LTAzer.medium.font(size: 17)
        nameLabel.text = L10n.Profile.Screen.title
        
        emailLabel.font = FontFamily._29LTAzer.medium.font(size: 17)
        emailLabel.text = L10n.Profile.Screen.title
        
        userImage.image = Asset.Images.profilePlaceholder.image
        userImage.layer.cornerRadius = userImage.frame.height / 2
        
        self.adaptor.setAdaptorTableView(tableView: self.profileTableView)

    }
    
    private func setupTableView() {
        
        self.profileTableView.tableFooterView = UIView()
        self.profileTableView.delegate = self
        self.profileTableView.dataSource = self.adaptor
        
        self.profileTableView.register(ProfileItemTableViewCell.nib,
                                       forCellReuseIdentifier: ProfileItemTableViewCell.identifier)
        
    }
}

// MARK: - Protocal
extension ProfileViewController: ProfileViewProtocol {
    func renderViewWith(items: [ProfileItem]) {
        adaptor.add(items: items)
    }
}

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.presenter.didSelect(atIndex: indexPath.row)
        
    }
    
}
