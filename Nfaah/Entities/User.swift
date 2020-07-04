//
//  User.swift
//  Nfaah
//
//  Created by Ahmed Refaat on 7/4/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation
import FirebaseAuth

struct User: Dictionable {
    var email: String?
    var name: String?
    var orders: [Order]?
    var image: String?
    var phone: String?
    var uid: String?
    
    init(email: String?,
         name: String?,
         orders: [Order]? = [],
         image: String? = "",
         phone: String? = "",
         uid: String? = Auth.auth().currentUser?.uid) {
        
        self.email = email
        self.name = name
        self.orders = orders
        self.image = image
        self.phone = phone
        self.uid = uid
    }
}
