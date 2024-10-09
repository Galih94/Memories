//
//  DetailMemoryView.swift
//  Memories
//
//  Created by Galih Samudra on 08/10/24.
//

import MapKit
import PhotosUI
import SwiftUI


struct DetailMemoryView: View {
    @Environment(\.dismiss) var dismiss
    var memory: Memory
    
    var body: some View {
        VStack {
            if let image = memory.getImageFromData() {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
            }
            MapReader { proxy in
                Map(initialPosition: memory.getMapCameraPosition()) {
                    Marker("Here", coordinate: memory.getLocation())
                }
            }
        }
        .navigationTitle(memory.name)
    }
}

#Preview {
    DetailMemoryView(memory: Memory(imageData: Data(), name: "Swimming", latitude: 0, longitude: 0))
}
