//
//  ProfileProtocols.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/1/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation

protocol ProfileModelProtocol: BaseModelProtocol {
    func createProfileItems() -> [ProfileItem]
    func getItem(atIndex index: Int) -> ProfileItem?
}

protocol ProfilePresenterProtocol: BasePresenterProtocol {

}

protocol ProfileViewProtocol: BaseViewProtocol {
    func renderViewWith(items: [ProfileItem])
}

protocol ProfileVCDelegate: class {
    func openWhatsappView(itemValue: String)
    func openAboutScreen()
    func showNewOrder()
    func dismissView()
    func logout()
}
