//
//  BusTime.swift
//  BusSeconds
//
//  Created by Hiroaki-Hirabayashi on 2022/01/03.
//

import Foundation

let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.calendar = Calendar(identifier: .gregorian)
    return dateFormatter
}()

struct BusTime {
    let hour: Int
    let minutes: Int
    
    /// 今日の年月日 + 時刻表の何時何分の差分を返す
    func intervalSinceNow() -> Double {
        return toDate()?.timeIntervalSinceNow ?? 0
    }
    
    /// 今日の年月日取得 + 時刻表の何時何分
    func toDate() -> Date? {
        let date = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        let manth = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        
        let dateString = "\(year)/\(manth)/\(day) \(hour):\(minutes):00"
        let baseDate = dateFormatter.date(from: dateString)
    
        return baseDate
    }
}

extension BusTime: CustomStringConvertible {
    var description: String {
        return "\(hour):\(minutes)"
    }
}
