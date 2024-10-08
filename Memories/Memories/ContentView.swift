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
    @State private var memories = [Memory]()
    
    var body: some View {
        NavigationStack {
            VStack {
                PhotosPicker(selection: $selectedItem) {
                    Text("Insert new memory")
                }
                .onChange(of: selectedItem) {
                    guard let selectedItem else { return }
                    onSelectedNewImage(from: selectedItem)
                }
                if memories.isEmpty {
                    ContentUnavailableView("No Memories", systemImage: "photo.badge.plus", description: Text("Insert new memories"))
                } else {
                    List(memories) { memory in
                        HStack {
                            memory.image
                                .resizable()
                                .scaledToFit()
                                .frame(height: 20)
                            Text(memory.name)
                        }
                    }
                }
            }
            .navigationTitle("Memories")
            .navigationDestination(isPresented: $shouldNavigate) {
                DetailMemoryView(item: resultImage, memories: $memories )
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
