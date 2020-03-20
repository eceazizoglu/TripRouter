//
//  PreferencesTableViewController.swift
//  TripRouter
//
//  Created by SOS Z14-6 on 4.12.2019.
//  Copyright © 2019 TripRouter. All rights reserved.
//

import UIKit

extension PreferencesTableViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        preferencesDataSource.preferencesLabelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PreferenceCell", for: indexPath) as! PreferencesTableViewCell
        let preferenceLable = preferencesDataSource.preferencesLabelArray[indexPath.row]
        cell.preferenceLabel.text = preferenceLable
        return cell
    }
    
    
}


class PreferencesTableViewController: UIViewController {
    
    let preferencesDataSource = PreferencesDataSource()
    
    @IBOutlet weak var preferencesTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title="Your Trip Preferences"

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let cell = sender as! PreferencesTableViewCell
        let indexPath = preferencesTableView.indexPath(for: cell)
        if let indexPath = indexPath {
            let destination = segue.destination as! PreferencesDetailsCollectionViewController
            destination.tableIndex = indexPath.row
        }
    }
    

}
