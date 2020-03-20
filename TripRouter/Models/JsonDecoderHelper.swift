//
//  JsonDecoderHelper.swift
//  TripRouter
//
//  Created by New on 13.12.2019.
//  Copyright © 2019 TripRouter. All rights reserved.
//

import Foundation

class JsonDecoderHelper{
    let routeCreator = RouteCreator()
    func decodeHelper(dataString: String) -> ([RouteCellObject]){
        let decoder = JSONDecoder()

        let a = dataString.components(separatedBy: ", \\\"transportation\\\": ")

        var transportation_str = a[1]

        transportation_str.removeLast(2)
        transportation_str = transportation_str.replacingOccurrences(of: "\\", with: "")
         let transportation = try! decoder.decode([RouteTransportation].self, from: Data(transportation_str.utf8))
        

         var route_str = a[0]
         route_str = route_str.replacingOccurrences(of: "\"{\\\"trip\\\": ", with: "")
         route_str = route_str.replacingOccurrences(of: "\\", with: "")
        
        let route = try! decoder.decode([RoutePlace].self, from: Data(route_str.utf8))
        
        return self.routeCreator.Creator(routeObjectArray: route, transportationObjectArray: transportation)
    }
}
