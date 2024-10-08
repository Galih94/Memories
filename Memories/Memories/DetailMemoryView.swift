//
//  DetailMemoryView.swift
//  Memories
//
//  Created by Galih Samudra on 08/10/24.
//

import PhotosUI
import SwiftUI

struct DetailMemoryView: View {
    @Environment(\.dismiss) var dismiss
    var item: Image?
    @State private var name: String = ""
    @Binding var memories: [Memory]
    
    var body: some View {
        VStack {
            TextField("Input the name of memory", text: $name)
                .multilineTextAlignment(.center)
            if let item {
                // Display the selected image
                item
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
            }
            Button("Confirm") {
                guard let item else { return }
                memories.append(Memory(image: item, name: name))
                dismiss()
            }
            .disabled(item == nil)
        }
        .padding()
        Spacer()
    }
}

#Preview {
    DetailMemoryView(item: nil, memories: .constant([]))
}
