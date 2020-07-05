//
//  NewOrderModel.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/3/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation

class NewOrderModel: BaseModel, NewOrderModelProtocol {
    func add(order: Order, completion: @escaping (Bool) -> Void) {
        FireBaseService.shared.addToDataBase(order: order) { success in
            completion(success)
        }
    }
    
    func uploadImage(data: Data, name: String) {
        FireBaseService.shared.uploadImage(data: data, name: name)
    }
}
