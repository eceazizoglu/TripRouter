//
//  Preference.swift
//  TripRouter
//
//  Created by New on 13.12.2019.
//  Copyright © 2019 TripRouter. All rights reserved.
//

import Foundation

struct Preference : Codable {
    var city: String
    var country: String
    var diningPreferences: DiningPreferences
    var placePreferences: PlacePreferences
    
}

struct DiningPreferences: Codable {
    var diningCategory: Array<String>
    var meals: Array<String>
    var priceSegment: Int
}

struct PlacePreferences: Codable {
    var places: Array<String>
}
