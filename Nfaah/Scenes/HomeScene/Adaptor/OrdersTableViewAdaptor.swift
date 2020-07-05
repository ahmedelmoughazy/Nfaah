//
//  OrdersTableViewAdaptor.swift
//  Nfaah
//
//  Created by Ahmed Refaat on 7/4/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation
import UIKit

class OrdersTableViewAdaptor: NSObject {
    
    var tableView: UITableView?
    var list: [Order]?
    var reloadData: (() -> Void)?
    var showEmptyState: (() -> Void)?
    var removeEmptyState: (() -> Void)?
    
    func setTableView(tableView: UITableView) {
        self.tableView = tableView
        self.tableView?.register(OrderTableViewCell.nib,
                                 forCellReuseIdentifier: OrderTableViewCell.identifier)
        
        self.reloadData?()
    }
    
    func count() -> Int {
        return list?.count ?? 0
    }
    
    func isLastIndex(index: IndexPath) -> Bool {
        return index.row == count()
    }
    
    func add(items: [Order]) {
        if list == nil {
            list = []
        }
        
        list?.append(contentsOf: items)
        
        if list?.isEmpty ?? true {
            showEmptyState?()
        } else {
            removeEmptyState?()
            reloadData?()
        }
    }
    
    func getItem(index: Int) -> Order? {
        return list?[index]
    }
    
    func getList() -> [Order]? {
        return list
        
    }
    
    func clear(reload: Bool) {
        switch reload {
        case true:
            list?.removeAll()
            reloadData?()
        default:
            list?.removeAll()
        }
    }
    
}
