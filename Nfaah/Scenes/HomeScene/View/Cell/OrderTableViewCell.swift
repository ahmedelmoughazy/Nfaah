//
//  OrderTableViewCell.swift
//  Nfaah
//
//  Created by Ahmed Refaat on 7/4/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpView()
    }
    
    func setUpView() {
        self.titleLabel.font = FontFamily._29LTAzer.medium.font(size: 18)
        self.subtitleLabel.font = FontFamily._29LTAzer.regular.font(size: 14)
    }
    
    func configureCell(item: Order) {
        self.titleLabel.text = item.order
        self.subtitleLabel.text = item.status
    }
    
}
