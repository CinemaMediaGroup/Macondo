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
            
            Sqlite.addPost(cidd : Int64(YAMLs[6])!,title : YAMLs[0],text : YAMLs[7],thumbUrl : "",summary : YAMLs[5],category : YAMLs[3],tag : YAMLs[4],created : YAMLs[1],updated : YAMLs[2],language : language)
        } catch {
            print(error)
        }
    }
    
    static func importLinks(filePath : URL,language : String){
        do {
            let delta = try String(contentsOf: filePath, encoding: .utf8)
            let links = delta.components(separatedBy: .newlines)
            
            var j : Int64  = 0
            for i in links {
                let link = i.components(separatedBy: "|")
                Sqlite.addLink(lidd : j,name: link[0], url: link[1], image: link[2], description: link[3], language: language)
                j += 1
            }
            
        } catch {
            print(error)
        }
    }
    
    static func importBooks(filePath : URL,language : String){
        do {
            let delta = try String(contentsOf: filePath, encoding: .utf8)
            let books = delta.components(separatedBy: .newlines)
            
            var j : Int64  = 0
            for i in books {
                let book = i.components(separatedBy: "|")
                Sqlite.addBook(bidd: j, name: book[1], isbn: book[2], lsbn: book[3], image: book[0], language: language)
                j += 1
            }
            
        } catch {
            print(error)
        }
    }
    
    static func importAnimes(filePath : URL,language : String){
        do {
            let delta = try String(contentsOf: filePath, encoding: .utf8)
            let animes = delta.components(separatedBy: .newlines)
            
            var j : Int64  = 0
            for i in animes {
                let anime = i.components(separatedBy: "|")
                Sqlite.addAnime(aidd: j, nameJA: anime[1], nameZH: anime[2], image: anime[0], language: language)
                j += 1
            }
            
        } catch {
            print(error)
        }
    }
    
    static func importVideos(filePath : URL,language : String){
        do {
            let delta = try String(contentsOf: filePath, encoding: .utf8)
            let videos = delta.components(separatedBy: .newlines)
            
            var j : Int64  = 0
            for i in videos {
                let video = i.components(separatedBy: "|")
                Sqlite.addVideo(vidd: j, nameJA: video[1], nameZH: video[2], image: video[0], language: language)
                j += 1
            }
            
        } catch {
            print(error)
        }
    }
}
