//
//  Item.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 16.07.2023.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
