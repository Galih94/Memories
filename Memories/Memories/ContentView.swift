//
//  ContentView.swift
//  Memories
//
//  Created by Galih Samudra on 08/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                ContentUnavailableView("No Memories", systemImage: "photo.badge.plus", description: Text("Insert new memories"))
            }
        }
        .navigationTitle("Memories")
    }
}

#Preview {
    ContentView()
}
