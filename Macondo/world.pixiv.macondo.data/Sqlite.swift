//
//  Sqlite.swift
//  Macondo
//
//  Created by Louis Joe Shen on 2020/7/20.
//  Copyright © 2020 Louise Joe Shen. All rights reserved.
//

import Foundation
import SQLite

struct Sqlite {
    static func createTables(){
        var database : Connection
        let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first! + "/" + Bundle.main.bundleIdentifier!
        print("Database folder: " +  path)
        do{
            //create parent directory iff it doesn’t exist
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)

            //open database
            database = try Connection("\(path)/blog.db")
        
            //postDatas table
            let pd = Table("postDatas")
            
            //postDatas columns settings
            let cid = Expression<Int64>("cid")
            let pdType = Expression<Int64>("type")
            let pdTitle = Expression<String>("title")
            let pdSlug = Expression<String>("slug")
            let pdCreated = Expression<String>("created")
            let pdModified = Expression<String>("modified")
            let pdText = Expression<String>("text")
            let pdThumbUrl = Expression<String>("thumbUrl")
            let pdSummary = Expression<String>("summary")
            let pdCategory = Expression<String>("category")
            let pdTag = Expression<String>("tag")
        
            //create postDatas table
            try database.run(pd.create{t in
                t.column(cid,primaryKey: true)
                t.column(pdType)
                t.column(pdTitle)
                t.column(pdSlug)
                t.column(pdCreated)
                t.column(pdModified)
                t.column(pdText)
                t.column(pdThumbUrl)
                t.column(pdSummary)
                t.column(pdCategory)
                t.column(pdTag)
            })
            
            //metaDatas table
            let md = Table("metaDatas")
            
            //metaDatas columns settings
            let mid = Expression<Int64>("mid")
            let mdCnt = Expression<Int64>("cnt")
            let mdType = Expression<String>("type")
            let mdSlug = Expression<String>("slug")
            let mdName = Expression<String>("name")
            
            //create metaDatas table
            try database.run(md.create{t in
                t.column(mid,primaryKey: true)
                t.column(mdCnt)
                t.column(mdType)
                t.column(mdSlug)
                t.column(mdName)
            })
            
            //linksDatas table
            let ld = Table("linksDatas")
            
            //linksDatas columns settings
            let lid = Expression<Int64>("lid")
            let ldOrders = Expression<Int64>("orders")
            let ldName = Expression<String>("name")
            let ldUrl = Expression<String>("url")
            let ldSort = Expression<String>("sort")
            let ldImage = Expression<String>("image")
            let ldDescription = Expression<String>("description")
            
            //create linksDatas table
            try database.run(ld.create{t in
                t.column(lid,primaryKey: true)
                t.column(ldOrders)
                t.column(ldName)
                t.column(ldUrl)
                t.column(ldSort)
                t.column(ldImage)
                t.column(ldDescription)
            })
            
            //animeDatas table
            let ad = Table("animeDatas")
            
            //animeDatas columns settings
            let aid = Expression<Int64>("aid")
            let adNameJA = Expression<String>("nameJA")
            let adNameZH = Expression<String>("nameZH")
            let adImage = Expression<String>("image")
            
            //create animeDatas table
            try database.run(ad.create{t in
                t.column(aid,primaryKey: true)
                t.column(adNameJA)
                t.column(adNameZH)
                t.column(adImage)
            })
            
            //videoDatas table
            let vd = Table("videoDatas")
            
            //videoDatas columns settings
            let vid = Expression<Int64>("vid")
            let vdNameJA = Expression<String>("nameJA")
            let vdNameZH = Expression<String>("nameZH")
            let vdImage = Expression<String>("image")
            
            //create animeDatas table
            try database.run(vd.create{t in
                t.column(vid,primaryKey: true)
                t.column(vdNameJA)
                t.column(vdNameZH)
                t.column(vdImage)
            })
            
            //bookDatas table
            let bd = Table("bookDatas")
            
            //bookDatas columns settings
            let bid = Expression<Int64>("bid")
            let bdName = Expression<String>("name")
            let bdIsbn = Expression<String>("isbn")
            let bdLsbn = Expression<String>("lsbn")
            let bdImage = Expression<String>("image")
            
            //create bookDatas table
            try database.run(bd.create{t in
                t.column(bid,primaryKey: true)
                t.column(bdName)
                t.column(bdIsbn)
                t.column(bdLsbn)
                t.column(bdImage)
            })
            
            //settingDatas table
            let sd = Table("settingDatas")
            
            //settingDatas columns settings
            let sid = Expression<Int64>("sid")
            let sdName = Expression<String>("name")
            let sdField = Expression<String>("field")
            
            //create settingDatas table
            try database.run(sd.create{t in
                t.column(sid,primaryKey: true)
                t.column(sdName)
                t.column(sdField)
            })
            
        }catch{
            print(error)
        }
    }
    
    static func newPost(title : String,text : String,thumbUrl : String,summary : String,category : String,tag : String){
        var database : Connection
        let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first! + "/" + Bundle.main.bundleIdentifier!
        print("Database folder: " +  path)
        do{
            //create parent directory iff it doesn’t exist
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)

            //open database
            database = try Connection("\(path)/blog.db")
            
            //postDatas table
            let pd = Table("postDatas")
            
            //postDatas columns settings
            let cid = Expression<Int64>("cid")
            let pdType = Expression<Int64>("type")
            let pdTitle = Expression<String>("title")
            let pdSlug = Expression<String>("slug")
            let pdCreated = Expression<String>("created")
            let pdModified = Expression<String>("modified")
            let pdText = Expression<String>("text")
            let pdThumbUrl = Expression<String>("thumbUrl")
            let pdSummary = Expression<String>("summary")
            let pdCategory = Expression<String>("category")
            let pdTag = Expression<String>("tag")
            
            let maxCid : Int64 = Int64(try database.scalar(pd.count))
            
            try database.run(pd.insert(
                cid <- (maxCid + 1),
                pdType <- 0,
                pdTitle <- Base64.toBase64(s: title),
                pdSlug <- Base64.toBase64(s: title),
                pdCreated <- Base64.toBase64(s: Time.getTime()),
                pdModified <- Base64.toBase64(s: Time.getTime()),
                pdText <- text,//pdText <- Base64.toBase64(s: text))
                pdThumbUrl <- Base64.toBase64(s: thumbUrl),
                pdSummary <- Base64.toBase64(s: summary),
                pdCategory <- Base64.toBase64(s: category),
                pdTag <- Base64.toBase64(s: tag)
            ))
        }catch{
            print(error)
        }
    }
}

/*
 //
 //  File.swift
 //  Macondo
 //
 //  Created by Louis Joe Shen on 2020/7/20.
 //  Copyright © 2020 Louise Joe Shen. All rights reserved.
 //

 import Foundation

 struct File{
     static func createDatabaseFile() -> String{
         let dbName = "blog.db"
         let fileManager = FileManager.default
         var path = ""
         do{
             let url = try fileManager.url(for:.documentDirectory,in: .userDomainMask, appropriateFor: nil, create: false)
             path = url.appendingPathComponent(dbName).relativePath
             
             if !fileManager.fileExists(atPath: path){
                 fileManager.createFile(atPath: path, contents: nil, attributes: nil)
             }
         }catch{
             print(error)
         }
         return path
     }
     
     static func printPath(){
         let fileManager = FileManager.default
         do {
             let url = try fileManager.url(for:.documentDirectory,in: .userDomainMask, appropriateFor: nil, create: false)
             print(url)
         }catch{
             print(error)
         }

     }
     
     static func createDir(dirName : String){
         let foldername = dirName
          let fileManager = FileManager.default
          do {
              let url = try fileManager.url(for:.documentDirectory,in: .userDomainMask, appropriateFor: nil, create: false)
              let folder = url.appendingPathComponent(foldername)
              try fileManager.createDirectory(at:folder, withIntermediateDirectories: true)
          } catch {
             print(error)
          }
     }
 }

 */
