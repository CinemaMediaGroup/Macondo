//
//  Time.swift
//  Macondo
//
//  Created by Louis Joe Shen on 2020/7/22.
//  Copyright © 2020 Louise Joe Shen. All rights reserved.
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
