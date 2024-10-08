//
//  Memory.swift
//  Memories
//
//  Created by Galih Samudra on 08/10/24.
//

import Foundation
import SwiftUI

struct Memory: Identifiable {
    let id = UUID()
    let image: Image
    let name: String
}

extension Memory: Comparable {
    static func < (lhs: Memory, rhs: Memory) -> Bool {
        return lhs.name < rhs.name
    }
}
