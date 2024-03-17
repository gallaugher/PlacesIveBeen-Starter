// File: PlacesListView.swift Project: PlacesIveBeen
// Created by: Prof. John Gallaugher on 3/5/24
// YouTube.com/profgallaugher  -  threads.net/john.gallaugher

import SwiftUI

struct PlacesListView: View {
    @State private var places = ["Valetta",
                                 "Istanbul",
                                 "Palmero",
                                 "Rome",
                                 "Venice",
                                 "Milan",
                                 "Zurich"]
    @State private var sheetIsPresented = false // used to toggle presentation of the sheet
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(places, id: \.self) { place in
                    NavigationLink {
                        // Destination
                        DetailView(placeName: place)
                    } label: {
                        Image(systemName: "mappin")
                            .foregroundStyle(.blue)
                        Text(place)
                    }
                    .font(.title)

                }
            }
            .listStyle(.plain)
            .navigationTitle("Places I've Been")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        //TODO: Action
                        sheetIsPresented.toggle() // Toggles to true so .sheet below is presented
                    } label: {
                        Image(systemName: "plus") // Note this is not a + character, it's a symbol. Apple HIG wants a symbol here.
                    }
                }
            }
        }
        .sheet(isPresented: $sheetIsPresented) {
            // Add a NavigationStack so that toolbar (where buttons are) shows when presented. Note this sheet modifier is NOT embedded inside the NavigationStack above. All sheets need a separate Navigation Stack
            NavigationStack {
                DetailView(placeName: "") // Pass in an empty value for placeName since, after pressing "+", we're entering a new "placeName"
            }
        }
    }
}

#Preview {
    PlacesListView()
}
