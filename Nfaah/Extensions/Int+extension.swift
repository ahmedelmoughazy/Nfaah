//
//  Int+extension.swift
//  Nfaah
//
//  Created by Ahmed Refaat on 7/1/20.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation
extension Int {
    var asArabicNumber: String {
        //        let formatter = NumberFormatter()
        //        formatter.locale = Locale(identifier: "en")
        //        var localizedNumber = formatter.string(from: NSNumber(value: self))
//        let minNumber = 0
//        //if let number = Int(localizedNumber ?? "٠") {
//        let localizedNumber = String(format: "%02d:%02d", locale: Locale(identifier: "ar_SA"), self, minNumber)
        // }
     //   return localizedNumber
        let minNumber = 0
        let localizedNumber = String(format: "%d", locale: Locale(identifier: "ar_SA"), self, minNumber)
        return localizedNumber
    }
}

extension TimeStamp {
    func timeStampToDate() -> Date {
        return Date(timeIntervalSince1970: Double(self))
    }
    
    func createDateTime(format: String) -> String {
        var strDate = "undefined"
        let dateFormatter = DateFormatter()
        let unixTime = Double(self)
        let date = Date(timeIntervalSince1970: unixTime)
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Riyadh") //Set timezone that you want
        dateFormatter.locale = Locale(identifier: "ar")
        dateFormatter.dateFormat = format //Specify your format that you want
        strDate = dateFormatter.string(from: date)
        
        return strDate
    }
}
