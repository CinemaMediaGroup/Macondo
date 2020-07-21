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
        print(path)
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
