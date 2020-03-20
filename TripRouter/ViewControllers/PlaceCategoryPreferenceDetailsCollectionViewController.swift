//
//  PlaceCategoryPreferenceDetailsCollectionViewController.swift
//  TripRouter
//
//  Created by New on 7.12.2019.
//  Copyright © 2019 TripRouter. All rights reserved.
//

import UIKit

extension PlaceCategoryPreferenceDetailsCollectionViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return placeCategoryDataSource.placeCategoryArray.count
    }
    
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "PlacePreferenceCell", for: indexPath) as! PreferencesDetailsCollectionViewCell
        let object = placeCategoryDataSource.placeCategoryArray[indexPath.row]
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

class PlaceCategoryPreferenceDetailsCollectionViewController: UIViewController {
    @IBOutlet weak var placeCategoryCollectionView: UICollectionView!
    @IBOutlet weak var continueButtonPlaceCategory: UIButton!
    
    let placeCategoryDataSource = PlaceCategoriesDataSource()
    var finalDataSource: FinalDataSource  = FinalDataSource.getInstance()
    
    let columnLayout = ColumnFlowLayout(
        cellsPerRow: 3,
        minimumInteritemSpacing: 10,
        minimumLineSpacing: 10,
        sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    )
    
    @IBAction func continuePressed(_ sender: UIButton) {
        for cell in placeCategoryCollectionView.indexPathsForSelectedItems! {
            
            selectedIndices.append(placeCategoryDataSource.placeCategoryArray[cell.item].name)
        }
        
        finalDataSource.places = selectedIndices
        selectedIndices = []
        print(finalDataSource.places)
        
    }
    
    var selectedIndices: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        placeCategoryCollectionView.allowsMultipleSelection = true
        placeCategoryCollectionView?.collectionViewLayout = columnLayout
        columnLayout.buttonDesign(button: continueButtonPlaceCategory)
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        
        
    }
    
    
}
