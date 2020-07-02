//
//  AppDelegate+Extension.swift
//  Nfaah
//
//  Created by Ahmed Refaat on 7/1/20.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation
import UIKit

extension AppDelegate {
    
    func intialNetworking() {
        NetworkManager.shared = NetworkManager(config: NetworkDefaults())
        NetworkManager.shared.applicationCoordinator = self.applicationCoordinator
    }

}
