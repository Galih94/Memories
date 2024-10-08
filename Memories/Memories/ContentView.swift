//
//  ContentView.swift
//  Memories
//
//  Created by Galih Samudra on 08/10/24.
//

import PhotosUI
import SwiftUI

struct ContentView: View {
    @State private var selectedItem: PhotosPickerItem?
    @State private var resultImage: Image?
    var body: some View {
        NavigationStack {
            VStack {
                PhotosPicker(selection: $selectedItem) {
                    if let resultImage {
                        /// handle show image here
                    } else {
                        ContentUnavailableView("No Memories", systemImage: "photo.badge.plus", description: Text("Insert new memories"))
                    }
                }
                .onChange(of: selectedItem, onSelectedNewImage)
            }
        }
        .navigationTitle("Memories")
    }
    
    private func onSelectedNewImage() {
        /// handle selected new image here
    }
}

#Preview {
    ContentView()
}
