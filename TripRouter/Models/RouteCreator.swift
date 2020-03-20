//
//  RouteCreator.swift
//  TripRouter
//
//  Created by New on 13.12.2019.
//  Copyright © 2019 TripRouter. All rights reserved.
//

import Foundation

class RouteCreator{
    func Creator(routeObjectArray: [RoutePlace], transportationObjectArray: [RouteTransportation]) -> [RouteCellObject] {
        var routeArray: [RouteCellObject] = []
        var temp: RouteCellObject!
        for i in 0...(routeObjectArray.count-1){
            
            var temp = RouteCellObject(imageName: "historic", startingTime: routeObjectArray[i].arrival_time, endingTime: routeObjectArray[i].departure_time, contentLabel1: routeObjectArray[i].name, contentLabel2: "\(routeObjectArray[i].duration)", type: routeObjectArray[i].type)
                routeArray.append(temp)
            
            
            if i != routeObjectArray.count-1{
                
                let durationHour = transportationObjectArray[i].duration / 60
                let distanceKm = Double (transportationObjectArray[i].distance) / 1000.0
                var temp2 = RouteCellObject(imageName: "historic", startingTime: routeObjectArray[i].departure_time, endingTime: routeObjectArray[i+1].arrival_time, contentLabel1: "\(durationHour)", contentLabel2: String(format: "%.2f", distanceKm), type: transportationObjectArray[i].type)
                    routeArray.append(temp2)
                
            }
        }
        return routeArray
    }
}
