//
//  ContentView.swift
//  HornsApp-iOS
//
//  Created by Yesferal Cueva on 1/10/21.
//

import SwiftUI
import HornsApp_Kotlin

struct ContentView: View {
    var body: some View {
        Text("Hello, world! " + Greeting().greeting())
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
