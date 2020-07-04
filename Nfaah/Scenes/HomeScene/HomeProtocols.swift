//
//  HomeProtocols.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/1/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation

protocol HomeModelProtocol: BaseModelProtocol {
    func getOrders(completion: @escaping (_ result: Swift.Result<[Order], Error>) -> Void)
}

protocol HomePresenterProtocol: BasePresenterProtocol {

}

protocol HomeViewProtocol: BaseViewProtocol {
    func clearData()
    func renderViewWithData(data: [Order])
}
protocol HomeVCDelegate: class {
    func dismissView()
}
