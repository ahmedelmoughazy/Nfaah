//
//  ProfilePresenter.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/1/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation
import StoreKit

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
            SKStoreReviewController.requestReview()
        case .share:
            if let vc = Other().share(title: "نفعة") {
                self.delegate?.share(vc: vc)
            }
        case .contactUs:
            delegate?.openWhatsappView(itemValue: "+9677377449960")
        case .about:
            delegate?.openAboutScreen()
        case .logOut:
            delegate?.logout()
        }
    }
    
    func showErrorMessage(error: String) {
        view.showErrorMessage?(errorMessage: error)
    }
}

class Other {
    
    func share(title: String) -> UIActivityViewController?
    {
        let message = title
        let image = Asset.Images.logo.image
        let objectsToShare = [message, image] as [Any]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
        return activityVC
    }
    
}
