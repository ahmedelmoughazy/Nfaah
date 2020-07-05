//
//  OrderTableViewCell.swift
//  Nfaah
//
//  Created by Ahmed Refaat on 7/4/20.
//  Copyright © 2020 Nfaah. All rights reserved.
//

import UIKit
import CoreLocation
import FirebaseStorage

class OrderTableViewCell: UITableViewCell {
    
    @IBOutlet weak private var dateLabel: UILabel!
    @IBOutlet weak private var statusLabel: UILabel!
    @IBOutlet weak private var orderLabel: UILabel!
    @IBOutlet weak private var addressLabel: UILabel!
    @IBOutlet weak private var orderImage: UIImageView!
    @IBOutlet weak private var orderImageBackgrounView: UIView!
    @IBOutlet weak private var orderView: UIView!
    @IBOutlet weak private var background: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpView()
    }
    
    func setUpView() {
        self.dateLabel.font = FontFamily._29LTAzer.regular.font(size: 16)
        self.statusLabel.font = FontFamily._29LTAzer.regular.font(size: 16)
        self.orderLabel.font = FontFamily._29LTAzer.medium.font(size: 17)
        self.addressLabel.font = FontFamily._29LTAzer.regular.font(size: 18)
        
        orderImageBackgrounView.setCornerRadious(radious: orderImageBackgrounView.frame.height / 2, hasShadow: true)
        orderView.setCornerRadious(radious: 10, hasShadow: true)
        orderView.layer.borderWidth = 1
        orderView.layer.borderColor = UIColor.lightGray.cgColor
        background.setCornerRadious(radious: 10, hasShadow: true)
    }
    
    func configureCell(item: Order) {
        self.dateLabel.text = item.date
        self.statusLabel.text = item.status
        self.orderLabel.text = item.order
        
        let userLocation = CLLocation(latitude: item.latitude ?? 0.0, longitude: item.longitude ?? 0.0)
        CLGeocoder().reverseGeocodeLocation(userLocation, preferredLocale: nil) { (placemark, error) in
            if let pm = placemark?.first {
                self.addressLabel.text = pm.name
            }
        }
        
        let reference = Storage.storage().reference(withPath: "Orders/\(String(describing: item.orderId)).jpg")
        reference.getData(maxSize: 1 * 1024 * 1024) { (data, error) -> Void in
            if error == nil {
                self.orderImage.image = UIImage(data: data!)
            }
        }
    }
}
