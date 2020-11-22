//
//  Receiver.swift
//  Macondo
//
//  Created by Louis Shen on 2020/11/22.
//

import Foundation

struct Receiver{
    static func importPost(filePath : URL,language : String){
        do{
            var YAMLs : [String] = [String]();
            /* 0 title
             * 1 date
             * 2 update
             * 3 categories
             * 4 tags
             * 5 description
             * 6 urlname (aka cid)
             */
            
            var delta = try String(contentsOf: filePath, encoding: .utf8)
            
            var pattern = "title: .*"
            var regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
            var match = regex.matches(in: delta, options: .reportProgress, range: NSRange(location: 0, length: delta.count))
            for i in match {
                YAMLs.append((delta as NSString).substring(with: i.range))
                break
            }
            
            pattern = "date: .*"
            regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
            match = regex.matches(in: delta, options: .reportProgress, range: NSRange(location: 0, length: delta.count))
            for i in match {
                YAMLs.append((delta as NSString).substring(with: i.range))
                break
            }
            
            pattern = "updated: .*"
            regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
            match = regex.matches(in: delta, options: .reportProgress, range: NSRange(location: 0, length: delta.count))
            for i in match {
                YAMLs.append((delta as NSString).substring(with: i.range))
                break
            }
            
            pattern = "categories: .*"
            regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
            match = regex.matches(in: delta, options: .reportProgress, range: NSRange(location: 0, length: delta.count))
            for i in match {
                YAMLs.append((delta as NSString).substring(with: i.range))
                break
            }
            
            pattern = "tags: .*"
            regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
            match = regex.matches(in: delta, options: .reportProgress, range: NSRange(location: 0, length: delta.count))
            for i in match {
                YAMLs.append((delta as NSString).substring(with: i.range))
                break
            }
            
            pattern = "description: .*"
            regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
            match = regex.matches(in: delta, options: .reportProgress, range: NSRange(location: 0, length: delta.count))
            for i in match {
                YAMLs.append((delta as NSString).substring(with: i.range))
                break
            }
            
            pattern = "urlname: .*"
            regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
            match = regex.matches(in: delta, options: .reportProgress, range: NSRange(location: 0, length: delta.count))
            for i in match {
                YAMLs.append((delta as NSString).substring(with: i.range))
                break
            }
            
            YAMLs[0] = String(YAMLs[0][YAMLs[0].index(YAMLs[0].firstIndex(of: " ")!,offsetBy: 1)...])
            YAMLs[1] = String(YAMLs[1][YAMLs[1].index(YAMLs[1].firstIndex(of: " ")!,offsetBy: 1)...])
            YAMLs[2] = String(YAMLs[2][YAMLs[2].index(YAMLs[2].firstIndex(of: " ")!,offsetBy: 1)...])
            YAMLs[3] = String(YAMLs[3][YAMLs[3].index(YAMLs[3].firstIndex(of: "[")!,offsetBy: 1)...YAMLs[3].index(YAMLs[3].endIndex,offsetBy: -2)])
            YAMLs[4] = String(YAMLs[4][YAMLs[4].index(YAMLs[4].firstIndex(of: "[")!,offsetBy: 1)...YAMLs[4].index(YAMLs[4].endIndex,offsetBy: -2)])
            YAMLs[5] = String(YAMLs[5][YAMLs[5].index(YAMLs[5].firstIndex(of: " ")!,offsetBy: 1)...])
            YAMLs[6] = String(YAMLs[6][YAMLs[6].index(YAMLs[6].firstIndex(of: " ")!,offsetBy: 1)...])
            
            delta = String(delta[delta.index(delta.startIndex,offsetBy: 3)...])
            delta = String(delta[delta.range(of: "---")!.upperBound...])
            YAMLs.append(delta)
            
            Sqlite.addPost(cidd : Int64(YAMLs[6])!,title : YAMLs[0],text : YAMLs[7],thumbUrl : "",summary : YAMLs[5],category : YAMLs[3],tag : YAMLs[4],language : language)
        } catch {
            print(error)
        }
    }
    
    //private static func import
}
