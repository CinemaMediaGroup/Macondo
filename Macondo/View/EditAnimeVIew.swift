//
//  EditAnimeVIew.swift
//  Macondo
//
//  Created by Louis Shen on 2021/1/2.
//

import Foundation
import SwiftUI

struct EditAnimeView : View{
    @EnvironmentObject var showView : ViewNavigation
    
    @State var nameJA : String = ""
    @State var nameZH : String = ""
    @State var image : String = ""
    
    var aid : Int = 0
    
    init(aid : Int, language : String) {
        let ad : AnimeData = Sqlite.getAnimeData(aidd: aid, language: language)
        self.aid = aid
        _nameJA = State(initialValue: ad.getNameJA())
        _nameZH = State(initialValue: ad.getNameZH())
        _image = State(initialValue: ad.getImage())
    }
    
    var body : some View {
        VStack {
            TextField(T.me(t: "Japanese Name", language: self.showView.lang), text: $nameJA)
            TextField(T.me(t: "Chinese Name", language: self.showView.lang), text: $nameZH)
            TextField(T.me(t: "Thumb Url", language: self.showView.lang), text: $image)
            
            Spacer()
            HStack {
                Button(action: {
                    self.showView.showView = 0
                }) {
                    Text(T.me(t: "Cancel", language: self.showView.lang))
                }
                
                Button(action: {
                    Sqlite.deleteAnime(aidd: self.aid, language: self.showView.lang)
                    self.showView.showView = 0
                }) {
                    Text(T.me(t: "Delete", language: self.showView.lang))
                    .foregroundColor(Color.red)
                    .bold()
                }
                
                Button(action: {
                    Sqlite.editAnime(aidd: self.aid, nameJA: self.nameJA, nameZH: self.nameZH, image: self.image, language: self.showView.lang)
                    self.showView.showView = 0
                }) {
                    Text(T.me(t: "Update", language: self.showView.lang))
                }
                .disabled(nameJA.isEmpty || nameZH.isEmpty || image.isEmpty)
            }
            Spacer()
        }
        .padding()
    }
}
