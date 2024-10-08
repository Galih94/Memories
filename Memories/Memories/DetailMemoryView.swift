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
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        if let item {
            // Display the selected image
            item
                .resizable()
                .scaledToFit()
                .frame(height: 200)
        }
    }
}

#Preview {
    DetailMemoryView(item: nil)
}
