//
//  AddMemoryView.swift
//  Memories
//
//  Created by Galih Samudra on 08/10/24.
//

import SwiftUI

struct AddMemoryView: View {
    @Environment(\.dismiss) var dismiss
    var imageData: Data
    @State private var name: String = ""
    @Binding var memories: [Memory]
    var onSave: () -> Void
    
    var body: some View {
        VStack {
            TextField("Input the name of memory", text: $name)
                .multilineTextAlignment(.center)
            if let item = getImage(from: imageData) {
                // Display the selected image
                item
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
            }
            
        }
        .padding()
        .toolbar {
            Button("Confirm", systemImage: "add") {
                var temp = memories
                temp.append(Memory(imageData: imageData, name: name))
                memories = temp.sorted()
                onSave()
                dismiss()
            }
            .disabled(name == "")
        }
        Spacer()
    }
    
    private func getImage(from imageData: Data) -> Image? {
        guard let inputImage = UIImage(data: imageData) else { return nil }
        return Image(uiImage: inputImage)
    }
    
}

#Preview {
    AddMemoryView(imageData: Data(), memories: .constant([]), onSave: {})
}
