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
            let mdType = Expression<Int64>("type")
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
            
            //insert default raws
            try database.run(sd.insert(
                sid <- 1,
                sdName <- Base64.toBase64(s: "SiteTitle"),
                sdField <- Base64.toBase64(s: "Macondo")))
            try database.run(sd.insert(
                sid <- 2,
                sdName <- Base64.toBase64(s: "SiteURL"),
                sdField <- Base64.toBase64(s: "https://")))
            try database.run(sd.insert(
                sid <- 3,
                sdName <- Base64.toBase64(s: "TopPosts"),
                sdField <- Base64.toBase64(s: "1,2")))
            try database.run(sd.insert(
                sid <- 4,
                sdName <- Base64.toBase64(s: "User"),
                sdField <- Base64.toBase64(s: "root")))
            
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
                pdText <- Base64.toBase64(s: text),
                pdThumbUrl <- Base64.toBase64(s: thumbUrl),
                pdSummary <- Base64.toBase64(s: summary),
                pdCategory <- Base64.toBase64(s: category),
                pdTag <- Base64.toBase64(s: tag)
            ))
        }catch{
            print(error)
        }
    }
    
    static func editPost(cidd : Int,title : String,text : String,thumbUrl : String,summary : String,category : String,tag : String){
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
            let pdTitle = Expression<String>("title")
            let pdSlug = Expression<String>("slug")
            let pdModified = Expression<String>("modified")
            let pdText = Expression<String>("text")
            let pdThumbUrl = Expression<String>("thumbUrl")
            let pdSummary = Expression<String>("summary")
            let pdCategory = Expression<String>("category")
            let pdTag = Expression<String>("tag")
            
            let curCid = cidd
            let curPd = pd.filter(cid == Int64(curCid))
            
            try database.run(curPd.update(
                pdTitle <- Base64.toBase64(s: title),
                pdSlug <- Base64.toBase64(s: title),
                pdModified <- Base64.toBase64(s: Time.getTime()),
                pdText <- Base64.toBase64(s: text),
                pdThumbUrl <- Base64.toBase64(s: thumbUrl),
                pdSummary <- Base64.toBase64(s: summary),
                pdCategory <- Base64.toBase64(s: category),
                pdTag <- Base64.toBase64(s: tag)
            ))
        }catch{
            print(error)
        }
    }
    
    static func getPostList() -> [PostData]{
        var res : [PostData] = [PostData]()
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
            
            for pds in try database.prepare(pd){
                if Int(pds[pdType]) == 1{
                    continue
                }
                res.append(PostData(cid: Int(pds[cid]), type: Int(pds[pdType]),
                                    title: Base64.toString(s: pds[pdTitle]),
                                    slug: Base64.toString(s: pds[pdSlug]),
                                    created: Base64.toString(s: pds[pdCreated]),
                                    modified: Base64.toString(s: pds[pdModified]),
                                    text: Base64.toString(s: pds[pdText]),
                                    thumbUrl: Base64.toString(s: pds[pdThumbUrl]),
                                    summary: Base64.toString(s: pds[pdSummary]),
                                    category: Base64.toString(s: pds[pdCategory]),
                                    tag: Base64.toString(s: pds[pdTag])))
            }
        }catch{
            print(error)
        }
        
        return res
    }
    
    static func getPostData(cidd : Int) -> PostData{
        var res : PostData = PostData()
        
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
            
            for pds in try database.prepare(pd){
                if Int(pds[cid]) != cidd{
                    continue
                }
                res = PostData(cid: Int(pds[cid]), type: Int(pds[pdType]),
                                    title: Base64.toString(s: pds[pdTitle]),
                                    slug: Base64.toString(s: pds[pdSlug]),
                                    created: Base64.toString(s: pds[pdCreated]),
                                    modified: Base64.toString(s: pds[pdModified]),
                                    text: Base64.toString(s: pds[pdText]),
                                    thumbUrl: Base64.toString(s: pds[pdThumbUrl]),
                                    summary: Base64.toString(s: pds[pdSummary]),
                                    category: Base64.toString(s: pds[pdCategory]),
                                    tag: Base64.toString(s: pds[pdTag]))
            }
        }catch{
            print(error)
        }
        return res
    }
    
    static func newPage(title : String,text : String,thumbUrl : String,summary : String,category : String,tag : String){
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
                pdType <- Int64(1),
                pdTitle <- Base64.toBase64(s: title),
                pdSlug <- Base64.toBase64(s: title),
                pdCreated <- Base64.toBase64(s: Time.getTime()),
                pdModified <- Base64.toBase64(s: Time.getTime()),
                pdText <- Base64.toBase64(s: text),
                pdThumbUrl <- Base64.toBase64(s: thumbUrl),
                pdSummary <- Base64.toBase64(s: summary),
                pdCategory <- Base64.toBase64(s: category),
                pdTag <- Base64.toBase64(s: tag)
            ))
        }catch{
            print(error)
        }
    }
    
    static func getPageList() -> [PostData]{
        var res : [PostData] = [PostData]()
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
            
            for pds in try database.prepare(pd){
                if Int(pds[pdType]) == 0{
                    continue
                }
                res.append(PostData(cid: Int(pds[cid]), type: Int(pds[pdType]),
                                    title: Base64.toString(s: pds[pdTitle]),
                                    slug: Base64.toString(s: pds[pdSlug]),
                                    created: Base64.toString(s: pds[pdCreated]),
                                    modified: Base64.toString(s: pds[pdModified]),
                                    text: Base64.toString(s: pds[pdText]),
                                    thumbUrl: Base64.toString(s: pds[pdThumbUrl]),
                                    summary: Base64.toString(s: pds[pdSummary]),
                                    category: Base64.toString(s: pds[pdCategory]),
                                    tag: Base64.toString(s: pds[pdTag])))
            }
        }catch{
            print(error)
        }
        
        return res
    }
    
    static func editPage(cidd : Int,title : String,text : String,thumbUrl : String,summary : String,category : String,tag : String){
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
            let pdTitle = Expression<String>("title")
            let pdSlug = Expression<String>("slug")
            let pdModified = Expression<String>("modified")
            let pdText = Expression<String>("text")
            let pdThumbUrl = Expression<String>("thumbUrl")
            let pdSummary = Expression<String>("summary")
            let pdCategory = Expression<String>("category")
            let pdTag = Expression<String>("tag")
            
            let curCid = cidd
            let curPd = pd.filter(cid == Int64(curCid))
            
            try database.run(curPd.update(
                pdTitle <- Base64.toBase64(s: title),
                pdSlug <- Base64.toBase64(s: title),
                pdModified <- Base64.toBase64(s: Time.getTime()),
                pdText <- Base64.toBase64(s: text),
                pdThumbUrl <- Base64.toBase64(s: thumbUrl),
                pdSummary <- Base64.toBase64(s: summary),
                pdCategory <- Base64.toBase64(s: category),
                pdTag <- Base64.toBase64(s: tag)
            ))
        }catch{
            print(error)
        }
    }
    
    static func newCategory(name : String){
        var database : Connection
        let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first! + "/" + Bundle.main.bundleIdentifier!
        print("Database folder: " +  path)
        do{
            //create parent directory iff it doesn’t exist
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)

            //open database
            database = try Connection("\(path)/blog.db")
            
            //metaDatas table
            let md = Table("metaDatas")
                       
            //metaDatas columns settings
            let mid = Expression<Int64>("mid")
            let mdCnt = Expression<Int64>("cnt")
            let mdType = Expression<Int64>("type")
            let mdSlug = Expression<String>("slug")
            let mdName = Expression<String>("name")
            
            let maxMid : Int64 = Int64(try database.scalar(md.count))
            
            try database.run(md.insert(
                mid <- (maxMid + 1),
                mdType <- Int64(1),
                mdCnt <- 0,
                mdName <- Base64.toBase64(s: name),
                mdSlug <- Base64.toBase64(s: name)
            ))
        }catch{
            print(error)
        }
    }
    
    static func getCategoryList() -> [MetaData]{
        var res : [MetaData] = [MetaData]()
        var database : Connection
        let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first! + "/" + Bundle.main.bundleIdentifier!
        print("Database folder: " +  path)
        do{
            //create parent directory iff it doesn’t exist
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)

            //open database
            database = try Connection("\(path)/blog.db")
            
            //metaDatas table
            let md = Table("metaDatas")
            
            //metaDatas columns settings
            let mid = Expression<Int64>("mid")
            let mdCnt = Expression<Int64>("cnt")
            let mdType = Expression<Int64>("type")
            let mdSlug = Expression<String>("slug")
            let mdName = Expression<String>("name")
            
            for mds in try database.prepare(md){
                if Int(mds[mdType]) == 0{
                    continue
                }
                res.append(MetaData(mid: Int(mds[mid]), cnt: Int(mds[mdCnt]),
                                    type: Int(mds[mdType]),
                                    slug: Base64.toString(s: mds[mdSlug]),
                                    name: Base64.toString(s: mds[mdName])))
            }
        }catch{
            print(error)
        }
        
        return res
    }
    
    static func editCategory(midd : Int,name : String){
        var database : Connection
        let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first! + "/" + Bundle.main.bundleIdentifier!
        print("Database folder: " +  path)
        do{
            //create parent directory iff it doesn’t exist
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)

            //open database
            database = try Connection("\(path)/blog.db")
            
            //metaDatas table
            let md = Table("metaDatas")
            
            //metaDatas columns settings
            let mid = Expression<Int64>("mid")
            let mdSlug = Expression<String>("slug")
            let mdName = Expression<String>("name")
            
            let curMid = midd
            let curMd = md.filter(mid == Int64(curMid))
            
            try database.run(curMd.update(
                mdSlug <- Base64.toBase64(s: name),
                mdName <- Base64.toBase64(s: name)
            ))
        }catch{
            print(error)
        }
    }
    
    static func getMetaData(midd : Int) -> MetaData{
        var res : MetaData = MetaData()
        
        var database : Connection
        let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first! + "/" + Bundle.main.bundleIdentifier!
        print("Database folder: " +  path)
        do{
            //create parent directory iff it doesn’t exist
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)

            //open database
            database = try Connection("\(path)/blog.db")
            
            //metaDatas table
            let md = Table("metaDatas")
                       
            //metaDatas columns settings
            let mid = Expression<Int64>("mid")
            let mdCnt = Expression<Int64>("cnt")
            let mdType = Expression<Int64>("type")
            let mdSlug = Expression<String>("slug")
            let mdName = Expression<String>("name")
            
            for mds in try database.prepare(md){
                if Int(mds[mid]) != midd{
                    continue
                }
                res = MetaData(mid: Int(mds[mid]),
                               cnt: Int(mds[mdCnt]),
                               type: Int(mds[mdType]),
                                    slug: Base64.toString(s: mds[mdSlug]),
                                    name: Base64.toString(s: mds[mdName]))
            }
        }catch{
            print(error)
        }
        return res
    }
    
    static func newTag(name : String){
        var database : Connection
        let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first! + "/" + Bundle.main.bundleIdentifier!
        print("Database folder: " +  path)
        do{
            //create parent directory iff it doesn’t exist
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)

            //open database
            database = try Connection("\(path)/blog.db")
            
            //metaDatas table
            let md = Table("metaDatas")
                       
            //metaDatas columns settings
            let mid = Expression<Int64>("mid")
            let mdCnt = Expression<Int64>("cnt")
            let mdType = Expression<Int64>("type")
            let mdSlug = Expression<String>("slug")
            let mdName = Expression<String>("name")
            
            let maxMid : Int64 = Int64(try database.scalar(md.count))
            
            try database.run(md.insert(
                mid <- (maxMid + 1),
                mdType <- Int64(0),
                mdCnt <- 0,
                mdName <- Base64.toBase64(s: name),
                mdSlug <- Base64.toBase64(s: name)
            ))
        }catch{
            print(error)
        }
    }
    
    static func getTagList() -> [MetaData]{
        var res : [MetaData] = [MetaData]()
        var database : Connection
        let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first! + "/" + Bundle.main.bundleIdentifier!
        print("Database folder: " +  path)
        do{
            //create parent directory iff it doesn’t exist
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)

            //open database
            database = try Connection("\(path)/blog.db")
            
            //metaDatas table
            let md = Table("metaDatas")
            
            //metaDatas columns settings
            let mid = Expression<Int64>("mid")
            let mdCnt = Expression<Int64>("cnt")
            let mdType = Expression<Int64>("type")
            let mdSlug = Expression<String>("slug")
            let mdName = Expression<String>("name")
            
            for mds in try database.prepare(md){
                if Int(mds[mdType]) == 1{
                    continue
                }
                res.append(MetaData(mid: Int(mds[mid]), cnt: Int(mds[mdCnt]),
                                    type: Int(mds[mdType]),
                                    slug: Base64.toString(s: mds[mdSlug]),
                                    name: Base64.toString(s: mds[mdName])))
            }
        }catch{
            print(error)
        }
        
        return res
    }
    
    static func editTag(midd : Int,name : String){
        var database : Connection
        let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first! + "/" + Bundle.main.bundleIdentifier!
        print("Database folder: " +  path)
        do{
            //create parent directory iff it doesn’t exist
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)

            //open database
            database = try Connection("\(path)/blog.db")
            
            //metaDatas table
            let md = Table("metaDatas")
            
            //metaDatas columns settings
            let mid = Expression<Int64>("mid")
            let mdSlug = Expression<String>("slug")
            let mdName = Expression<String>("name")
            
            let curMid = midd
            let curMd = md.filter(mid == Int64(curMid))
            
            try database.run(curMd.update(
                mdSlug <- Base64.toBase64(s: name),
                mdName <- Base64.toBase64(s: name)
            ))
        }catch{
            print(error)
        }
    }
    
    static func getLinkData(lidd : Int) -> LinksData{
        var res : LinksData = LinksData()
        
        var database : Connection
        let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first! + "/" + Bundle.main.bundleIdentifier!
        print("Database folder: " +  path)
        do{
            //create parent directory iff it doesn’t exist
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)

            //open database
            database = try Connection("\(path)/blog.db")
            
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
            
            for lds in try database.prepare(ld){
                if Int(lds[lid]) != lidd{
                    continue
                }
                res = LinksData(lid: Int(lds[lid]),orders: Int(lds[ldOrders]),
                                    name: Base64.toString(s: lds[ldName]),
                                    url: Base64.toString(s: lds[ldUrl]),
                                    sort: Base64.toString(s: lds[ldSort]),
                                    image: Base64.toString(s: lds[ldImage]),
                                    description: Base64.toString(s: lds[ldDescription]
                                    ))
            }
        }catch{
            print(error)
        }
        return res
    }
    
    static func newLink(name : String,url : String,image : String,description : String){
        var database : Connection
        let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first! + "/" + Bundle.main.bundleIdentifier!
        print("Database folder: " +  path)
        do{
            //create parent directory iff it doesn’t exist
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)

            //open database
            database = try Connection("\(path)/blog.db")
            
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
            
            let maxLid : Int64 = Int64(try database.scalar(ld.count))
            
            try database.run(ld.insert(
                lid <- (maxLid + 1),
                ldOrders <- (maxLid + 100),
                ldName <- Base64.toBase64(s: name),
                ldUrl <- Base64.toBase64(s: url),
                ldSort <- Base64.toBase64(s: "ten"),
                ldImage <- Base64.toBase64(s: image),
                ldDescription <- Base64.toBase64(s: description)
            ))
        }catch{
            print(error)
        }
    }
    
    static func getLinkList() -> [LinksData]{
        var res : [LinksData] = [LinksData]()
        var database : Connection
        let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first! + "/" + Bundle.main.bundleIdentifier!
        print("Database folder: " +  path)
        do{
            //create parent directory iff it doesn’t exist
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)

            //open database
            database = try Connection("\(path)/blog.db")
            
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
            
            for lds in try database.prepare(ld){
                res.append(LinksData(lid: Int(lds[lid]),orders: Int(lds[ldOrders]),
                                     name: Base64.toString(s: lds[ldName]),
                                     url: Base64.toString(s: lds[ldUrl]),
                                     sort: Base64.toString(s: lds[ldSort]),
                                     image: Base64.toString(s: lds[ldImage]),
                                     description: Base64.toString(s: lds[ldDescription]
                )))
            }
        }catch{
            print(error)
        }
        
        return res
    }
    
    static func editLink(lidd : Int,name : String,url : String,image : String,description : String){
        var database : Connection
        let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first! + "/" + Bundle.main.bundleIdentifier!
        print("Database folder: " +  path)
        do{
            //create parent directory iff it doesn’t exist
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)

            //open database
            database = try Connection("\(path)/blog.db")
            
            //linksDatas table
            let ld = Table("linksDatas")
            
            //linksDatas columns settings
            let lid = Expression<Int64>("lid")
            let ldName = Expression<String>("name")
            let ldUrl = Expression<String>("url")
            let ldImage = Expression<String>("image")
            let ldDescription = Expression<String>("description")
            
            let curLid = lidd
            let curLd = ld.filter(lid == Int64(curLid))
            
            try database.run(curLd.update(
                ldName <- Base64.toBase64(s: name),
                ldUrl <- Base64.toBase64(s: url),
                ldImage <- Base64.toBase64(s: image),
                ldDescription <- Base64.toBase64(s: description)
            ))
        }catch{
            print(error)
        }
    }
    
    static func getBookData(bidd : Int) -> BookData{
        var res : BookData = BookData()
        
        var database : Connection
        let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first! + "/" + Bundle.main.bundleIdentifier!
        print("Database folder: " +  path)
        do{
            //create parent directory iff it doesn’t exist
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)

            //open database
            database = try Connection("\(path)/blog.db")
            
            //bookDatas table
            let bd = Table("bookDatas")
            
            //bookDatas columns settings
            let bid = Expression<Int64>("bid")
            let bdName = Expression<String>("name")
            let bdIsbn = Expression<String>("isbn")
            let bdLsbn = Expression<String>("lsbn")
            let bdImage = Expression<String>("image")
            
            for bds in try database.prepare(bd){
                if Int(bds[bid]) != bidd{
                    continue
                }
                res = BookData(bid: Int(bds[bid]),
                                    name: Base64.toString(s: bds[bdName]),
                                    isbn: Base64.toString(s: bds[bdIsbn]),
                                    lsbn: Base64.toString(s: bds[bdLsbn]),
                                    image: Base64.toString(s: bds[bdImage])
                                    )
            }
        }catch{
            print(error)
        }
        return res
    }
    
    static func newBook(name : String,isbn : String,lsbn : String,image : String){
        var database : Connection
        let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first! + "/" + Bundle.main.bundleIdentifier!
        print("Database folder: " +  path)
        do{
            //create parent directory iff it doesn’t exist
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)

            //open database
            database = try Connection("\(path)/blog.db")
            
            //bookDatas table
            let bd = Table("bookDatas")
            
            //bookDatas columns settings
            let bid = Expression<Int64>("bid")
            let bdName = Expression<String>("name")
            let bdIsbn = Expression<String>("isbn")
            let bdLsbn = Expression<String>("lsbn")
            let bdImage = Expression<String>("image")
            
            let maxBid : Int64 = Int64(try database.scalar(bd.count))
            
            try database.run(bd.insert(
                bid <- (maxBid + 1),
                bdName <- Base64.toBase64(s: name),
                bdIsbn <- Base64.toBase64(s: isbn),
                bdLsbn <- Base64.toBase64(s: lsbn),
                bdImage <- Base64.toBase64(s: image)
            ))
        }catch{
            print(error)
        }
    }
    
    static func getBookList() -> [BookData]{
        var res : [BookData] = [BookData]()
        var database : Connection
        let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first! + "/" + Bundle.main.bundleIdentifier!
        print("Database folder: " +  path)
        do{
            //create parent directory iff it doesn’t exist
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)

            //open database
            database = try Connection("\(path)/blog.db")
            
            //bookDatas table
            let bd = Table("bookDatas")
            
            //bookDatas columns settings
            let bid = Expression<Int64>("bid")
            let bdName = Expression<String>("name")
            let bdIsbn = Expression<String>("isbn")
            let bdLsbn = Expression<String>("lsbn")
            let bdImage = Expression<String>("image")
            
            for bds in try database.prepare(bd){
                res.append(BookData(bid: Int(bds[bid]),
                                     name: Base64.toString(s: bds[bdName]),
                                     isbn: Base64.toString(s: bds[bdIsbn]),
                                     lsbn: Base64.toString(s: bds[bdLsbn]),
                                     image: Base64.toString(s: bds[bdImage])
                ))
            }
        }catch{
            print(error)
        }
        
        return res
    }
    
    static func editBook(bidd : Int,name : String,isbn : String,lsbn : String,image : String){
        var database : Connection
        let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first! + "/" + Bundle.main.bundleIdentifier!
        print("Database folder: " +  path)
        do{
            //create parent directory iff it doesn’t exist
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)

            //open database
            database = try Connection("\(path)/blog.db")
            
            //bookDatas table
            let bd = Table("bookDatas")
            
            //bookDatas columns settings
            let bid = Expression<Int64>("bid")
            let bdName = Expression<String>("name")
            let bdIsbn = Expression<String>("isbn")
            let bdLsbn = Expression<String>("lsbn")
            let bdImage = Expression<String>("image")
            
            let curBid = bidd
            let curBd = bd.filter(bid == Int64(curBid))
            
            try database.run(curBd.update(
                bdName <- Base64.toBase64(s: name),
                bdIsbn <- Base64.toBase64(s: isbn),
                bdLsbn <- Base64.toBase64(s: lsbn),
                bdImage <- Base64.toBase64(s: image)
            ))
        }catch{
            print(error)
        }
    }
    
    static func getAnimeData(aidd : Int) -> AnimeData{
        var res : AnimeData = AnimeData()
        
        var database : Connection
        let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first! + "/" + Bundle.main.bundleIdentifier!
        print("Database folder: " +  path)
        do{
            //create parent directory iff it doesn’t exist
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)

            //open database
            database = try Connection("\(path)/blog.db")
            
            //animeDatas table
            let ad = Table("animeDatas")
            
            //animeDatas columns settings
            let aid = Expression<Int64>("aid")
            let adNameJA = Expression<String>("nameJA")
            let adNameZH = Expression<String>("nameZH")
            let adImage = Expression<String>("image")
            
            for ads in try database.prepare(ad){
                if Int(ads[aid]) != aidd{
                    continue
                }
                res = AnimeData(aid: Int(ads[aid]),
                                    nameJA: Base64.toString(s: ads[adNameJA]),
                                    nameZH: Base64.toString(s: ads[adNameZH]),
                                    image: Base64.toString(s: ads[adImage])
                                    )
            }
        }catch{
            print(error)
        }
        return res
    }
    
    static func newAnime(nameJA : String,nameZH : String,image : String){
        var database : Connection
        let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first! + "/" + Bundle.main.bundleIdentifier!
        print("Database folder: " +  path)
        do{
            //create parent directory iff it doesn’t exist
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)

            //open database
            database = try Connection("\(path)/blog.db")
            
            //animeDatas table
            let ad = Table("animeDatas")
            
            //animeDatas columns settings
            let aid = Expression<Int64>("aid")
            let adNameJA = Expression<String>("nameJA")
            let adNameZH = Expression<String>("nameZH")
            let adImage = Expression<String>("image")
            
            let maxAid : Int64 = Int64(try database.scalar(ad.count))
            
            try database.run(ad.insert(
                aid <- (maxAid + 1),
                adNameJA <- Base64.toBase64(s: nameJA),
                adNameZH <- Base64.toBase64(s: nameZH),
                adImage <- Base64.toBase64(s: image)
            ))
        }catch{
            print(error)
        }
    }
    
    static func getAnimeList() -> [AnimeData]{
        var res : [AnimeData] = [AnimeData]()
        var database : Connection
        let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first! + "/" + Bundle.main.bundleIdentifier!
        print("Database folder: " +  path)
        do{
            //create parent directory iff it doesn’t exist
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)

            //open database
            database = try Connection("\(path)/blog.db")
            
            //animeDatas table
            let ad = Table("animeDatas")
            
            //animeDatas columns settings
            let aid = Expression<Int64>("aid")
            let adNameJA = Expression<String>("nameJA")
            let adNameZH = Expression<String>("nameZH")
            let adImage = Expression<String>("image")
            
            for ads in try database.prepare(ad){
                res.append(AnimeData(aid: Int(ads[aid]),
                                     nameJA: Base64.toString(s: ads[adNameJA]),
                                     nameZH: Base64.toString(s: ads[adNameZH]),
                                     image: Base64.toString(s: ads[adImage])
                ))
            }
        }catch{
            print(error)
        }
        
        return res
    }
    
    static func editAnime(aidd : Int,nameJA : String,nameZH : String,image : String){
        var database : Connection
        let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first! + "/" + Bundle.main.bundleIdentifier!
        print("Database folder: " +  path)
        do{
            //create parent directory iff it doesn’t exist
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)

            //open database
            database = try Connection("\(path)/blog.db")
            
            //animeDatas table
            let ad = Table("animeDatas")
            
            //animeDatas columns settings
            let aid = Expression<Int64>("aid")
            let adNameJA = Expression<String>("nameJA")
            let adNameZH = Expression<String>("nameZH")
            let adImage = Expression<String>("image")
            
            let curAid = aidd
            let curAd = ad.filter(aid == Int64(curAid))
            
            try database.run(curAd.update(
                adNameJA <- Base64.toBase64(s: nameJA),
                adNameZH <- Base64.toBase64(s: nameZH),
                adImage <- Base64.toBase64(s: image)
            ))
        }catch{
            print(error)
        }
    }
    
    static func getVideoData(vidd : Int) -> VideoData{
        var res : VideoData = VideoData()
        
        var database : Connection
        let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first! + "/" + Bundle.main.bundleIdentifier!
        print("Database folder: " +  path)
        do{
            //create parent directory iff it doesn’t exist
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)

            //open database
            database = try Connection("\(path)/blog.db")
            
            //VideoDatas table
            let vd = Table("videoDatas")
            
            //VideoDatas columns settings
            let vid = Expression<Int64>("vid")
            let vdNameJA = Expression<String>("nameJA")
            let vdNameZH = Expression<String>("nameZH")
            let vdImage = Expression<String>("image")
            
            for vds in try database.prepare(vd){
                if Int(vds[vid]) != vidd{
                    continue
                }
                res = VideoData(vid: Int(vds[vid]),
                                    nameJA: Base64.toString(s: vds[vdNameJA]),
                                    nameZH: Base64.toString(s: vds[vdNameZH]),
                                    image: Base64.toString(s: vds[vdImage])
                                    )
            }
        }catch{
            print(error)
        }
        return res
    }
    
    static func newVideo(nameJA : String,nameZH : String,image : String){
        var database : Connection
        let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first! + "/" + Bundle.main.bundleIdentifier!
        print("Database folder: " +  path)
        do{
            //create parent directory iff it doesn’t exist
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)

            //open database
            database = try Connection("\(path)/blog.db")
            
            //VideoDatas table
            let vd = Table("videoDatas")
            
            //VideoDatas columns settings
            let vid = Expression<Int64>("vid")
            let vdNameJA = Expression<String>("nameJA")
            let vdNameZH = Expression<String>("nameZH")
            let vdImage = Expression<String>("image")
            
            let maxVid : Int64 = Int64(try database.scalar(vd.count))
            
            try database.run(vd.insert(
                vid <- (maxVid + 1),
                vdNameJA <- Base64.toBase64(s: nameJA),
                vdNameZH <- Base64.toBase64(s: nameZH),
                vdImage <- Base64.toBase64(s: image)
            ))
        }catch{
            print(error)
        }
    }
    
    static func getVideoList() -> [VideoData]{
        var res : [VideoData] = [VideoData]()
        var database : Connection
        let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first! + "/" + Bundle.main.bundleIdentifier!
        print("Database folder: " +  path)
        do{
            //create parent directory iff it doesn’t exist
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)

            //open database
            database = try Connection("\(path)/blog.db")
            
            //VideoDatas table
            let vd = Table("videoDatas")
            
            //VideoDatas columns settings
            let vid = Expression<Int64>("vid")
            let vdNameJA = Expression<String>("nameJA")
            let vdNameZH = Expression<String>("nameZH")
            let vdImage = Expression<String>("image")
            
            for vds in try database.prepare(vd){
                res.append(VideoData(vid: Int(vds[vid]),
                                     nameJA: Base64.toString(s: vds[vdNameJA]),
                                     nameZH: Base64.toString(s: vds[vdNameZH]),
                                     image: Base64.toString(s: vds[vdImage])
                ))
            }
        }catch{
            print(error)
        }
        
        return res
    }
    
    static func editVideo(vidd : Int,nameJA : String,nameZH : String,image : String){
        var database : Connection
        let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first! + "/" + Bundle.main.bundleIdentifier!
        print("Database folder: " +  path)
        do{
            //create parent directory iff it doesn’t exist
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)

            //open database
            database = try Connection("\(path)/blog.db")
            
            //VideoDatas table
            let vd = Table("VideoDatas")
            
            //VideoDatas columns settings
            let vid = Expression<Int64>("vid")
            let vdNameJA = Expression<String>("nameJA")
            let vdNameZH = Expression<String>("nameZH")
            let vdImage = Expression<String>("image")
            
            let curVid = vidd
            let curVd = vd.filter(vid == Int64(curVid))
            
            try database.run(curVd.update(
                vdNameJA <- Base64.toBase64(s: nameJA),
                vdNameZH <- Base64.toBase64(s: nameZH),
                vdImage <- Base64.toBase64(s: image)
            ))
        }catch{
            print(error)
        }
    }
    
    static func editSetting(sidd : Int,field : String){
        var database : Connection
        let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first! + "/" + Bundle.main.bundleIdentifier!
        print("Database folder: " +  path)
        do{
            //create parent directory iff it doesn’t exist
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)

            //open database
            database = try Connection("\(path)/blog.db")
            
            //settingDatas table
            let sd = Table("settingDatas")
            
            //settingDatas columns settings
            let sid = Expression<Int64>("sid")
            let sdField = Expression<String>("field")
            
            let curSid = sidd
            let curSd = sd.filter(sid == Int64(curSid))
            
            try database.run(curSd.update(
                sdField <- Base64.toBase64(s: field)
            ))
            
        }catch{
            print(error)
        }
    }
    
    static func getSetting(sidd : Int) -> String{
        var database : Connection
        let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first! + "/" + Bundle.main.bundleIdentifier!
        print("Database folder: " +  path)
        do{
            //create parent directory iff it doesn’t exist
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)

            //open database
            database = try Connection("\(path)/blog.db")
            
            //settingDatas table
            let sd = Table("settingDatas")
            
            //settingDatas columns settings
            let sid = Expression<Int64>("sid")
            let sdField = Expression<String>("field")
            
            let curSid = sidd
            let curSd = sd.filter(sid == Int64(curSid))
            
            for sds in try database.prepare(curSd){
                return Base64.toString(s: sds[sdField])
            }
            
        }catch{
            print(error)
        }
        return ""
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
