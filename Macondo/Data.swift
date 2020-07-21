//
//  Data.swift
//  Macondo
//
//  Created by Louis Joe Shen on 2020/7/19.
//  Copyright © 2020 Louise Joe Shen. All rights reserved.
//

import Foundation

struct PostData{
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
}

struct MetaData{
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
}
