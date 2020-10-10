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
}
