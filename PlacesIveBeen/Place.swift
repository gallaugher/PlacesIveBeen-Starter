// File: Place.swift Project: PlacesIveBeen
// Created by: Prof. John Gallaugher on 3/19/24
// YouTube.com/profgallaugher  -  threads.net/john.gallaugher

import Foundation
import SwiftData

@Model
class Place {
    var city: String
    var country: String?
    
    init(city: String, country: String? = nil) {
        self.city = city
        self.country = country
    }
}
