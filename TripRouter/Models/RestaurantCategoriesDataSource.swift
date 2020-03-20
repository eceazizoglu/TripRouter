//
//  RestorantCategoriesDataSource.swift
//  TripRouter
//
//  Created by SOS Z14-6 on 4.12.2019.
//  Copyright © 2019 TripRouter. All rights reserved.
//

import Foundation
class RestaurantCategoriesDataSource{
    var restaurantCategoryArray: [CollectionViewObject] = []
    init(){
        restaurantCategoryArray.append(CollectionViewObject(name: "aegean",label: "Aegean", imageName: "aegean"))
        restaurantCategoryArray.append(CollectionViewObject(name: "cafe",label: "Cafe", imageName: "cafe"))
        restaurantCategoryArray.append(CollectionViewObject(name: "fast_food",label: "Fast Food", imageName: "fast_food"))
        restaurantCategoryArray.append(CollectionViewObject(name: "home_made",label: "Home Made", imageName: "home-made"))
        restaurantCategoryArray.append(CollectionViewObject(name: "meat",label: "Meat", imageName: "meat"))
        restaurantCategoryArray.append(CollectionViewObject(name: "patisserie",label: "Patisserie", imageName: "patisserie"))
        restaurantCategoryArray.append(CollectionViewObject(name: "seafood",label: "Sea Food", imageName: "seafood"))
        restaurantCategoryArray.append(CollectionViewObject(name: "turkish",label: "Turkish", imageName: "turkish"))
        restaurantCategoryArray.append(CollectionViewObject(name: "vegeterian",label: "Vegeterian", imageName: "vegeterian"))
    }
}
