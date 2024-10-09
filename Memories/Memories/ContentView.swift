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
    @State private var memories: [Memory]
    @State private var imageData: Data?
    
    let savePath = URL.documentsDirectory.appending(path: "SavedMemories")
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            memories = try JSONDecoder().decode([Memory].self, from: data)
        } catch {
            memories = []
        }
    }
    
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
                    ContentUnavailableView("No Memories", systemImage: "photo", description: Text("Insert new memories"))
                } else {
                    List(memories) { memory in
                        NavigationLink {
                            DetailMemoryView(memory: memory)
                        } label: {
                            HStack {
                                if let image = memory.getImageFromData() {
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 20)
                                }
                                Text(memory.name)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Memories")
            .navigationDestination(isPresented: $shouldNavigate) {
                AddMemoryView(imageData: imageData ?? Data(), memories: $memories, onSave: {
                    saveData()
                }, locationFetcher: LocationFetcher())
            }
        }
    }
    
    private func saveData() {
        do {
            let data = try JSONEncoder().encode(memories)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("error -- \(error.localizedDescription)")
        }
    }
    
    private func onSelectedNewImage(from item: PhotosPickerItem) {
        Task {
            guard let imageData = try await item.loadTransferable(type: Data.self) else { return }
            guard let inputImage = UIImage(data: imageData) else { return }
            self.imageData = imageData
            resultImage = Image(uiImage: inputImage)
            shouldNavigate = true
        }
    }
}

#Preview {
    ContentView()
}
