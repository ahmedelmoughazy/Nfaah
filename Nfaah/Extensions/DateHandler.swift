//
//  DateHandler.swift
//  Nfaah
//
//  Created by Ahmed Refaat on 7/1/20.
//  Copyright © 2019 Ibtikar. All rights reserved.
//

import Foundation

class DateHandler {
    
    static private var dateFormatter = DateFormatter()
    
    class func createDateTimeKSA(timestamp: TimeStamp) -> String {
        var strDate = ""
        let unixTime = Double(timestamp)
        let date = Date(timeIntervalSince1970: unixTime)
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Riyadh") //Set timezone that you want
        dateFormatter.locale = Locale(identifier: "en")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" //Specify your format that you want
        strDate = dateFormatter.string(from: date)
        
        return strDate
    }
    
    class func createDateTimeKSADate(timestamp: TimeStamp) -> Date? {
        convertToDate(date: createDateTimeKSA(timestamp: timestamp))
    }
    
//    class func createDateTimeKSA(timestamp: String) -> String {
//        var strDate = ""
//        guard let unixTime = Double(timestamp) else { return "not valid" }
//        let date = Date(timeIntervalSince1970: unixTime)
//        dateFormatter.timeZone = TimeZone(abbreviation: "Asia/Riyadh") //Set timezone that you want
//        dateFormatter.locale = Locale(identifier: "en")
//        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" //Specify your format that you want
//        strDate = dateFormatter.string(from: date)
//        
//        return strDate
//    }
    
    class func createDateTime(timestamp: String) -> Date {
        //        var strDate = "undefined"
        
        if let unixTime = Double(timestamp) {
            let date = Date(timeIntervalSince1970: unixTime)
            //            let timezone = TimeZone.current.abbreviation() ?? "CET"  // get current TimeZone abbreviation or set to CET
            //            dateFormatter.timeZone = TimeZone(abbreviation: timezone) //Set timezone that you want
            //            dateFormatter.locale = NSLocale.current
            //            dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss" //Specify your format that you want
            //           strDate = dateFormatter.string(from: date)
            
            return date
        }
        
        return Date()
    }
    
    class func getCurrentKSATime() -> Date {
        dateFormatter.timeZone = TimeZone(abbreviation: "Asia/Riyadh") //Set timezone that you want
        dateFormatter.locale = Locale(identifier: "en")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" //Specify your format that you want
        let strDate = dateFormatter.string(from: Date())
        if let date = convertToDate(date: strDate) {
            return date
        }
        return Date()
    }
    
    class func convertToDate(date: String) -> Date? {
        self.dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        self.dateFormatter.locale = Locale(identifier: "en")
        self.dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        guard let currentDate = self.dateFormatter.date(from: date) else { return nil }
        return currentDate
    }
    
    class func convertToString(date: Date) -> String {
        self.dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        self.dateFormatter.locale = Locale(identifier: "en")
        self.dateFormatter.timeZone = TimeZone(secondsFromGMT: 3)
        
        return self.dateFormatter.string(from: date)
    }
    
    class func trimDateStringToDateOnly(date: String) -> String? {
        self.dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        self.dateFormatter.locale = Locale(identifier: "en")
        self.dateFormatter.timeZone = TimeZone(secondsFromGMT: 3)
        
        guard let currentDate = self.dateFormatter.date(from: date) else { return nil }
        self.dateFormatter.timeStyle = DateFormatter.Style.none
        self.dateFormatter.dateStyle = DateFormatter.Style.short
        self.dateFormatter.dateFormat = "yyyy-MM-dd";
        
        return self.dateFormatter.string(from: currentDate)
    }
    
    class func trimDateStringToTimeOnly(date: String) -> String? {
        self.dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        self.dateFormatter.locale = Locale(identifier: "en")
        self.dateFormatter.timeZone = TimeZone(secondsFromGMT: 3)
        
        guard let currentTime = self.dateFormatter.date(from: date) else { return nil }
        self.dateFormatter.dateFormat = "hh:mm a";
        self.dateFormatter.timeStyle = DateFormatter.Style.short
        self.dateFormatter.dateStyle = DateFormatter.Style.none
        self.dateFormatter.locale = Locale(identifier: "ar")
        
        return self.dateFormatter.string(from: currentTime)
    }
    
    class func trimTime(date: String) -> String {
        self.dateFormatter.dateFormat = "yyyy-MM-dd  HH:mm:ss"
        guard let dateObject = self.dateFormatter.date(from: date) else { return "not valid date" }
        self.dateFormatter.dateFormat = "hh:mm a";
        self.dateFormatter.locale = Locale(identifier: "ar")
        
        return self.dateFormatter.string(from: dateObject)
    }
    
    class func trimTimeAMPM(date: String) -> String {
        self.dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let dateObject = self.dateFormatter.date(from: date) else { return "not valid date" }
        self.dateFormatter.dateFormat = "hh:mm a";
        self.dateFormatter.locale = Locale(identifier: "ar")
        
        return self.dateFormatter.string(from: dateObject)
    }
    
    class func trimTimeFomDate(date: String) -> String {
        self.dateFormatter.dateFormat = "yyyy-MM-dd  HH:mm:ss"
        guard let dateObject = self.dateFormatter.date(from: date) else { return "not valid date" }
        self.dateFormatter.dateFormat = "hh:mm a";
        self.dateFormatter.locale = Locale(identifier: "ar")
        
        return self.dateFormatter.string(from: dateObject)
    }
    
    class func concateTimeWithDate(time: String, date: String) -> String {
        guard let today = trimDateStringToDateOnly(date: date) else { return "not valid date" }
        
        return today+" "+time+":00"
    }
    class func dateWithDayandMonth(date: String) -> String {
        self.dateFormatter.dateFormat = "yyyy-MM-dd  HH:mm:ss"
        guard let dateObject = self.dateFormatter.date(from: date) else { return "not valid date" }
        self.dateFormatter.dateFormat = "EEEE ، dd MMM";
        self.dateFormatter.locale = Locale(identifier: "ar")
        return self.dateFormatter.string(from: dateObject)
    }
    class func trimDayFomDate(date: String) -> String {
        self.dateFormatter.dateFormat = "yyyy-MM-dd  HH:mm:ss"
        guard let dateObject = self.dateFormatter.date(from: date) else { return "not valid date" }
        self.dateFormatter.dateFormat = "dd";
        self.dateFormatter.locale = Locale(identifier: "ar")
        
        return self.dateFormatter.string(from: dateObject)
    }
    class func formatWithday(date: String) -> String {
        self.dateFormatter.dateFormat = "yyyy-MM-dd  HH:mm:ss"
        guard let dateObject = self.dateFormatter.date(from: date) else { return "not valid date" }
        self.dateFormatter.dateFormat = "EEEE ، hh:mm a";
        self.dateFormatter.locale = Locale(identifier: "ar")
        
        return self.dateFormatter.string(from: dateObject)
    }
    class func formatWithMonth(date: String) -> String {
        self.dateFormatter.dateFormat = "yyyy-MM-dd  HH:mm:ss"
        guard let dateObject = self.dateFormatter.date(from: date) else { return "not valid date" }
        self.dateFormatter.dateFormat = "dd-MM ، hh:mm a";
        self.dateFormatter.locale = Locale(identifier: "ar")
        
        return self.dateFormatter.string(from: dateObject)
    }
}
