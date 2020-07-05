//
//  UserLoginRegisterSceneModel.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/2/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation

class UserLoginRegisterSceneModel: BaseModel, UserLoginRegisterSceneModelProtocol {
    
    func signIn(with user: User, completion: @escaping (Bool) -> Void) {
        FireBaseService.shared.addToDataBase(user: user) { success in
            completion(success)
        }
    }
}
