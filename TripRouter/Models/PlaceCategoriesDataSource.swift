//
//  PlaceCategoriesDataSources.swift
//  TripRouter
//
//  Created by SOS Z14-6 on 4.12.2019.
//  Copyright © 2019 TripRouter. All rights reserved.
//

import Foundation
class PlaceCategoriesDataSource{
    var placeCategoryArray: [CollectionViewObject] = []
    init(){
        placeCategoryArray.append(CollectionViewObject(name: "amusement",label: "Amusement", imageName: "amusement"))
        placeCategoryArray.append(CollectionViewObject(name: "art",label: "Art", imageName: "art"))
        placeCategoryArray.append(CollectionViewObject(name: "historic",label: "Historic", imageName: "historic"))
        placeCategoryArray.append(CollectionViewObject(name: "landmark",label: "Landmark", imageName: "landmark"))
        placeCategoryArray.append(CollectionViewObject(name: "park",label: "Park", imageName: "park"))
        placeCategoryArray.append(CollectionViewObject(name: "sea_side",label: "Sea Side", imageName: "sea_side"))
        placeCategoryArray.append(CollectionViewObject(name: "shopping",label: "Shopping", imageName: "shopping"))
    }
}
