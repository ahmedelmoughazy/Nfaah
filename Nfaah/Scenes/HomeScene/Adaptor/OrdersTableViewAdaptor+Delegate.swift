//
//  OrdersTableViewAdaptor+Delegate.swift
//  Nfaah
//
//  Created by Ahmed Refaat on 7/4/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation
import UIKit

// MARK: TableView Delegate
extension OrdersTableViewAdaptor: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedCell = tableView.cellForRow(at: indexPath) as? OrderTableViewCell {
            selectedCell.contentView.backgroundColor = .white
        }
    }
    
}
