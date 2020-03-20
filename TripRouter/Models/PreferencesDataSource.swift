//
//  Preference.swift
//  TripRouter
//
//  Created by Ece Azizoğlu on 3.12.2019.
//  Copyright © 2019 TripRouter. All rights reserved.
//

import Foundation

struct PreferencesDataSource {
    var preferencesLabelArray: [String] = []
    
    init(){
        preferencesLabelArray.append("Where would you like to go?")
        preferencesLabelArray.append("Which meals do you prefer?")
        preferencesLabelArray.append("What type of places would you like to visit?")
        preferencesLabelArray.append("What type of food would you like to eat?")
    }
}
