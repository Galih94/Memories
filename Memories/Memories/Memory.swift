//
//  Memory.swift
//  Memories
//
//  Created by Galih Samudra on 08/10/24.
//

import Foundation
import MapKit
import SwiftUI

struct Memory: Identifiable, Codable {
    var id = UUID()
    let imageData: Data
    let name: String
    let latitude: Double
    let longitude: Double
}

extension Memory: Comparable {
    static func < (lhs: Memory, rhs: Memory) -> Bool {
        return lhs.name < rhs.name
    }
}

extension Memory {
    func getImageFromData() -> Image? {
        guard let inputImage = UIImage(data: imageData) else { return nil }
        return Image(uiImage: inputImage)
    }
}

extension Memory {
    func getMapCameraPosition() -> MapCameraPosition {
        return MapCameraPosition.region(
            MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
                               span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)))
    }
    
    func getLocation() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
