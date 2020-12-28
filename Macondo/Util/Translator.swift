//
//  Trans.swift
//  Macondo
//
//  Created by Louis Shen on 2020/12/9.
//

import Foundation

struct T{
    public static func me(t : String,language : String) -> String{
        if language == "zh-CN" {
            if t == "Post" {
                return "文章"
            }else if t == "Link" {
                return "链接"
            }else if t == "Book" {
                return "书籍"
            }else if t == "Anime"{
                return "动画"
            }else if t == "Video"{
                return "影视"
            }else if t == "Current language: "{
                return "当前语言："
            }else if t == "zh-CN"{
                return "简体中文"
            }else if t == "Add title"{
                return "添加标题"
            }else if t == "Category: "{
                return "分类："
            }else if t == "Tag: "{
                return "标签："
            }else if t == "Custom YAML"{
                return "自定义YAML"
            }else if t == "Summary: "{
                return "摘要："
            }else if t == "Cancel"{
                return "取消"
            }else if t == "Delete"{
                return "删除"
            }else if t == "Update"{
                return "更新"
            }else if t == "Name"{
                return "名称"
            }else if t == "Thumb Url"{
                return "图片链接"
            }else if t == "Description"{
                return "描述"
            }else if t == "Japanese Name"{
                return "日文名称"
            }else if t == "Chinese Name"{
                return "简体中文名称"
            } else if t == "My friends" {
                return "我的朋友们"
            } else if t == "Book Shelf" {
                return "书架"
            } else if t == "TV series" {
                return "影视"
            }
        }else if language == "zh-TW" {
            if t == "Post" {
                return "文章"
            }else if t == "Link" {
                return "連結"
            }else if t == "Book" {
                return "書籍"
            }else if t == "Anime"{
                return "動畫"
            }else if t == "Video"{
                return "影視"
            }else if t == "Current language: "{
                return "當前語言："
            }else if t == "zh-TW"{
                return "正體中文"
            }else if t == "Add title"{
                return "加入標題"
            }else if t == "Category: "{
                return "分類："
            }else if t == "Tag: "{
                return "標籤："
            }else if t == "Custom YAML"{
                return "自訂YAML"
            }else if t == "Summary: "{
                return "簡介："
            }else if t == "Cancel"{
                return "取消"
            }else if t == "Delete"{
                return "刪除"
            }else if t == "Update"{
                return "更新"
            }else if t == "Name"{
                return "名稱"
            }else if t == "Thumb Url"{
                return "圖片連結"
            }else if t == "Description"{
                return "描述"
            }else if t == "Japanese Name"{
                return "日文名稱"
            }else if t == "Chinese Name"{
                return "正體中文名稱"
            } else if t == "My friends" {
                return "我的朋友們"
            } else if t == "Book Shelf" {
                return "書架"
            } else if t == "TV series" {
                return "影視"
            }
        } else {
            if t == "Chinese Name"{
                return "English Name"
            } else if t == "Video" {
                return "TV series"
            }
            return t
        }
        return "placeholder"
    }
}
