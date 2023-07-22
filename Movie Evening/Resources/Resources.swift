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
        // Title on Tab Bar
        static let titleMovie = Text("Movies")
        static let titleSerial = Text("Serials")
        static let titleRandom = Text("Random")
        static let titleFavorite = Text("Favorites")
        
        // Title on section
        static let top10 = Text("Top 10")
        static let top250 = Text("Top 250")
        static let comedy = Text("Comedies")
        static let cartoon = Text("Catroons")
        static let horror = Text("Horrors")
        
        static let fantastic = Text("Fantastic")
        static let thriller = Text("Thrillers")
        static let melodrama = Text("Melodramas")
        static let detective = Text("Detectives")
        static let fantasy = Text("Fantasy")
        
        static let military = Text("Military")
        static let family = Text("Family")
        static let anime = Text("Anime")
        static let historical = Text("Historical")
        static let drama = Text("Dramas")
        
        static let documentary = Text("Documentaries")
        static let baby = Text("Childish")
        static let crime = Text("Crime")
        static let biography = Text("Biographies")
        static let western = Text("Westerns")
        
        static let filmNoir = Text("Films-noir")
        static let sport = Text("Sports")
        static let musical = Text("Musicals")
        static let talkShow = Text("Talk shows")
        static let game = Text("Games")
    }
    
    enum Icons {
        static let iconMovie = Image(.movies)
        static let iconSerial = Image(.serials)
        static let iconRandom = Image(.random)
        static let iconFavorite = Image(.heart)
    }
}
