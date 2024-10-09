//
//  LocationFetcher.swift
//  Memories
//
//  Created by Galih Samudra on 09/10/24.
//

import CoreLocation
import MapKit
import SwiftUI

protocol Locator {
    var lastKnownLocation: CLLocationCoordinate2D? { get }
    var lastKnownCameraPosition: MapCameraPosition? { get }
    var defaultPosition: MapCameraPosition { get }
    func start()
}

class LocationFetcher: NSObject, Locator {
    let manager = CLLocationManager()
    var lastKnownLocation: CLLocationCoordinate2D?
    var lastKnownCameraPosition: MapCameraPosition? {
        guard let lastKnownLocation else { return nil}
        return MapCameraPosition.region(
            MKCoordinateRegion(center: lastKnownLocation,
                               span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)))
    }


    let defaultPosition = MapCameraPosition.region(
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
                           span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)))

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
