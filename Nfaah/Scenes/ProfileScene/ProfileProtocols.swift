//
//  ProfileProtocols.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/1/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import UIKit

protocol ProfileModelProtocol: BaseModelProtocol {
    func createProfileItems() -> [ProfileItem]
    func getItem(atIndex index: Int) -> ProfileItem?
    func deleteUserAccount(user: User, completion: @escaping (Result<Void, Error>) -> Void)
}

protocol ProfilePresenterProtocol: BasePresenterProtocol {
    
}

protocol ProfileViewProtocol: BaseViewProtocol {
    func renderViewWith(items: [ProfileItem])
    func presentAlertView()
}

protocol ProfileVCDelegate: AnyObject {
    func openWhatsappView(itemValue: String)
    func openAboutScreen()
    func showNewOrder()
    func dismissView()
    func deleteAccount()
    func logout()
    func share(vc: UIActivityViewController)
}
