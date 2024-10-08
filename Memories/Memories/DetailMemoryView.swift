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
    var memory: Memory
    
    var body: some View {
        VStack {
            Text(memory.name)
            if let image = memory.getImageFromData() {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
            }
        }
        .padding()
        Spacer()
    }
}

#Preview {
    DetailMemoryView(memory: Memory(imageData: Data(), name: "Swimming"))
}
