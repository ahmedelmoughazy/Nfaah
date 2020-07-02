//
//  NetworkDefaults.swift
//  Nfaah
//
//  Created by Ahmed Refaat on 7/1/20.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation

struct NetworkDefaults {
    var baseUrl: String = "" // root url
    var apiKey: String = ""
    var language: String = "en-US"
    static var `defaults` : NetworkDefaults {
        let instance = NetworkDefaults()
        return instance
    }
}
