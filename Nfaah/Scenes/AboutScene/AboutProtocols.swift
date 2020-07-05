//
//  AboutProtocols.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/5/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation

protocol AboutModelProtocol: BaseModelProtocol {

}

protocol AboutPresenterProtocol: BasePresenterProtocol {

}

protocol AboutViewProtocol: BaseViewProtocol {

}
protocol AboutVCDelegate: class {
    func dismissView()
}
