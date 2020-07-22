//
//  Base64.swift
//  Macondo
//
//  Created by Louis Joe Shen on 2020/7/22.
//  Copyright © 2020 Louise Joe Shen. All rights reserved.
//

import Foundation

struct Base64{
    static func toBase64(s : String) -> String{
        let utf8EncodeData = s.data(using: String.Encoding.utf8, allowLossyConversion: true)
        let base64String = utf8EncodeData?.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: UInt(0)))
        return base64String!
    }
    
    static func toString(s : String) -> String{
        let base64Data = NSData(base64Encoded : s, options:NSData.Base64DecodingOptions(rawValue: 0))
        let stringWithDecode = NSString(data:base64Data! as Data, encoding:String.Encoding.utf8.rawValue)
        return stringWithDecode! as String
    }
}
