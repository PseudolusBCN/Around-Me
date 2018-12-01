//
//  DataManager.swift
//  Around Me
//
//  Created by Miquel Masip on 29/11/18.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DataManager: NSObject {
    override init() {
        super.init()
    }

    func getPointsListWithToken(_ pageToken: String, radius: Int, types: String, completion: @escaping (_ responseData: APIPlaces?, _ error: NSError?) -> Void) {
        let latitude = (LocationManager.sharedInstance().currentLocation?.coordinate.latitude)!
        let longitude = (LocationManager.sharedInstance().currentLocation?.coordinate.longitude)!

        let url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json"
        let params: [String: Any] = ["location": String(format: "%f,%f", latitude, longitude),
                                     "radius": radius,
                                     "types": types,
                                     "pagetoken": pageToken,
                                     "key": googleAPIKey]
        processServiceRequest(.get, url: url, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error)
                return
            }
            completion(response as? APIPlaces, nil)
        }
    }
    
    // MARK: - Private methods
    private func processServiceRequest(_ method: HTTPMethod, url: String, params: [String: Any], completion: @escaping (_ responseData: Any, _ error: NSError?) -> Void) {
        print("URL Request: \(url)")
        print("\(params)")

        //Alamofire.request(url, method: method, parameters: params, encoding: JSONEncoding.default, headers: nil)
        Alamofire.request(url, method: method, parameters: params, encoding: URLEncoding.default, headers: nil)
            .validate()
            .responseJSON(completionHandler: { response in
                guard response.result.isSuccess else {
                    let error = NSError(domain: "NSURLErrorDomain", code: 500, userInfo: [NSLocalizedDescriptionKey: response.result.error?.localizedDescription as Any])
                    completion(response, error)
                    return
                }
                completion(response.result.value, nil)
        })
    }
}
