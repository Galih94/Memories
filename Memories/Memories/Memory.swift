//
//  Memory.swift
//  Memories
//
//  Created by Galih Samudra on 08/10/24.
//

import Foundation
import SwiftUI

struct Memory: Identifiable, Codable {
    var id = UUID()
    let imageData: Data
    let name: String
}

extension Memory: Comparable {
    static func < (lhs: Memory, rhs: Memory) -> Bool {
        return lhs.name < rhs.name
    }
}

extension Memory {
    func getImageFromData() -> Image? {
        guard let inputImage = UIImage(data: imageData) else { return nil }
        return Image(uiImage: inputImage)
    }
}
