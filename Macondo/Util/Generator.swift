//
//  Generator.swift
//  Macondo
//
//  Created by Louis Joe Shen on 2020/10/8.
//

import Foundation

struct Generator{
    static private func generateMarkdownFile(post : PostData) -> String{
        let frontMatter = """
        ---
        title: \(post.getTitle())
        date: \(post.getCreated())
        updated: \(post.getModified())
        categories: [\(post.getCategory())]
        tags: [\(post.getTag())]
        description: \(post.getSummary())
        urlname: \(post.getCid())
        \(post.getThumbUrl())
        ---
        
        """
        //mathjax: true
        //thumbnail: \(post.getThumbUrl())
        return frontMatter + post.getText()
    }
    
    static func generate(directory : URL,language : String){
        let posts = Sqlite.getPostList(language: language)
        let postDir = directory.appendingPathComponent("_posts")
        for i in posts{
            let delta = generateMarkdownFile(post: i)
            let fileURL = postDir.appendingPathComponent(String(i.getCid()) + ".md")
            do {
                try delta.write(to: fileURL,atomically: false,encoding: .utf8)
            }catch{
                print(error)
            }
        }
    }
    
    static private func generateLink(link : LinksData) -> String{
        return """
            - title: \(link.getName())
              avatar: \(link.getImage())
              url: \(link.getUrl())
              description: \(link.getDescription())
        
        """
    }
    
    static func generateLinkDatas(directory : URL,language : String){
        let links = Sqlite.getLinkList(language: language)
        let linkDataDir = directory.appendingPathComponent("_data")
        
        let frontMatter = """
        - group:
          description:
          items:

        """
        
        var linkDataContents = ""
        for i in links {
            linkDataContents += generateLink(link: i)
        }
        
        let md = frontMatter + linkDataContents
        
        do{
            try md.write(to: linkDataDir.appendingPathComponent("friends.yml"), atomically: false, encoding: .utf8)
        } catch{
            print(error)
        }
    }
    
    static func generateLinks(directory : URL,language : String){
        let linkDir = directory.appendingPathComponent("friends")
        
        let frontMatter = """
        ---
        layout: friends
        title: 我的朋友们
        ---

        <!-- more -->

        """
        do{
            try frontMatter.write(to: linkDir.appendingPathComponent("index.md"), atomically: false, encoding: .utf8)
        }catch{
            print(error)
        }
    }
    
    static private func generateBook(book : BookData) -> String{
        return "<div class=\"bgm-item\"><div class=\"bgm-item-thumb\" style=\"background-image:url(\(book.getImage())\"></div><div class=\"bgm-item-info\"><span class=\"bgm-item-title main\">\(book.getName())</span><span class=\"bgm-item-title\">\(book.getISBN())</span><span class=\"bgm-item-title\">\(book.getLSBN())</span></div></div>"
    }
    
    static func generateBooks(directory : URL,language : String){
        let books = Sqlite.getBookList(language: language)
        let bookDir = directory.appendingPathComponent("moon.md")
        var bookContents = ""
        for i in books{
            bookContents += generateBook(book: i)
        }
        let frontMatter = """
        ---
        layout: page
        title: 月盈阁
        ---

        """
        let md = frontMatter + "<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/gh/LouiseDevTeam/ImagePack2@latest/css/bgm.min.css\" type=\"text/css\"><div class=\"bgm-collection\">" + bookContents + "</div>"
        do{
            try md.write(to: bookDir, atomically: false, encoding: .utf8)
        } catch{
            print(error)
        }
    }
    
    static private func generateAnime(anime : AnimeData) -> String{
        return "<div class=\"bgm-item\"><div class=\"bgm-item-thumb\" style=\"background-image:url(\(anime.getImage())\"></div><div class=\"bgm-item-info\"><span class=\"bgm-item-title main\">\(anime.getNameJA())</span><span class=\"bgm-item-title\">\(anime.getNameZH())</span></div></div>"
    }
    
    static func generateAnimes(directory : URL,language : String){
        let animes = Sqlite.getAnimeList(language: language)
        let animeDir = directory.appendingPathComponent("anime.md")
        var animeContents = ""
        for i in animes{
            animeContents += generateAnime(anime: i)
        }
        let frontMatter = """
        ---
        layout: page
        title: 看番
        ---

        """
        let md = frontMatter + "<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/gh/LouiseDevTeam/ImagePack2@latest/css/bgm.min.css\" type=\"text/css\"><div class=\"bgm-collection\">" + animeContents + "</div>"
        do{
            try md.write(to: animeDir, atomically: false, encoding: .utf8)
        } catch{
            print(error)
        }
    }
    
    static private func generateVideo(video : VideoData) -> String{
        return "<div class=\"bgm-item\"><div class=\"bgm-item-thumb\" style=\"background-image:url(\(video.getImage())\"></div><div class=\"bgm-item-info\"><span class=\"bgm-item-title main\">\(video.getNameJA())</span><span class=\"bgm-item-title\">\(video.getNameZH())</span></div></div>"
    }
    
    static func generateVideos(directory : URL,language : String){
        let videos = Sqlite.getVideoList(language: language)
        let videoDir = directory.appendingPathComponent("film.md")
        var videoContents = ""
        for i in videos{
            videoContents += generateVideo(video: i)
        }
        let frontMatter = """
        ---
        layout: page
        title: 追剧
        ---

        """
        let md = frontMatter + "<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/gh/LouiseDevTeam/ImagePack2@latest/css/bgm.min.css\" type=\"text/css\"><div class=\"bgm-collection\">" + videoContents + "</div>"
        do{
            try md.write(to: videoDir, atomically: false, encoding: .utf8)
        } catch{
            print(error)
        }
    }
    
    static func generateBackup(directory : URL,language : String){
        let dataDir = directory.appendingPathComponent("_data")
        var mac = [String]()
        
        let links = Sqlite.getLinkList(language: language)
        var linkDataContents = ""
        for i in links {
            linkDataContents += i.getName() + "|"
            linkDataContents += i.getUrl() + "|"
            linkDataContents += i.getImage() + "|"
            linkDataContents += i.getDescription() + "\n"
        }
        mac.append(linkDataContents)
        
        let books = Sqlite.getBookList(language: language)
        var bookDataContents = ""
        for i in books {
            bookDataContents += i.getImage() + "|"
            bookDataContents += i.getName() + "|"
            bookDataContents += i.getISBN() + "|"
            bookDataContents += i.getLSBN() + "\n"
        }
        mac.append(bookDataContents)
        
        let animes = Sqlite.getAnimeList(language: language)
        var animeDataContents = ""
        for i in animes {
            animeDataContents += i.getImage() + "|"
            animeDataContents += i.getNameJA() + "|"
            animeDataContents += i.getNameZH() + "\n"
        }
        mac.append(animeDataContents)
        
        let videos = Sqlite.getVideoList(language: language)
        var videoDataContents = ""
        for i in videos {
            videoDataContents += i.getImage() + "|"
            videoDataContents += i.getNameJA() + "|"
            videoDataContents += i.getNameZH() + "\n"
        }
        mac.append(videoDataContents)
        
        do{
            try mac[0].write(to: dataDir.appendingPathComponent("links.mac"), atomically: false, encoding: .utf8)
            try mac[1].write(to: dataDir.appendingPathComponent("books.mac"), atomically: false, encoding: .utf8)
            try mac[2].write(to: dataDir.appendingPathComponent("animes.mac"), atomically: false, encoding: .utf8)
            try mac[3].write(to: dataDir.appendingPathComponent("videos.mac"), atomically: false, encoding: .utf8)
        } catch{
            print(error)
        }
    }
}
