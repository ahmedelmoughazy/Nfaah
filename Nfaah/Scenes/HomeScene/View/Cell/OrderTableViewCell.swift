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

        orderImage.layer.cornerRadius = orderImage.frame.height / 2
        orderImage.layer.masksToBounds = true
        orderImage.clipsToBounds = true

        orderImageBackgrounView.layer.cornerRadius = orderImage.frame.height / 2
        orderImageBackgrounView.layer.shadowColor = UIColor.darkGray.cgColor
        orderImageBackgrounView.layer.shadowOffset = CGSize(width: 1, height: 2)
        orderImageBackgrounView.layer.shadowRadius = 3
        orderImageBackgrounView.layer.shadowOpacity = 0.4

        orderView.setCornerRadious(radious: 10, hasShadow: true)

        background.setCornerRadious(radious: 10, hasShadow: true)
    }
    
    func configureCell(item: Order) {
        self.dateLabel.text = String(item.date?.prefix(16) ?? "")
        self.statusLabel.text = item.status
        self.orderLabel.text = "  " + (item.order ?? "")
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
            } else {
                self.orderImage.image = Asset.Images.placeholder.image
            }
        }
    }
}
