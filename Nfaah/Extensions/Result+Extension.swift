//
//  Result+Extension.swift
//  Nfaah
//
//  Created by Ahmed Elmoughazy on 02.12.22.
//  Copyright © 2022 Nfaah. All rights reserved.
//

import Foundation

extension Result where Success == Void {
    public static var success: Result { .success(()) }
}
