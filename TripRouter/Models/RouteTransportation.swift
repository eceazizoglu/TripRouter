//
//  RouteTransportation.swift
//  TripRouter
//
//  Created by New on 11.12.2019.
//  Copyright © 2019 TripRouter. All rights reserved.
//

import Foundation
struct RouteTransportation :Codable{
    let duration: Int //in second
    let distance: Int //in meter
    let type: String
}
