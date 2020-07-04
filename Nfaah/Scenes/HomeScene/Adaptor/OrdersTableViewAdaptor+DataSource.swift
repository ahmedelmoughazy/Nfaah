//
//  OrdersTableViewAdaptor+DataSource.swift
//  Nfaah
//
//  Created by Ahmed Refaat on 7/4/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation
import UIKit

extension OrdersTableViewAdaptor: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier:
            OrderTableViewCell.identifier,
            for: indexPath) as? OrderTableViewCell else { return UITableViewCell() }
        if let item = list?[indexPath.row] {
            cell.configureCell(item: item)
        }
        
        return cell
    }
}
