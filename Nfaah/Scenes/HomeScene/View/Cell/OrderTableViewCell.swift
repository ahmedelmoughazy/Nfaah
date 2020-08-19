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
        dateLabel.font = FontFamily._29LTAzer.regular.font(size: 16)
        statusLabel.font = FontFamily._29LTAzer.regular.font(size: 16)
        orderLabel.font = FontFamily._29LTAzer.medium.font(size: 17)
        addressLabel.font = FontFamily._29LTAzer.regular.font(size: 18)
        orderImage.setCornerRadious(radious: orderImage.frame.height / 2, hasShadow: true)
        orderImageBackgrounView.setCornerRadious(radious: orderImageBackgrounView.frame.height / 2, hasShadow: false)
        orderView.setCornerRadious(radious: 10, hasShadow: true)
        orderView.layer.borderWidth = 1
        orderView.layer.borderColor = UIColor.lightGray.cgColor
        orderImageBackgrounView.layer.borderWidth = 1
        orderImageBackgrounView.layer.borderColor = UIColor.lightGray.cgColor
        background.setCornerRadious(radious: 10, hasShadow: true)
    }
    
    func configureCell(item: Order) {
        self.dateLabel.text = String(item.date?.prefix(16) ?? "")
        self.statusLabel.text = item.status
        self.orderLabel.text = item.order
        let userLocation = CLLocation(latitude: item.latitude ?? 0.0, longitude: item.longitude ?? 0.0)
        CLGeocoder().reverseGeocodeLocation(userLocation, preferredLocale: nil) { [weak self] (placemark, error) in
            guard let self = self else { return }
            if let pm = placemark?.first {
                self.addressLabel.text = pm.name
            }
        }
        let reference = Storage.storage().reference(withPath: "Orders/\(item.orderId ?? "")")
        reference.getData(maxSize: 15 * 1024 * 1024) { (data, error) -> Void in
            if error == nil {
                self.orderImage.image = UIImage(data: data!)
            }
        }
    }
}
