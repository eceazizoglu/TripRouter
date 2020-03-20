//
//  FinalDataSource.swift
//  TripRouter
//
//  Created by Ece Azizoğlu on 10.12.2019.
//  Copyright © 2019 TripRouter. All rights reserved.
//

import Foundation

class FinalDataSource{
    
    var cities: [String] = []
    var meals: [String] = []
    var mealPrice: Int = 3
    var places: [String] = []
    var restaurants: [String] = []
    
    static let sharedInstance = FinalDataSource()
    private init() {}
    
    public static func getInstance() -> FinalDataSource {
        return sharedInstance
    }
    
    
}


