//
//  WelcomeView.swift
//  Macondo
//
//  Created by Louis Shen on 2021/7/10.
//

import SwiftUI

struct WelcomeView : View {
    var body : some View {
        HStack(spacing: 0) {
            VStack(spacing: 0) {
                Image("512")
                    .resizable()
                    .frame(width: 256, height: 256)
                Text("Welcome to Macondo")
                    .font(.system(size: 40, weight: .regular))
                Spacer().frame(height: 10)
                Text("Version \(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "–")")
                    .foregroundColor(.secondary)
            }
            .frame(width: 540, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(Color(NSColor.windowBackgroundColor))
            
            VStack(spacing: 32) {
                VStack(alignment: .leading) {
                    NavigationView {
                    List {
                        NavigationLink(destination: ContentView()) {
                            VStack(alignment: .leading) {
                                Text("Placeholder").font(.headline)
                                Label("DB", systemImage: "folder")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .listStyle(SidebarListStyle())
                    }}
            }
            .frame(width: 260, alignment: .top)
            .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        }
    }
}
