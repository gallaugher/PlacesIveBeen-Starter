// File: DetailView.swift Project: PlacesIveBeen
// Created by: Prof. John Gallaugher on 3/5/24
// YouTube.com/profgallaugher  -  threads.net/john.gallaugher

import SwiftUI
import SwiftData

struct DetailView: View {
    @State var place: Place
    @State var city = ""
    @State private var selectedCountry: String? = nil // String? means this value can be nil or contain a "wrapped" String.
    @Environment(\.dismiss) private var dismiss // called like a function in our code
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("City:")
                .bold()
            TextField("enter a city", text: $city)
                .textFieldStyle(.roundedBorder)
                .padding(.bottom)
            
            HStack {
                Text("Country")
                    .bold()
                
                Picker ("", selection: $selectedCountry)  {
                    // First Text view is in case selectedCountry is nil
                    Text("No country selected")
                        .tag(nil as String?) // the tag specifies the value of selectedCountry
                    ForEach(Constants.countries, id: \.self) { country in
                        Text("\(Constants.countriesAndFlags[country] ?? "") \(country)")
                            .tag(country as String?) // tag specifies value for selectedCountry. Type is vital since this could be nil or a String, hence String?
                        
                    }
                }
            }
            
            Spacer()
        }
        .onAppear {
            city = place.city
            selectedCountry = place.country
        }
        .font(.title2)
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss() // This dismisses the view, using the Environment variable (which can be called as a function) that we defined above. To see dismiss in action, be sure to start the preview from PlacesListView or via the simulator.
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    //TODO: Add save code
                    place.city = city
                    place.country = selectedCountry
                    modelContext.insert(place)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    // IMPORTANT: To see the toolbar in the Preview on the Canvas, yoku need to wrap the DetailView below in a NavigationStack. That's because when viewing the Canvas from this file, the Preview is not starting from the prior PlacesListView, which does have a NavigationStack.
    NavigationStack {
        DetailView(place: Place(city: "Sydney", country: "Australia"))
    }
}
