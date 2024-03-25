// File: PlacesIveBeenApp.swift Project: PlacesIveBeen
// Created by: Prof. John Gallaugher on 3/5/24
// YouTube.com/profgallaugher  -  threads.net/john.gallaugher

import SwiftUI
import SwiftData

@main
struct PlacesIveBeenApp: App {
    var body: some Scene {
        WindowGroup {
            PlacesListView()
                .modelContainer(for: Place.self)
        }
    }
    
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
