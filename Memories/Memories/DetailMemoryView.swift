//
//  DetailMemoryView.swift
//  Memories
//
//  Created by Galih Samudra on 08/10/24.
//

import PhotosUI
import SwiftUI

struct DetailMemoryView: View {
    var item: Image?
    @State private var name: String = ""
    var body: some View {
        VStack {
            TextField("Input the name of memory", text: $name)
            if let item {
                // Display the selected image
                item
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
            }
            Button("Confirm") {
                
            }
            .disabled(item == nil)
        }
        .padding()
        Spacer()
    }
}

#Preview {
    DetailMemoryView(item: nil)
}
