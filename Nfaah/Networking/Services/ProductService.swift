//
//  ProductService.swift
//  Nfaah
//
//  Created by Ahmed Refaat on 7/1/20.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation
import Moya

enum ApiServices {
    case login(accessToken: String)
}

extension ApiServices: TargetType {

    var baseURL: URL {
        return URL(string: NetworkManager.shared.networkConfig.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .login:
            return "/api/login"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login:
            return .post
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .login:
            return .requestParameters(
                parameters: [:],
                encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .login:
            return nil
        }
    }
}

extension ApiServices: MoyaCacheable {
    var cachePolicy: MoyaCacheablePolicy {
        return .reloadIgnoringCacheData
    }
}

extension ApiServices: AccessTokenAuthorizable {
    
    var authorizationType: AuthorizationType? {
        switch self {
        case .login:
            return nil
        default:
            return .bearer
        }
    }
}
