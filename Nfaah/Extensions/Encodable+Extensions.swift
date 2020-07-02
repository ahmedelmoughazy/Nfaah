//
//  Encodable+Extensions.swift
//  Nfaah
//
//  Created by Ahmed Refaat on 7/1/20.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation

extension Encodable {
    func toJSONData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}

extension UserDefaults {
    func saveObject(object: Codable, forkey: String) {
        self.set(object.toJSONData(), forKey: forkey)
    }
    
    func getObject<T: Codable>(forKey: String) -> T? {
        if let data = self.object(forKey: forKey) as? Data {
            if let object = try? JSONDecoder().decode(T.self, from: data) {
                return object
            } else { return nil }
        } else {
            return nil
        }
    }
}

extension Encodable {
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
            else { throw NSError() }
        return dictionary
    }
}
