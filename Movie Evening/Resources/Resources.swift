//
//  Resources.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 18.07.2023.
//

import Foundation
import SwiftUI

enum R {
    enum Strings {
        static let titleMovie = Text("Movies")
        static let titleSerial = Text("Serials")
        static let titleRandom = Text("Random")
        static let titleFavorite = Text("Favorites")
    }
    
    enum Icons {
        static let iconMovie = Image(.movies)
        static let iconSerial = Image(.serials)
        static let iconRandom = Image(.random)
        static let iconFavorite = Image(.heart)
    }
}
