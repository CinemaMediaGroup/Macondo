//
//  Content.swift
//  Macondo
//
//  Created by Louis Joe Shen on 2020/7/27.
//  Copyright © 2020 Louise Joe Shen. All rights reserved.
//
/*
import Foundation

struct Generator{
    static func generate() -> String{
        let layout : Node = Node(beginTag: "<!DOCTYPE html><html lang=\"zh-CN\">",content: "",endTag: "</html>")
        
        let head : Node = Node(beginTag: "<head>", content: "", endTag: "</head>")
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
        
        var body : Node = Node(beginTag: "<body>", content: "", endTag: "</body>")
        
        //navigation
        let nav : Node = Node(beginTag: "<nav class=\"navbar navbar-main\" role=\"navigation\">", content: "", endTag: "</nav>")
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
        
        //section
        var section = Node(beginTag: "<div class=\"section\">", content: "", endTag: "</div>")
        //section-container
        var sectionContainer = Node(beginTag: "<div class=\"container\">", content: "", endTag: "</div>")
        //column
        var column = Node(beginTag: "<div class=\"columns\">", content: "", endTag: "</div>")
        //main
        var main = Node(beginTag: "<main class=\"main-column\">", content: "", endTag: "</main>")
        //left-column
        var leftColumn = Node(beginTag: "<aside class=\"left-column\">", content: "", endTag: "</aside>")
        var leftCard1 = Node(beginTag: "<div class=\"card spacer widget-author\">", content: "", endTag: "</div>")
        var leftCard1Avatar = Node(beginTag: "<div class=\"author-image\"><picture>", content: "<img class=\"author-avatar\" src=\"\(Sqlite.getSetting(sidd: 7))\">", endTag: "</picture></div>")
        var leftCard1User = Node(beginTag: "<p class=\"author-name\">", content: Sqlite.getSetting(sidd: 4), endTag: "</p>")
        var leftCard1Description = Node(beginTag: "<p class=\"author-text\">", content: Sqlite.getSetting(sidd: 8), endTag: "</p>")
        var leftCard1Level = Node(beginTag: "<div class=\"author-level\">", content: "", endTag: "</div>")
        var leftCard1LevelItem : [Node] = [Node]()
        leftCard1LevelItem.append(Node(beginTag: "<div class=\"author-level-item\">", content: "<p class=\"author-count\">80</p><p class=\"size-small\">文章</p>", endTag: "</div>"))
        leftCard1LevelItem.append(Node(beginTag: "<div class=\"author-level-item\">", content: "<p class=\"author-count\">80</p><p class=\"size-small\">看番</p>", endTag: "</div>"))
        leftCard1LevelItem.append(Node(beginTag: "<div class=\"author-level-item\">", content: "<p class=\"author-count\">80</p><p class=\"size-small\">看剧</p>", endTag: "</div>"))
        leftCard1LevelItem.append(Node(beginTag: "<div class=\"author-level-item\">", content: "<p class=\"author-count\">80</p><p class=\"size-small\">读书</p>", endTag: "</div>"))
        for i in leftCard1LevelItem{
            leftCard1Level.add(node: i)
        }
        leftCard1.add(node: leftCard1Avatar)
        leftCard1.add(node: leftCard1User)
        leftCard1.add(node: leftCard1Description)
        leftCard1.add(node: leftCard1Level)
        leftColumn.add(node: leftCard1)
        //right-column
        var rightColumn = Node(beginTag: "<aside class=\"right-column\">", content: "", endTag: "</aside>")
        var rightCardContainer = Node(beginTag: "<div class=\"sticky-widescreen\">", content: "", endTag: "</div>")
        column.add(node: main)
        column.add(node: leftColumn)
        //column.add(node: rightColumn)
        sectionContainer.add(node: column)
        section.add(node: sectionContainer)
        
        var fab = Node(beginTag: "<div class=\"fab\"><a href=\"#\" class=\"fab-btn\" aria-label=\"回到顶部\" title=\"top\">", content: "<i class=\"ski\" id=\"ski-up\"></i>", endTag: "</a></div>")
        
        body.add(node: nav)
        body.add(node: section)
        body.add(node: fab)
        layout.add(node: body)
        
        return layout.toString()
    }
}
*/
