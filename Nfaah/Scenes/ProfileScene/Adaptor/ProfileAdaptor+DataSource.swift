//
//  SettingsAdaptor+DataSource.swift
//  Monshaat_SMEOwner_IOS
//
//  Created by Ahmed on 12/26/19.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import UIKit

extension ProfileAdaptor: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.count()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView
            .dequeueReusableCell(withIdentifier: ProfileItemTableViewCell.identifier,
                                 for: indexPath) as? ProfileItemTableViewCell else {
                                    
                                    return UITableViewCell()
                                    
        }
        
        if let item = self.getItem(at: indexPath.row) {
            cell.configureCell(item: item)
        }
        
        return cell
        
    }
    
}
