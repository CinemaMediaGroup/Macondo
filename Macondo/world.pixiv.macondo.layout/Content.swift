//
//  Content.swift
//  Macondo
//
//  Created by Louis Joe Shen on 2020/7/27.
//  Copyright © 2020 Louise Joe Shen. All rights reserved.
//

import Foundation

struct Generator{
    static func generate() -> String{
        var layout : Node = Node(beginTag: "<!DOCTYPE html><html lang=\"zh-CN\">",content: "",endTag: "</html>")
        
        var head : Node = Node()
        var heads : [Node] = [Node]()
        //charset
        heads.append(Node(beginTag: "<meta charset=\"utf-8\">",content: "",endTag: ""))
        //title
        heads.append(Node(beginTag: "<title>", content: Sqlite.getSetting(sidd: 1), endTag: "</title>"))
        //favicon
        heads.append(Node(beginTag: "<link rel=\"shortcut icon\" href=\"\(Sqlite.getSetting(sidd: 5))\"/>", content: "", endTag: ""))
        heads.append(Node(beginTag: "<link rel=\"bookmark\" href=\"\(Sqlite.getSetting(sidd: 5))\" type=\"image/x-icon\"/>", content: "", endTag: ""))
        //css
        heads.append(Node(beginTag: "<link href=\"./style.d5172d4c.css\" rel=\"stylesheet\">", content: "", endTag: ""))
        //feather-icon
        heads.append(Node(beginTag: "<script src=\"https://cdn.jsdelivr.net/npm/feather-icons/dist/feather.min.js\">", content: "", endTag: "</script>"))
        for i in heads{
            head.add(node: i)
        }
        layout.add(node: head)
        
        var body : Node = Node()
        let nav : Node = Node()
        //nav-container
        let navContainer : Node = Node(beginTag: "<div class=\"navbar-container\">", content: "", endTag: "</div>")
        //nav-brand
        let navBrand : Node = Node(beginTag: "<div class=\"navbar-brand\">",content: "<a href=\"/\" class=\"navbar-item\"><img src=\"\(Sqlite.getSetting(sidd:  6))\" width=\"64\" height=\"64\"><span>\(Sqlite.getSetting(sidd:  1))</span></a>",endTag: "</div>")
        //nav-menu
        let navMenu : Node = Node(beginTag: "<div class=\"navbar-menu\">", content: "", endTag: "</div>")
        //nav-leftMenu
        let navMenuStart : Node = Node(beginTag: "<div class=\"navbar-start\">", content: "", endTag: "</div>")
        var navStarts : [Node] = [Node]()
        navStarts.append(Node(beginTag: "<a class=\"navbar-item\" href=\"/anime.html\">", content: "<span class=\"feather-icon\"><i data-feather=\"youtube\"></i></span>アニメ番組", endTag: "</a>"))
        for i in navStarts{
            navMenuStart.add(node: i)
        }
        //nav-rightMenu
        let navMenuEnd : Node = Node(beginTag: "<div class=\"navbar-end\">", content: "", endTag: "</div>")
        var navEnds : [Node] = [Node]()
        navEnds.append(Node(beginTag: "<a class=\"navbar-item\" aria-label=\"drak\" id=\"dark-mode-btn\">", content: "<i data-feather=\"moon\"></i>", endTag: "</a>"))
        for i in navEnds{
            navMenuEnd.add(node: i)
        }
        navMenu.add(node: navMenuStart)
        navMenu.add(node: navMenuEnd)
        navContainer.add(node: navBrand)
        navContainer.add(node: navMenu)
        nav.add(node: navContainer)
        
        return layout.toString()
    }
}
