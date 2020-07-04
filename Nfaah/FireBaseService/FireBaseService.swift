//
//  FireBaseService.swift
//  Nfaah
//
//  Created by Ahmed Refaat on 7/4/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation
import Firebase

class FireBaseService {

    static let shared = FireBaseService()
    
    let databaseReference = Database.database().reference()
    
    func addToDataBase(user: User) {
        let userDataDictionary = user.toDict()
        databaseReference.child("Users").child(user.uid ?? "").setValue(userDataDictionary)
    }
    
    func addToDataBase(order: Order) {
        let orderDictionary = order.toDict()
        databaseReference.child("Orders").childByAutoId().setValue(orderDictionary)
    }
}
