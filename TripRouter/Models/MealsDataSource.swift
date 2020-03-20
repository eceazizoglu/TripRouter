//
//  MealsDataSources.swift
//  TripRouter
//
//  Created by SOS Z14-6 on 4.12.2019.
//  Copyright © 2019 TripRouter. All rights reserved.
//

import Foundation
class MealsDataSource{
    
    var mealArray: [CollectionViewObject] = []
    init(){
        mealArray.append(CollectionViewObject(name: "breakfast",label: "Breakfast", imageName: "food_breakfast"))
        mealArray.append(CollectionViewObject(name: "lunch",label: "Lunch", imageName: "food_lunch"))
        mealArray.append(CollectionViewObject(name: "dinner", label: "Dinner", imageName: "food_dinner"))
    }
}
