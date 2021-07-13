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
            TextField("Japanese Name", text: $nameJA)
            TextField("Chinese Name", text: $nameZH)
            TextField("Thumb Url", text: $image)
            
            Spacer()
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                HStack {
                    Button(action: {
                        Sqlite.deleteVideo(vidd: self.vid, language: self.showView.lang)
                        self.showView.showView = 5
                        self.nameJA = ""
                        self.nameZH = ""
                        self.image = ""
                        
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(Color.red)
                    }
                    
                    Button(action:{
                        Sqlite.editVideo(vidd: self.vid, nameJA: self.nameJA, nameZH: self.nameZH, image: self.image, language: self.showView.lang)
                        self.showView.showView = 5
                    }) {
                        Image(systemName: "square.and.arrow.down")
                    }
                    .disabled(nameJA.isEmpty || nameZH.isEmpty || image.isEmpty)
                }
            }
        }
    }
}
