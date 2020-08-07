//
//  Node.swift
//  Macondo
//
//  Created by Louis Joe Shen on 2020/7/27.
//  Copyright © 2020 Louise Joe Shen. All rights reserved.
//
/*
import Foundation

class Node{
    var childs : [Node]
    var parent : Node?
    var beginTag : String
    var content : String
    var endTag : String
    
    init() {
        childs = [Node]()
        beginTag = ""
        content = ""
        endTag = ""
    }
    
    init(beginTag : String,content : String,endTag : String){
        self.beginTag = beginTag
        self.content = content
        self.endTag = endTag
        childs = [Node]()
    }
    
    func add(node : Node){
        node.setParent(node: self)
        childs.append(node)
    }
    
    private func setParent(node : Node){
        parent = node
    }
    
    private func traverse(node : Node) -> String{
        if node.childs.count == 0 {
            return node.beginTag + node.content + node.endTag
        }
        var res : String = ""
        res += node.beginTag
        res += node.content
        
        for n in node.childs{
            res += traverse(node: n)
        }
        res += node.endTag
        return res
    }
    
    func toString() -> String{
        return traverse(node: self)
    }
}
*/
