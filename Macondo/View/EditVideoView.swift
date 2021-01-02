//
//  EditVideoView.swift
//  Macondo
//
//  Created by Louis Shen on 2021/1/2.
//

import Foundation
import SwiftUI

struct EditVideoView : View {
    @EnvironmentObject var showView : ViewNavigation
    
    @State var nameJA : String = ""
    @State var nameZH : String = ""
    @State var image : String = ""
    
    var vid : Int = 0;
    
    init(vid : Int, language : String){
        let vd : VideoData = Sqlite.getVideoData(vidd: vid, language: language)
        self.vid = vid
        _nameJA = State(initialValue: vd.getNameJA())
        _nameZH = State(initialValue: vd.getNameZH())
        _image = State(initialValue: vd.getImage())
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
                    Sqlite.deleteVideo(vidd: self.vid, language: self.showView.lang)
                    self.showView.showView = 0
                }) {
                    Text(T.me(t: "Delete", language: self.showView.lang))
                    .foregroundColor(Color.red)
                    .bold()
                }
                
                Button(action:{
                    Sqlite.editVideo(vidd: self.vid, nameJA: self.nameJA, nameZH: self.nameZH, image: self.image, language: self.showView.lang)
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
