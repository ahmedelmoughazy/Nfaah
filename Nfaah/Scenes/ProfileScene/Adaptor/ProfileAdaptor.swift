//
//  SettingsAdaptor.swift
//  Monshaat_SMEOwner_IOS
//
//  Created by Ahmed on 12/26/19.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import UIKit

class ProfileAdaptor: NSObject {
    
    private var tableView: UITableView?
    private var items: [ProfileItem] = []
    
    func add(items: [ProfileItem]) {
        
        self.items = items
        self.tableView?.reloadData()
        
    }
    
    func setAdaptorTableView(tableView: UITableView) {
        
        self.tableView = tableView
        
    }

    func count() -> Int {
        
        return items.count
        
    }
    
    func getItem(at index: Int) -> ProfileItem? {
        
        guard index < self.items.count else { return nil }
        return items[index]
        
    }
    
}
