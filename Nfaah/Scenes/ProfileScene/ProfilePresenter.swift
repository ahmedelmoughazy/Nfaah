//
//  ProfilePresenter.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/1/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation

class ProfilePresenter: BasePresenter, ProfilePresenterProtocol {
    
    private var view: ProfileViewProtocol
    private var model: ProfileModelProtocol
    weak var delegate: ProfileVCDelegate?

    init(view: ProfileViewProtocol, model: ProfileModelProtocol) {
        self.view = view
        self.model = model
    }

    func createProfileItems() {
        let items = model.createProfileItems()
        view.renderViewWith(items: items)
    }
    
    func didSelect(atIndex index: Int) {
        
        guard let selectedItem = self.model.getItem(atIndex: index) else { return }
        
        switch selectedItem.type {
        case .order:
            delegate?.showNewOrder()
        case .site:
            print("\(selectedItem.type)")
        case .rate:
            print("\(selectedItem.type)")
        case .share:
            print("\(selectedItem.type)")
        case .contactUs:
            print("\(selectedItem.type)")
        case .about:
            print("\(selectedItem.type)")
        case .logOut:
            delegate?.logout()
        }
    }
}
