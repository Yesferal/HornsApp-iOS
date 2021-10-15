//
//  ContentView.swift
//  HornsApp-iOS
//
//  Created by Yesferal Cueva on 1/10/21.
//

import SwiftUI
import HornsAppCore

struct ContentView: View {
    var text = TextDrawer(en: "English!", es: "Español!").text ?? "Fake text"
    var language: String = UserDefaults.standard.stringArray(forKey: "AppleLanguages")?.first ?? "Fake language"
    var body: some View {
        Text("Version: " + HornsAppCoreVersion().version)
            .padding()
        Text("Language: " + language + " - Text: " + text)
            .padding()
    }
    var error = Venue(id: "", name: "", latitude: "", longitude: "")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
