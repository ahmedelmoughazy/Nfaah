//
//  Date+Extensions.swift
//  Nfaah
//
//  Created by Ahmed Refaat on 7/1/20.
//  Copyright © 2020 Ibtikar. All rights reserved.
//

import Foundation

let SECOND = 1.0
let MINUTE = SECOND * 60.0
let HOUR = MINUTE * 60.0
let DAY = HOUR * 24.0
let WEEK = DAY * 7.0
let MONTH = DAY * 31.0
let YEAR = DAY * 365.24

extension Date {
    func formattedAsTimeAgo() -> String {
        //Now
        let now = DateHandler.getCurrentKSATime()
        
        let secondsSince = -self.timeIntervalSince(now)
        
        //Should never hit this but handle the future case
        if secondsSince < 0 {
            return "المستقبل"
        }
        
        // < 1 minute = "Just now"
        if secondsSince < MINUTE {
            return "الأن"
        }
        
        // < 1 hour = "x minutes ago"
        if secondsSince < HOUR {
            return self.formatMinutesAgo(secondsSince: secondsSince)
        }
        
        // Today = "x hours ago"
        if self.isSameDayAs(comparisonDate: now) {
            return self.formatAsToday(secondsSince: secondsSince)
        }
        
        // Yesterday = "Yesterday at 1:28 PM"
        if self.isYesterday(now: now) {
            return self.formatAsYesterday()
        }
        
        // < Last 7 days = "Friday at 1:48 AM"
        if self.isLastWeek(secondsSince: secondsSince) {
            return self.formatAsLastWeek()
        }
        
        // < Last 30 days = "March 30 at 1:14 PM"
        if self.isLastMonth(secondsSince: secondsSince) {
            return self.formatAsLastMonth()
        }
        // < 1 year = "September 15"
        if self.isLastYear(secondsSince: secondsSince) {
            return self.formatAsLastYear()
        }
        // Anything else = "September 9, 2011"
        return self.formatAsOther()
    }
    
    /*
     ========================== Date Comparison Methods ==========================
     */
    
    /*
     Is Same Day As
     Checks to see if the dates are the same calendar day
     */
    func isSameDayAs(comparisonDate: Date) -> Bool {
        //Check by matching the date strings
        let dateComparisonFormatter = DateFormatter()
        dateComparisonFormatter.dateFormat = "yyyy-MM-dd"
        
        //Return true if they are the same
        return dateComparisonFormatter.string(from: self) == dateComparisonFormatter.string(from: comparisonDate)
    }
    
    /*
     If the current date is yesterday relative to now
     Pasing in now to be more accurate (time shift during execution) in the calculations
     */
    func isYesterday(now: Date) -> Bool {
        return self.isSameDayAs(comparisonDate: now.dateBySubtractingDays(numDays: 1))
    }
    
    //From https://github.com/erica/NSDate-Extensions/blob/master/NSDate-Utilities.m
    func dateBySubtractingDays(numDays: Double) -> Date {
        let aTimeInterval = self.timeIntervalSinceReferenceDate + DAY * -numDays
        let newDate = Date(timeIntervalSinceReferenceDate: aTimeInterval)
        return newDate;
    }
    
    /*
     Is Last Week
     We want to know if the current date object is the first occurance of
     that day of the week (ie like the first friday before today
     - where we would colloquially say "last Friday")
     ( within 6 of the last days)
     
     TODO: make this more precise (1 week ago, if it is 7 days ago check the exact date)
     */
    func isLastWeek(secondsSince: TimeInterval) -> Bool {
        return secondsSince < WEEK
    }
    
    /*
     Is Last Month
     Previous 31 days?
     TODO: Validate on fb
     TODO: Make last day precise
     */
    func isLastMonth(secondsSince: TimeInterval) -> Bool {
        return secondsSince < MONTH
    }
    
    /*
     Is Last Year
     TODO: Make last day precise
     */
    func isLastYear(secondsSince: TimeInterval) -> Bool {
        return secondsSince < YEAR
    }
    
    /*
     =============================================================================
     */
    
    /*
     ========================== Formatting Methods ==========================
     */
    
    // < 1 hour = "x minutes ago"
    func formatMinutesAgo(secondsSince: TimeInterval) -> String {
        //Convert to minutes
        let minutesSince = Int(secondsSince / MINUTE)
        
        //Handle Plural
        if minutesSince == 1 {
            return "منذ دقيقه"
        } else if minutesSince == 2 {
            return "منذ دقيقتين"
        } else {
            return "منذ \(minutesSince) دقائق"
        }
    }
    
    // Today = "x hours ago"
    func formatAsToday(secondsSince: TimeInterval) -> String {
        //Convert to hours
        let hoursSince = Int(secondsSince / HOUR)
        
        //Handle Plural
        if hoursSince == 1 {
            return "منذ ساعه"
        } else if hoursSince == 2 {
            return "منذ ساعتين"
        } else {
            return "منذ \(hoursSince) ساعات"
        }
    }
    
    // Yesterday = "Yesterday at 1:28 PM"
    func formatAsYesterday() -> String {
        //Create date formatter
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        //Format
        dateFormatter.locale = Locale(identifier: "ar_EG")
        dateFormatter.amSymbol = "صباحاً"
        dateFormatter.pmSymbol = "مساءاً"
        dateFormatter.dateFormat = "h:mm a"
        return "أمس الساعة \(dateFormatter.string(from: self))"
    }
    
    // < Last 7 days = "Friday at 1:48 AM"
    func formatAsLastWeek() -> String {
        //Create date formatter
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        //Format
        dateFormatter.locale = Locale(identifier: "ar_EG")
        dateFormatter.amSymbol = "صباحاً"
        dateFormatter.pmSymbol = "مساءاً"
        dateFormatter.dateFormat = "EEEE, الساعة h:mm a"
        return dateFormatter.string(from: self)
    }
    
    // < Last 30 days = "March 30 at 1:14 PM"
    func formatAsLastMonth() -> String {
        //Create date formatter
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        //Format
        dateFormatter.locale = Locale(identifier: "ar_EG")
        dateFormatter.amSymbol = "صباحاً"
        dateFormatter.pmSymbol = "مساءاً"
        dateFormatter.dateFormat = "MMMM d, الساعة h:mm a"
        return dateFormatter.string(from: self)
    }
    
    // < 1 year = "September 15"
    func formatAsLastYear() -> String {
        //Create date formatter
        let dateFormatter = DateFormatter();
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        //Format
        dateFormatter.locale = Locale(identifier: "ar_EG")
        dateFormatter.dateFormat = "MMMM d"
        return dateFormatter.string(from: self)
    }
    
    // Anything else = "September 9, 2011"
    func formatAsOther() -> String {
        //Create date formatter
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        //Format
        dateFormatter.locale = Locale(identifier: "ar_EG")
        dateFormatter.dateFormat = "LLLL d, yyyy"
        return dateFormatter.string(from: self)
    }

}
