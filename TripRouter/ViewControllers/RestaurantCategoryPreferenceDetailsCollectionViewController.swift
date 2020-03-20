//
//  RestaurantCategoryPreferenceDetailsCollectionViewController.swift
//  TripRouter
//
//  Created by New on 7.12.2019.
//  Copyright © 2019 TripRouter. All rights reserved.
//

import UIKit

extension RestaurantCategoryPreferenceDetailsCollectionViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restaurantCategoriesDataSource.restaurantCategoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "RestaurantPreferenceCell", for: indexPath) as! PreferencesDetailsCollectionViewCell
        let object = restaurantCategoriesDataSource.restaurantCategoryArray[indexPath.row]
        item.collectionViewImage.image = UIImage(named: object.imageName)
        item.collectionViewLabel.text = object.label
        let layer = item.layer
        layer.cornerRadius = 10
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.3
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 1.7
        layer.shadowOpacity = 1.0
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: item.bounds, cornerRadius: layer.cornerRadius).cgPath
        item.backgroundColor = UIColor.white
        return item
    }
    
    
}

class RestaurantCategoryPreferenceDetailsCollectionViewController: UIViewController {
    @IBOutlet weak var restaurantCategoryCollectionView: UICollectionView!
    @IBOutlet weak var restaurantContinueButton: UIButton!
    
    let restaurantCategoriesDataSource = RestaurantCategoriesDataSource()
    var finalDataSource: FinalDataSource  = FinalDataSource.getInstance()
    var preferences: Preference?
    
    
    let columnLayout = ColumnFlowLayout(
        cellsPerRow: 3,
        minimumInteritemSpacing: 10,
        minimumLineSpacing: 10,
        sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    )
    
    @IBAction func continuePressed(_ sender: UIButton) {
        for cell in restaurantCategoryCollectionView.indexPathsForSelectedItems! {
            selectedIndices.append(restaurantCategoriesDataSource.restaurantCategoryArray[cell.item].name)
        }
        

        finalDataSource.restaurants = selectedIndices
        selectedIndices = []
        print()
        print("Your Preferences")
        
        print(finalDataSource.cities)
        print(finalDataSource.meals)
        print("Meal Price: ", finalDataSource.mealPrice)
        print(finalDataSource.places)
        print(finalDataSource.restaurants)
        
        preferences = Preference(city: finalDataSource.cities[0], country: "Turkey", diningPreferences: DiningPreferences(diningCategory: finalDataSource.restaurants, meals: finalDataSource.meals, priceSegment: finalDataSource.mealPrice), placePreferences: PlacePreferences(places: finalDataSource.places))
        print(preferences!)
    }
    
    
    var selectedIndices: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        restaurantCategoryCollectionView.allowsMultipleSelection = true
        restaurantCategoryCollectionView?.collectionViewLayout = columnLayout
        columnLayout.buttonDesign(button: restaurantContinueButton)
        
    }
    
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
        
        let destination = segue.destination as! RouteViewController
        destination.selectedPreferences = preferences!
        
     }
     
    
}
