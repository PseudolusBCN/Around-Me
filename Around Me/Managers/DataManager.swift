//
//  DataManager.swift
//  Around Me
//
//  Created by Miquel Masip on 29/11/18.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import Localize

enum requestStatus: String {
    case requestOk = "OK"
    case zeroResults = "ZERO_RESULTS"
    case overQueryLimit = "OVER_QUERY_LIMIT"
    case requestDenied = "REQUEST_DENIED"
    case notFound = "NOT_FOUND"
    case errorUnknown = "UNKNOWN_ERROR"
}

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
                                     "language": "es",
                                     "pagetoken": pageToken,
                                     "key": googleAPIKey]
        processServiceRequest(.get, url: url, params: params) { (response, error) in
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            let mappedResponse = Mapper<APIPlaces>().map(JSONObject: response)
            if mappedResponse?.status == .requestOk || mappedResponse?.status == .zeroResults {
                completion(mappedResponse, nil)
            } else {
                completion(nil, self.processErrorRequest((mappedResponse?.status!)!))
            }
        }
    }
    
    // MARK: - Private methods
    private func processErrorRequest(_ status: requestStatus) -> NSError {
        switch status {
        case .overQueryLimit:
            return NSError(domain: "NSURLErrorDomain", code: 500, userInfo: [NSLocalizedDescriptionKey: "generic.error.request.overQuery".localized])
        case .requestDenied:
            return NSError(domain: "NSURLErrorDomain", code: 500, userInfo: [NSLocalizedDescriptionKey: "generic.error.request.denied".localized])
        case .notFound:
            return NSError(domain: "NSURLErrorDomain", code: 500, userInfo: [NSLocalizedDescriptionKey: "generic.error.request.notFound".localized])
        case .errorUnknown:
            return NSError(domain: "NSURLErrorDomain", code: 500, userInfo: [NSLocalizedDescriptionKey: "generic.error.request.unknown".localized])
        default:
            return NSError(domain: "NSURLErrorDomain", code: 500, userInfo: [NSLocalizedDescriptionKey: "generic.error.request.unknown".localized])
        }
    }
    
    private func processServiceRequest(_ method: HTTPMethod, url: String, params: [String: Any], completion: @escaping (_ responseData: Any?, _ error: NSError?) -> Void) {
        print("URL Request: \(url)")
        print("\(params)")
        
        Alamofire.request(url, method: method, parameters: params, encoding: URLEncoding.default, headers: nil)
            .validate()
            .responseJSON { response in
                guard response.result.isSuccess else {
                    let error = NSError(domain: "NSURLErrorDomain", code: 500, userInfo: [NSLocalizedDescriptionKey: response.result.error?.localizedDescription as Any])
                    completion(nil, error)
                    return
                }
                completion(response.result.value!, nil)
        }
    }
}
