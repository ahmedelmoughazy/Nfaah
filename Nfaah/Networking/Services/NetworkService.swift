//
//  NetworkService.swift
//  Nfaah
//
//  Created by Ahmed Refaat on 7/1/20.
//  Copyright © 2019 Ibtikar. All rights reserved.
//
import Foundation
import Moya

extension NetworkManager {
    
    func callApi(target: TargetType, completion: @escaping (
        _ result: Swift.Result<Data, NetworkError>,
        _ statusCode: StatusCode?
        ) -> Void) {
        
    }
}
