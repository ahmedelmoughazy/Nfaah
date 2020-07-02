//
//  ProfileItemTableViewCell.swift
//  Nfaah
//
//  Created by Ahmed Refaat on 7/2/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import UIKit

class ProfileItemTableViewCell: UITableViewCell {

    @IBOutlet weak private var cellImage: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var subtitleLabel: UILabel!

    override func awakeFromNib() {
        
        super.awakeFromNib()
        self.setupView()
        
    }
    
    func setupView () {
        
        self.titleLabel.font = FontFamily._29LTAzer.regular.font(size: 14)
        self.subtitleLabel.font = FontFamily._29LTAzer.regular.font(size: 12)
        
    }
    
    func configureCell(item: ProfileItem) {
        self.titleLabel.text = item.title
        self.subtitleLabel.text = item.subTitle
        self.cellImage.image = UIImage(named: item.image)
    }
    
}
