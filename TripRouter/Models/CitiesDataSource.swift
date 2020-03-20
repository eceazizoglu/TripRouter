//
//  CitiesDataSources.swift
//  TripRouter
//
//  Created by SOS Z14-6 on 4.12.2019.
//  Copyright © 2019 TripRouter. All rights reserved.
//

import Foundation

class CitiesDataSource{
    
    var cityArray: [CollectionViewObject] = []
    init(){
        cityArray.append(CollectionViewObject(name: "istanbul",label: "Istanbul", imageName: "istanbul"))
        cityArray.append(CollectionViewObject(name: "london",label: "London", imageName: "london"))
        cityArray.append(CollectionViewObject(name: "rome",label: "Rome", imageName: "rome"))
    }
}
