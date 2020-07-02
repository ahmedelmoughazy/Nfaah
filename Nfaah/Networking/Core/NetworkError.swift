//
//  NetworkErrors.swift
//  Nfaah
//
//  Created by Ahmed Refaat on 7/1/20.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation
import Moya

enum `Type`:String, Codable {
    case business
    case system
    case mapping
}
struct NetworkError: Codable, Error {
   
    var code: Int?
    var message: String?
    var type: Type?
    var errorResponse: ErrorResponse?
 
    enum CodingKeys: String, CodingKey {
        
        case errorResponse = "error"
        case code = "status"
        
    }
    init () {
        
    }
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        errorResponse = try values.decodeIfPresent(ErrorResponse.self, forKey: .errorResponse)
        self.code = try values.decodeIfPresent(Int.self, forKey: .code)
        self.type = Type.mapping
        self.message = errorResponse?.message
        
    }
    
    init(error: MoyaError) {
        self.code = error.errorCode
        self.message = error.errorDescription

        switch error {
        case .underlying(let error, _):
            self.type = .system
            print(error)
        default :
            self.type = .mapping
        }
    }
}

extension NetworkError {
    static let parseError: NetworkError = {
        var error = NetworkError()
        error.type = Type.mapping
        return error
    }()
}

struct ErrorResponse: Codable {

    let message: String?

    enum CodingKeys: String, CodingKey {
        case message
    }
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        
    }

}
