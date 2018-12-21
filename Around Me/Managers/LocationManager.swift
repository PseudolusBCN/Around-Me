//
//  LocationManager.swift
//  Around Me
//
//  Created by Miquel Masip on 28/11/18.
//  Copyright © 2018 Miquel Masip. All rights reserved.
//

import UIKit
import CoreLocation

class LocationManager: NSObject {
    private static var instance: LocationManager?

    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    
    // MARK: - Singleton
    class func sharedInstance() -> LocationManager {
        guard let currentInstance = instance else {
            instance = LocationManager()
            return instance!
        }
        return currentInstance
    }
    
    class func clearInstance() {
        instance = nil
    }
    
    // MARK: - Init
    override init() {
        super.init()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
    }
    
    // MARK: - Public methods
    func startUpdatingLocation() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined, .restricted, .denied:
            locationManager.requestWhenInUseAuthorization()
            break
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            break
        }
    }
    
    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = locations.last!
        
        NotificationsManager().sendNotification(notificationLocationUpdated)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("LocationManager: Error \(error)")
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined, .restricted, .denied:
            NotificationsManager().sendNotification(notificationLocationUnauthorized)
            break
        case .authorizedAlways, .authorizedWhenInUse:
            NotificationsManager().sendNotification(notificationLocationAuthorized)
            locationManager.startUpdatingLocation()
            break
        }
    }
}
