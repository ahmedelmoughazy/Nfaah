//
//  HomeProtocols.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/1/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation

protocol HomeModelProtocol: BaseModelProtocol {

}

protocol HomePresenterProtocol: BasePresenterProtocol {

}

protocol HomeViewProtocol: BaseViewProtocol {

}
protocol HomeVCDelegate: class {
    func dismissView()
}
