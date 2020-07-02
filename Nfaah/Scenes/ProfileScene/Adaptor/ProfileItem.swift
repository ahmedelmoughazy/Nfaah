//
//  ProfileItem.swift
//  Nfaah
//
//  Created by Ahmed Refaat on 7/2/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation

enum ProfileItemType {
    
    case order
    case site
    case rate
    case share
    case contactUs
    case about
    case logOut
}

struct ProfileItem {
    
    var image: String
    var title: String
    var subTitle: String?
    var type: ProfileItemType
    
    init(image: String, title: String, subTitle: String?, type: ProfileItemType) {
        
        self.image = image
        self.title = title
        self.subTitle = subTitle
        self.type = type
        
    }

}
