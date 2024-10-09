//
//  LocationFetcher.swift
//  Memories
//
//  Created by Galih Samudra on 09/10/24.
//

import CoreLocation

protocol Locator {
    var lastKnownLocation: CLLocationCoordinate2D? { get }
    func start()
}

class LocationFetcher: NSObject, Locator {
    let manager = CLLocationManager()
    var lastKnownLocation: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func start() {
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
}

extension LocationFetcher: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastKnownLocation = locations.first?.coordinate
    }
}
