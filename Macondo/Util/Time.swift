//
//  Time.swift
//  Macondo
//
//  Created by Louis Joe Shen on 2020/10/7.
//

import Foundation

struct Time{
    static func getTime() -> String{
        let now = Date()
        let dateFormatter  = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        return dateFormatter.string(from: now)
    }
    
    static func getFriendlyTime(_ time : String) -> String {
        //YYYY-MM-dd HH:mm:ss
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        
        let input = dateFormatter.date(from: time)
        
        let interval = now.timeIntervalSince1970 - input!.timeIntervalSince1970
        
        if interval < 86400 {
            dateFormatter.dateFormat = "HH:mm"
        } else if interval < 7 * 86400 {
            dateFormatter.dateFormat = "EEEE"
        } else {
            dateFormatter.dateFormat = "YY/MM/dd"
        }
        return dateFormatter.string(from: input!)
    }
}
