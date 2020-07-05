//
//  NewOrderProtocols.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/3/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation

protocol NewOrderModelProtocol: BaseModelProtocol {
    func add(order: Order, completion: @escaping (Bool) -> Void)
    func uploadImage(data: Data, name: String)
}

protocol NewOrderPresenterProtocol: BasePresenterProtocol {

}

protocol NewOrderViewProtocol: BaseViewProtocol {

}
protocol NewOrderVCDelegate: class {
    func dismissView()
}
