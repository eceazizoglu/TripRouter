//
//  RoutePoint.swift
//  TripRouter
//
//  Created by New on 11.12.2019.
//  Copyright © 2019 TripRouter. All rights reserved.
//

import Foundation
//Restorant and places
struct RoutePlace : Codable{
    let name : String
    let lat : Double
    let lon : Double
    let arrival_time : String
    let departure_time : String
    let category : [String]
    let duration : Int
    let id: String
    let type: String
}
