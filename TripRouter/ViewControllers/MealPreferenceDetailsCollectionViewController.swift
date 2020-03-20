//
//  MealPreferenceDetailsCollectionViewController.swift
//  TripRouter
//
//  Created by New on 7.12.2019.
//  Copyright © 2019 TripRouter. All rights reserved.
//

import UIKit

extension MealPreferenceDetailsCollectionViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mealDataSource.mealArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "MealPreferenceCell", for: indexPath) as! PreferencesDetailsCollectionViewCell
        let object = mealDataSource.mealArray[indexPath.row]
        item.collectionViewImage.image = UIImage(named: object.imageName)
        item.collectionViewLabel.text = object.label
        let layer = item.layer
              
              item.collectionViewImage.image = UIImage(named: object.imageName)
              item.collectionViewLabel.text = object.label
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

class MealPreferenceDetailsCollectionViewController: UIViewController {
    @IBOutlet weak var mealPreferencesCollectionView: UICollectionView!
    @IBOutlet weak var continueButtonMeal: UIButton!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var priceLabel: UILabel!
    
    let mealDataSource = MealsDataSource()
    var finalDataSource: FinalDataSource  = FinalDataSource.getInstance()
    
    let columnLayout = ColumnFlowLayout(
        cellsPerRow: 3,
        minimumInteritemSpacing: 10,
        minimumLineSpacing: 10,
        sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    )
    
    @IBAction func continuePressed(_ sender: UIButton) {
        for cell in mealPreferencesCollectionView.indexPathsForSelectedItems! {
            
            selectedIndices.append(mealDataSource.mealArray[cell.item].name)
        }
        
        finalDataSource.meals = selectedIndices
        selectedIndices = []
        print(finalDataSource.meals)
    }
    
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        if(Int(sender.value)==1){
            priceLabel.text="$"
        }else if(Int(sender.value)==2){
            priceLabel.text="$$"
        }else if(Int(sender.value)==3){
            priceLabel.text="$$$"
        }else if(Int(sender.value)==4){
            priceLabel.text="$$$$"
        }else{
            priceLabel.text="$$$$$"
        }
        finalDataSource.mealPrice = Int(sender.value)
    }
    
    
    var selectedIndices: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        mealPreferencesCollectionView.allowsMultipleSelection = true
        mealPreferencesCollectionView?.collectionViewLayout = columnLayout
        columnLayout.buttonDesign(button: continueButtonMeal)
        
        
        for cell in mealPreferencesCollectionView.indexPathsForSelectedItems! {
            print(cell.item)
        }
        
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
