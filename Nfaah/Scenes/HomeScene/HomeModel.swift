//
//  HomeModel.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/1/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation

class HomeModel: BaseModel, HomeModelProtocol {
        func getOrders(completion: @escaping (_ result: Swift.Result<[Order], Error>) -> Void) {
        completion(.success([Order]()))
    }

}
