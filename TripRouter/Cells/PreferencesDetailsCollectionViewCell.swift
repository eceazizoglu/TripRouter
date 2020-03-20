//
//  PreferencesDetailsCollectionViewCell.swift
//  TripRouter
//
//  Created by SOS Z14-6 on 5.12.2019.
//  Copyright © 2019 TripRouter. All rights reserved.
//

import UIKit

class PreferencesDetailsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionViewImage: UIImageView!
    @IBOutlet weak var collectionViewLabel: UILabel!
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                if (self.collectionViewLabel.text != "London" && self.collectionViewLabel.text != "Rome") {
                    backgroundColor = UIColor.orange
                }
                else {
                    self.isSelected = false
                }
                
            }
            else {
                backgroundColor = UIColor.white
            }
        }
        
    }
}
