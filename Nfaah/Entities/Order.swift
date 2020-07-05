//
//  Order.swift
//  Nfaah
//
//  Created by Ahmed Refaat on 7/4/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation
import FirebaseAuth

struct Order: Dictionable {
    var date: String?
    var latitude: Double?
    var longitude: Double?
    var name: String?
    var order: String?
    var orderId: String?
    var orderNum: String?
    var phone: String?
    var status: String?
    var uid: String? = Auth.auth().currentUser?.uid
}
