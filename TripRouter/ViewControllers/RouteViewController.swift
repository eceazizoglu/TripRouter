//
//  RouteViewController.swift
//  TripRouter
//
//  Created by SOS Z14-6 on 10.12.2019.
//  Copyright © 2019 TripRouter. All rights reserved.
//

import UIKit

extension RouteViewController: RouteDataSourceDelegate{
    func preferencesLoaded(routeList:[RouteCellObject]){
        dismiss(animated: false, completion: nil)
        self.routeArray=routeList
        self.routeCollectionView.reloadData()
    }
}

extension RouteViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return routeArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "RouteCell", for: indexPath) as! RouteCollectionViewCell
        
        let routeObject = routeArray[indexPath.row]
        item.endingTime.text = routeObject.endingTime
        item.startingTime.text = routeObject.startingTime
        if routeObject.type == "BT" {
            item.contentLabel1.text = "\(routeObject.contentLabel1) dk"
            item.contentLabel2.text = "\(routeObject.contentLabel2) km"
            item.routeImage.image = UIImage(named: "transportation")
        } else if routeObject.type == "P" {
            item.contentLabel1.text = routeObject.contentLabel1
            item.contentLabel2.text = "\(routeObject.contentLabel2) dk"
            item.routeImage.image = UIImage(named: "maps")
        } else if routeObject.type == "R" {
            item.contentLabel1.text = routeObject.contentLabel1
            item.contentLabel2.text = "\(routeObject.contentLabel2) dk"
            item.routeImage.image = UIImage(named: "meal")
        }
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

class RouteViewController: UIViewController {
    
    @IBOutlet weak var saveRouteButton: UIButton!
    @IBOutlet weak var routeCollectionView: UICollectionView!
    var selectedPreferences: Preference?
    let routeDataSource = RouteDataSource()
    var routeArray: [RouteCellObject] = []
    let screenSize: CGRect = UIScreen.main.bounds
    let columnLayout = ColumnLayoutRoute(
        cellsPerRow: 1,
        minimumInteritemSpacing: 20,
        minimumLineSpacing: 20,
        sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    )
    
    let alert = UIAlertController(title: nil, message: "Route Creating...", preferredStyle: .alert)
    let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        routeDataSource.delegate = self
        routeCollectionView?.collectionViewLayout = columnLayout
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating();
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
          
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        dismiss(animated: false, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
        if let pref = selectedPreferences{
            routeDataSource.loadRoute(selectedPreference: pref)
            
        }
        
    }
    
    
    @IBAction func saveRoute(_ sender: Any) {
        self.dismiss(animated: true, completion: {});
        self.navigationController!.popToRootViewController(animated: true);
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
