//
//  HomeViewController.swift
//  Nfaah
//
//  Created Ahmed Refaat on 7/1/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import Foundation
import FirebaseAuth
import UIKit

class HomeViewController: BaseViewController<HomePresenter> {
    
    // MARK: - Private Variables
    private var adaptor = OrdersTableViewAdaptor()

    private var noDataView: UIView = {
        var noDataView = UIView(frame: UIScreen.main.bounds)
        let label = UILabel(frame: CGRect(x: 0, y: UIScreen.main.bounds.height / 3, width: 200, height: 24))
        label.text = L10n.Home.Screen.noOrders
        label.textColor = Asset.Colors.bahamaBlue.color
        label.textAlignment = .center
        label.font = FontFamily._29LTAzer.medium.font(size: 22)
        label.center.x = UIScreen.main.bounds.width / 2
        noDataView.addSubview(label)
        return noDataView
        
    }()
    
    // MARK: - IBOutlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var ordersTableView: UITableView!
    
    // MARK: - View controller lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if Auth.auth().currentUser != nil {
            self.presenter.getOrders()
        }
        
    }
}

// MARK: - IBActions
extension HomeViewController {
    
}

// MARK: - Private
extension HomeViewController {
    private func setUpView() {
        titleLabel.font = FontFamily._29LTAzer.medium.font(size: 22)
        titleLabel.text = L10n.Home.Screen.title
        
        ordersTableView.delegate = adaptor
        ordersTableView.dataSource = adaptor
        ordersTableView.rowHeight = UITableView.automaticDimension
        ordersTableView.separatorStyle = .none
        
        adaptor.setTableView(tableView: ordersTableView)
        adaptor.reloadData = ordersTableView.reloadData
        adaptor.showEmptyState = showEmptyState
        adaptor.removeEmptyState = hideEmptyState
    }
    
    private func showEmptyState() {
        ordersTableView.backgroundView = noDataView
    }
    
    private func hideEmptyState() {
        ordersTableView.backgroundView = nil
    }
}

// MARK: - Protocal
extension HomeViewController: HomeViewProtocol {
    func clearData() {
        adaptor.clear(reload: true)
    }
    
    func renderViewWithData(data: [Order]) {
        ordersTableView.backgroundColor = .clear
        adaptor.add(items: data)
    }
}
