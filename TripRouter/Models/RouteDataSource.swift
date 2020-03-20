//
//  RouteDataSource.swift
//  TripRouter
//
//  Created by New on 13.12.2019.
//  Copyright © 2019 TripRouter. All rights reserved.
//

import Foundation


protocol RouteDataSourceDelegate {
    func preferencesLoaded(routeList: [RouteCellObject])
}

extension RouteDataSourceDelegate{
    func prefrencesLoaded(routeList: [RouteCellObject]){ }
}

class RouteDataSource {
    var delegate : RouteDataSourceDelegate?
    let jsonDecoderHelper = JsonDecoderHelper()
    let baseURL = "https://triprouter.co/algorithm_ios"
    
    func loadRoute(selectedPreference: Preference){
        let session = URLSession.shared
        
        if let url = URL(string: "\(baseURL)/"){
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            let encoder = JSONEncoder()
            let uploadData = try! encoder.encode(selectedPreference)
            let prefString = String(data: uploadData, encoding: .utf8)!
            request.httpBody = prefString.data(using: .utf8)
            print(prefString)
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("error: \(error)")
                } else {
                    if let response = response as? HTTPURLResponse {
                        print("statusCode: \(response.statusCode)")
                    }
                    if let data = data, let dataString = String(data: data, encoding: .utf8) {
                        print(dataString)
                        let route = self.jsonDecoderHelper.decodeHelper(dataString: dataString)
                        print("girdi1")
                        DispatchQueue.main.async {
                            self.delegate?.preferencesLoaded(routeList: route)
                        }
                        
                    }
                }
                
            }
            
            dataTask.resume()
            
            
        }
                
    }
}
