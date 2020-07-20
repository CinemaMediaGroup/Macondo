//
//  ContentView.swift
//  Macondo
//
//  Created by Louis Joe Shen on 2020/7/12.
//  Copyright © 2020 Louise Joe Shen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Button(action: {
            Sqlite.createTables()
        }){
            Text("Init")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
