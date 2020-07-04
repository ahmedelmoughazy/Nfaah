//
//  ProfileViewController.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/1/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation
import UIKit
import GoogleSignIn
import FirebaseAuth
import SDWebImage

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
           
        let user = Auth.auth().currentUser
        
        titleLabel.font = FontFamily._29LTAzer.medium.font(size: 17)
        titleLabel.text = L10n.Profile.Screen.title
        
        nameLabel.font = FontFamily._29LTAzer.medium.font(size: 17)
        nameLabel.text = user?.displayName
        
        emailLabel.font = FontFamily._29LTAzer.medium.font(size: 17)
        emailLabel.text = user?.email
        
        userImage.image = Asset.Images.profilePlaceholder.image
        userImage.layer.cornerRadius = userImage.frame.height / 2
        
        let stringUrl = (user?.photoURL?.absoluteString ?? "") + "?type=large"
        let photoUrl = URL(string: stringUrl.replacingOccurrences(of: "s96-c", with: "s240-c"))
        userImage.sd_setImage(with: photoUrl,
                              placeholderImage: Asset.Images.profilePlaceholder.image,
                              options: .scaleDownLargeImages, completed: nil)
        
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
