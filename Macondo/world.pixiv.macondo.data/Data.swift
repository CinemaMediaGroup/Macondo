//
//  Data.swift
//  Macondo
//
//  Created by Louis Joe Shen on 2020/7/19.
//  Copyright © 2020 Louise Joe Shen. All rights reserved.
//

import Foundation

struct PostData : Hashable{
    var cid : Int
    //'0' stands for 'post' while
    //'1' stands for 'page'.
    var type : Int
    //The 'slug' field has been deprecated, but you still need to let it has the same value of 'title'
    var title : String
    var slug : String
    var created : String
    var modified : String
    var text : String
    var thumbUrl : String
    var summary : String
    var category : String
    var tag : String
    
    init() {
        cid = 0
        type = 0
        title = ""
        slug = ""
        created = ""
        modified = ""
        text = ""
        thumbUrl = ""
        summary = ""
        category = ""
        tag = ""
    }
    
    init(cid : Int,type : Int,title : String,slug : String,created : String,modified : String,text : String,thumbUrl : String,summary : String,category : String,tag : String) {
        self.cid = cid
        self.type = type
        self.title = title
        self.slug = title //let it has the same value of 'title'
        self.created = created
        self.modified = modified
        self.text = text
        self.thumbUrl = thumbUrl
        self.summary = summary
        self.category = category
        self.tag = tag
    }
    
    func getCid() -> Int{
        return cid
    }
    
    func getTitle() -> String{
        return title
    }
    
    func getText() -> String{
        return text
    }
    
    func getThumbUrl() -> String{
        return thumbUrl
    }
    
    func getSummary() -> String{
        return summary
    }
    
    func getCategory() -> String{
        return category
    }
    
    func getTag() -> String{
        return tag
    }
}

struct MetaData : Hashable{
    var mid : Int
    var cnt : Int
    //'0' stands for 'tag' while
    //'1' stands for 'category'.
    var type : Int
    var slug : String
    var name : String
    
    init(){
        mid = 0
        cnt = 0
        type = 0
        slug = ""
        name = ""
    }
    
    init(mid : Int,cnt : Int,type : Int,slug : String,name : String) {
        self.mid = mid
        self.cnt = cnt
        self.type = type
        self.slug = name
        self.name = name
    }
    
    func getMid() -> Int {
        return mid
    }
    
    func getName() -> String{
        return name
    }
}

struct LinksData : Hashable{
    var lid : Int
    var orders : Int
    var name : String
    var url : String
    var sort : String
    var image : String
    var description : String
    
    init() {
        lid = 0
        orders = 0
        name = ""
        url = ""
        sort = ""
        image = ""
        description = ""
    }
    
    init(lid: Int, orders: Int, name: String, url: String, sort: String, image: String, description: String) {
        self.lid = lid
        self.orders = orders
        self.name = name
        self.url = url
        self.sort = sort
        self.image = image
        self.description = description
    }
    
    func getLid() -> Int{
        return lid
    }
    
    func getName() -> String{
        return name
    }
    
    func getUrl() -> String{
        return url
    }
    
    func getImage() -> String{
        return image
    }
    
    func getDescription() -> String{
        return description
    }
}

struct AnimeData{
    var aid : Int
    var nameJA : String
    var nameZH : String
    var image : String
    
    init() {
        aid = 0
        nameJA = ""
        nameZH = ""
        image = ""
    }
    
    init(aid: Int, nameJA: String, nameZH: String, image: String) {
        self.aid = aid
        self.nameJA = nameJA
        self.nameZH = nameZH
        self.image = image
    }
}

struct VideoData{
    var vid : Int
    var nameJA : String
    var nameZH : String
    var image : String
    
    init() {
        vid = 0
        nameJA = ""
        nameZH = ""
        image = ""
    }
    
    init(vid: Int, nameJA: String, nameZH: String, image: String) {
        self.vid = vid
        self.nameJA = nameJA
        self.nameZH = nameZH
        self.image = image
    }
}

struct BookData{
    var bid : Int
    var name : String
    var isbn : String
    var lsbn : String
    var image : String
    
    init() {
        bid = 0
        name = ""
        isbn = ""
        lsbn = ""
        image = ""
    }
    
    init(bid: Int, name: String, isbn: String, lsbn: String, image: String) {
        self.bid = bid
        self.name = name
        self.isbn = isbn
        self.lsbn = lsbn
        self.image = image
    }
}

struct SettingData{
    var sid : Int
    var name : String
    var field : String
    
    init() {
        sid = 0
        name = ""
        field = ""
    }
    
    init(sid: Int, name: String, field: String) {
        self.sid = sid
        self.name = name
        self.field = field
    }
}
