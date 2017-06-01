//
//  Date.swift
//  WeekCalendar
//
//  Created by vikram singh rajpoot on 01/06/17.
//  Copyright © 2017 vikram singh rajpoot. All rights reserved.
//

import Foundation

extension Date {
    
    func getWeekStartDate() -> Date? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
            var calendar = Calendar(identifier: .gregorian)
            calendar.firstWeekday = 3
            var startDate : Date = Date()
            var interval : TimeInterval = 0
            
            if calendar.dateInterval(of: .weekOfYear, start: &startDate, interval: &interval, for: self) {
                print("Start of week is \(startDate)")
                // prints "Start of week is 2017-01-01 06:00:00 +0000"
                return startDate
            }
        return nil
    }
    
    func getNextDay(value : Int) -> Date? {
        
        let dayComponenet = NSDateComponents()
        dayComponenet.day = value
        
        let theCalendar = NSCalendar.current
        let nextDate = theCalendar.date(byAdding: dayComponenet as DateComponents, to: self)
        return nextDate
        
    }
    
    func dayOfWeek() -> Int {
        var calendar = Calendar.current
        calendar.timeZone = NSTimeZone(name: "UTC")! as TimeZone
        let day = calendar.component(.day, from: self)
        return day
    }
    
    func monthOfWeek() -> Int {
        var calendar = Calendar.current
        calendar.timeZone = NSTimeZone(name: "UTC")! as TimeZone
        let month = calendar.component(.month, from: self)
        return month
    }
    
    func yearOfWeek() -> Int {
        var calendar = Calendar.current
        calendar.timeZone = NSTimeZone(name: "UTC")! as TimeZone
        let year = calendar.component(.year, from: self)
        return year
    }
    
    func fullDateToYear() -> (day : Int, month : Int, year : Int) {
        var calendar = Calendar.current
        calendar.timeZone = NSTimeZone(name: "UTC")! as TimeZone
        let day = calendar.component(.day, from: self)
        let month = calendar.component(.month, from: self)
        let year = calendar.component(.year, from: self)
        return (day, month, year)
    }
    
    func getMonthAndYear() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM, yyyy"
        dateFormatter.timeZone = NSTimeZone(name: "UTC")! as TimeZone
        let newDate = dateFormatter.string(from: self)
        return newDate
        
    }
    
    func getDateMonthYear() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd, MMMM, yyyy"
        dateFormatter.timeZone = NSTimeZone(name: "UTC")! as TimeZone
        let newDate = dateFormatter.string(from: self)
        return newDate
        
    }

    
    func getDayNameFromDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.dateFormat = "EE"
        let newDate = dateFormatter.string(from: self)
        return newDate
    }
    
    func getPreviousOrNextWeek(value : Int) -> Date? {
        
        let daysToAdd:Int = value
        // Set up date components
        let dateComponents: NSDateComponents = NSDateComponents()
        dateComponents.day = daysToAdd
        
        // Create a calendar
        let gregorianCalendar: NSCalendar = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!
        let previousWeekEndDate: Date? = gregorianCalendar.date(byAdding: dateComponents as DateComponents, to: self, options:NSCalendar.Options(rawValue: 0))!
        
        let weekStartDate = previousWeekEndDate?.getWeekStartDate()
        return weekStartDate
    }
}
