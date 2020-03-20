//
//  RouteCellObject.swift
//  TripRouter
//
//  Created by New on 11.12.2019.
//  Copyright © 2019 TripRouter. All rights reserved.
//

import Foundation

struct RouteCellObject {
    var imageName: String
    var startingTime: String
    var endingTime: String
    var contentLabel1: String // name for place, duration for transportation
    var contentLabel2: String // duration for place, distance for transportation
    var type: String
}
