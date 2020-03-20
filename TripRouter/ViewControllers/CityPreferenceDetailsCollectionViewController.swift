//
//  PreferencesDetailsCollectionViewController.swift
//  TripRouter
//
//  Created by SOS Z14-6 on 5.12.2019.
//  Copyright © 2019 TripRouter. All rights reserved.
//

import UIKit

extension CityPreferenceDetailsCollectionViewController: UICollectionViewDataSource{
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return citiesDataSource.cityArray.count
    }
    
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "CityPreferenceCell", for: indexPath) as! PreferencesDetailsCollectionViewCell
        item.center.y = self.view.center.y - 250
        let object = citiesDataSource.cityArray[indexPath.row]
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

class CityPreferenceDetailsCollectionViewController: UIViewController {
    
    @IBOutlet weak var preferencesDetailsCollectionView: UICollectionView!
    @IBOutlet weak var continueButton: UIButton!
    
    let citiesDataSource = CitiesDataSource()
    var finalDataSource: FinalDataSource  = FinalDataSource.getInstance()
    
    var tableIndex: Int?
    
    let columnLayout = ColumnFlowLayout(
        cellsPerRow: 3,
        minimumInteritemSpacing: 10,
        minimumLineSpacing: 10,
        sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    )
    
    var selectedIndices: [String] = []
    
    @IBAction func continuePressed(_ sender: UIButton) {
        for cell in preferencesDetailsCollectionView.indexPathsForSelectedItems! {
            print(cell.item)
            if(cell.item == 0) {
                selectedIndices.append(citiesDataSource.cityArray[cell.item].name)
            }
            
        }

        finalDataSource.cities  = selectedIndices
        selectedIndices = []
        print(finalDataSource.cities)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        preferencesDetailsCollectionView.allowsMultipleSelection = true
        preferencesDetailsCollectionView?.collectionViewLayout = columnLayout
        
        columnLayout.buttonDesign(button: continueButton)
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
