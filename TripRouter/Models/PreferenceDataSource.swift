//
//  PreferenceDataSource.swift
//  TripRouter
//
//  Created by Ece Azizoğlu on 3.12.2019.
//  Copyright © 2019 TripRouter. All rights reserved.
//

import Foundation

class PreferenceDataSource {
    var preferenceArray: [Preference] = []
    
    init() {
        preferenceArray.append(Preference(name: "Cities"))
        preferenceArray.append(Preference(name: "Places"))
        preferenceArray.append(Preference(name: "Meals"))
        preferenceArray.append(Preference(name: "Cuisines"))
        
    }
}

