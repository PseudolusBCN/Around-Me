//
//  APIPlaces.swift
//  Around Me
//
//  Created by Miquel Masip on 01/12/2018.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireJsonToObjects

class APIPlaces: EVNetworkingObject {
    var htmlAttributions: [Any?]?
    var nextPageToken: String?
    var results: [APIPlace]?
    var status: String?
//
//    required init() {
//        super.init()
//    }
}

class APIPlace: EVNetworkingObject {
    var geometry: APIPlaceGeometry
    var icon: String
    var id: String
    var name: String
    var photos: [APIPlacePhoto]
    var placeID: String
    var reference: String
    var scope: String
    var types: [String]
    var vicinity: String
    var openingHours: APIPlaceOpeningHours
    var plusCode: APIPlacePlusCode
    var rating: Double
    var priceLevel: Int

//    required init() {
//        super.init()
//    }
}

class APIPlaceGeometry: EVNetworkingObject {
    var location: APIPlaceLocation
    var viewport: APIPlaceViewport

//    required init() {
//        super.init()
//    }
}

class APIPlaceViewport: EVNetworkingObject {
    var northeast: APIPlaceLocation
    var southwest: APIPlaceLocation

//    required init() {
//        super.init()
//    }
}

class APIPlaceLocation: EVNetworkingObject {
    var lat: Double
    var lng: Double

//    required init() {
//        super.init()
//    }
}

class APIPlaceOpeningHours: EVNetworkingObject {
    var openNow: Bool = false

//    required init() {
//        super.init()
//    }
}

class APIPlacePhoto: EVNetworkingObject {
    var height: Int
    var htmlAttributions: [String]
    var photoReference: String
    var width: Int

//    required init() {
//        super.init()
//    }
}

class APIPlacePlusCode: EVNetworkingObject {
    var compoundCode: String
    var globalCode: String

//    required init() {
//        super.init()
//    }
}

//func newJSONDecoder() -> JSONDecoder {
//    let decoder = JSONDecoder()
//    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
//        decoder.dateDecodingStrategy = .iso8601
//    }
//    return decoder
//}
//
//func newJSONEncoder() -> JSONEncoder {
//    let encoder = JSONEncoder()
//    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
//        encoder.dateEncodingStrategy = .iso8601
//    }
//    return encoder
//}
//
//// MARK: - Alamofire response handlers
//extension DataRequest {
//    fileprivate func decodableResponseSerializer<T: Decodable>() -> DataResponseSerializer<T> {
//        return DataResponseSerializer { _, response, data, error in
//            guard error == nil else { return .failure(error!) }
//
//            guard let data = data else {
//                return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))
//            }
//
//            return Result { try newJSONDecoder().decode(T.self, from: data) }
//        }
//    }
//
//    @discardableResult
//    fileprivate func responseDecodable<T: Decodable>(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
//        return response(queue: queue, responseSerializer: decodableResponseSerializer(), completionHandler: completionHandler)
//    }
//
//    @discardableResult
//    func responseAPIPlaces(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<APIPlaces>) -> Void) -> Self {
//        return responseDecodable(queue: queue, completionHandler: completionHandler)
//    }
//}
//





//struct User: ResponseObjectSerializable, ResponseCollectionSerializable, CustomStringConvertible {
//    let username: String
//    let name: String
//
//    var description: String {
//        return "User: { username: \(username), name: \(name) }"
//    }
//
//    init?(response: HTTPURLResponse, representation: Any) {
//        guard
//            let username = response.url?.lastPathComponent,
//            let representation = representation as? [String: Any],
//            let name = representation["name"] as? String
//            else { return nil }
//
//        self.username = username
//        self.name = name
//    }
//}
//typealias Codable = Decodable & Encodable
//let decoder = JSONDecoder()
//let responseObject = try? decoder.decode(T.self, from: jsonData)
//The decoder (1) is an object that decodes instances of a data type from JSON objects.
//extension DataRequest{
//    /// @Returns - DataRequest
//    /// completionHandler handles JSON Object T
//    @discardableResult func responseObject<T: Decodable> (
//        queue: DispatchQueue? = nil ,
//        completionHandler: @escaping (DataResponse<T>) -> Void ) -> Self{
//
//        let responseSerializer = DataResponseSerializer<T> { request, response, data, error in
//            guard error == nil else {return .failure(BackendError.network(error: error!))}
//
//            let result = DataRequest.serializeResponseData(response: response, data: data, error: error)
//            guard case let .success(jsonData) = result else{
//                return .failure(BackendError.jsonSerialization(error: result.error!))
//            }
//
//            // (1)- Json Decoder. Decodes the data object into expected type T
//            // throws error when failes
//            let decoder = JSONDecoder()
//            guard let responseObject = try? decoder.decode(T.self, from: jsonData)else{
//                return .failure(BackendError.objectSerialization(reason: "JSON object could not be serialized \(String(data: jsonData, encoding: .utf8)!)"))
//            }
//            return .success(responseObject)
//        }
//        return response(queue: queue, responseSerializer: responseSerializer, completionHandler: completionHandler)
//    }
//
//    /// @Returns - DataRequest
//    /// completionHandler handles JSON Array [T]
//    @discardableResult func responseCollection<T: Decodable>(
//        queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<[T]>) -> Void
//        ) -> Self{
//
//        let responseSerializer = DataResponseSerializer<[T]>{ request, response, data, error in
//            guard error == nil else {return .failure(BackendError.network(error: error!))}
//
//            let result = DataRequest.serializeResponseData(response: response, data: data, error: error)
//            guard case let .success(jsonData) = result else{
//                return .failure(BackendError.jsonSerialization(error: result.error!))
//            }
//
//            let decoder = JSONDecoder()
//            guard let responseArray = try? decoder.decode([T].self, from: jsonData)else{
//                return .failure(BackendError.objectSerialization(reason: "JSON array could not be serialized \(String(data: jsonData, encoding: .utf8)!)"))
//            }
//
//            return .success(responseArray)
//        }
//        return response(responseSerializer: responseSerializer, completionHandler: completionHandler)
//    }
//}
