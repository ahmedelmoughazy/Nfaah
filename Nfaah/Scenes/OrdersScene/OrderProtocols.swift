//
//  OrderProtocols.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/1/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation

protocol OrderModelProtocol: BaseModelProtocol {

}

protocol OrderPresenterProtocol: BasePresenterProtocol {

}

protocol OrderViewProtocol: BaseViewProtocol {

}
protocol OrderVCDelegate: class {
    func dismissView()
}
