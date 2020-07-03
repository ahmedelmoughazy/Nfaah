//
//  ProfileModel.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/1/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation

class ProfileModel: BaseModel, ProfileModelProtocol {
    var profileItems = [ProfileItem]()
    
    func createProfileItems() -> [ProfileItem] {
        
        var profileItems = [ProfileItem]()
        
        let order = ProfileItem(image: Asset.Images.icCartUnselected.name,
                                title: L10n.Profile.Screen.TabTitle.newOrder,
                                subTitle: L10n.Profile.Screen.TabSubTitle.newOrder,
                                type: .order)
        
        let site = ProfileItem(image: Asset.Images.website.name,
                               title: L10n.Profile.Screen.TabTitle.ourSite,
                               subTitle: L10n.Profile.Screen.TabSubTitle.ourSite,
                               type: .site)
        
        let rate = ProfileItem(image: Asset.Images.rate.name,
                               title: L10n.Profile.Screen.TabTitle.rateUs,
                               subTitle: L10n.Profile.Screen.TabSubTitle.rateUs,
                               type: .rate)
        
        let share = ProfileItem(image: Asset.Images.share.name,
                                title: L10n.Profile.Screen.TabTitle.share,
                                subTitle: L10n.Profile.Screen.TabSubTitle.share,
                                type: .share)
        
        let contactUs = ProfileItem(image: Asset.Images.support.name,
                                    title: L10n.Profile.Screen.TabTitle.contactUs,
                                    subTitle: L10n.Profile.Screen.TabSubTitle.contactUs,
                                    type: .contactUs)
        
        let about = ProfileItem(image: Asset.Images.about.name,
                                title: L10n.Profile.Screen.TabTitle.about,
                                subTitle: L10n.Profile.Screen.TabSubTitle.about,
                                type: .about)
        
        let logOut = ProfileItem(image: Asset.Images.logout.name,
                                 title: L10n.Profile.Screen.TabTitle.logout,
                                 subTitle: L10n.Profile.Screen.TabSubTitle.logout,
                                 type: .logOut)
        
        profileItems = [order,
                        site,
                        rate,
                        share,
                        contactUs,
                        about,
                        logOut]
        self.profileItems = profileItems
        
        return profileItems
        
    }
    
    func getItem(atIndex index: Int) -> ProfileItem? {
        
        guard index < self.profileItems.count else { return nil }
        return self.profileItems[index]
        
    }
}
