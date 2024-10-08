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
    @State private var shouldNavigate: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                PhotosPicker(selection: $selectedItem) {
                    if let resultImage {
                        // Display the selected image
                        resultImage
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                    } else {
                        ContentUnavailableView("No Memories", systemImage: "photo.badge.plus", description: Text("Insert new memories"))
                    }
                }
                .onChange(of: selectedItem) {
                    guard let selectedItem else { return }
                    onSelectedNewImage(from: selectedItem)
                }
            }
            .navigationTitle("Memories")
            .navigationDestination(isPresented: $shouldNavigate) {
                DetailMemoryView(item: resultImage)
            }
        }
    }
    
    private func onSelectedNewImage(from item: PhotosPickerItem) {
        Task {
            guard let imageData = try await item.loadTransferable(type: Data.self) else { return }
            guard let inputImage = UIImage(data: imageData) else { return }
            resultImage = Image(uiImage: inputImage)
            shouldNavigate = true
        }
    }
}

#Preview {
    ContentView()
}
