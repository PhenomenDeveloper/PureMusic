//
//  NetworkService.swift
//  PureMusic
//
//  Created by Lev Kolesnikov on 13/09/2019.
//  Copyright © 2019 Lev Kolesnikov. All rights reserved.
//

import UIKit
import Alamofire

protocol Networking {
    func fetchTracks(searchText: String, completion: @escaping (SearchResponse?) -> Void)
}

class NetworkService: Networking {
    
    func fetchTracks(searchText: String, completion: @escaping (SearchResponse?) -> Void) {
        let parameters = ["term" : "\(searchText)",
            "limit" : "10",
            "media" : "music"]
        
        Alamofire.request(API.url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            if let error = dataResponse.error {
                print("Error recevied requesting data \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = dataResponse.data else { return }
            
            let decoder = JSONDecoder()
            do {
                let objects = try decoder.decode(SearchResponse.self, from: data)
                completion(objects)
                
            } catch let jsonError {
                print("Failed to decode JSON", jsonError)
                completion(nil)
            }
        }
    }
    
}
