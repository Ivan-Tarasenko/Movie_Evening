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
        
        static let adventure = Text("Adventures")
        static let actionMovie = Text("Action Movie")
        
        // Section
        static let seeAll = Text("See All")
    }
    
    enum Icons {
        static let iconMovie = Image("movies")
        static let iconSerial = Image("serials")
        static let iconRandom = Image("random")
        static let iconFavorite = Image("heart")
    }
    
    enum Fonts {
        static let interExtraLight = "Inter-ExtraLight"
        static let interLight = "Inter-Light"
    }
    
    enum BoundsScreen {
        static let widthScreen = UIScreen.main.bounds.width
        static let heightScreen = UIScreen.main.bounds.height
    }
    
    enum Colors {
        static let cardBackground = LinearGradient(
            stops: [
                Gradient.Stop(color: Color("CardColor2"), location: 0.00),
                Gradient.Stop(color: Color("CardColor1"), location: 1.00),
            ],
            startPoint: UnitPoint(x: 0.5, y: 0),
            endPoint: UnitPoint(x: 0.5, y: 0.96)
        )
        
        static let borderBackground = LinearGradient(
            stops: [
                Gradient.Stop(color: Color("BorderColor1"), location: 0.00),
                Gradient.Stop(color: Color("BorderColor2"), location: 1.00),
            ],
            startPoint: UnitPoint(x: 0.5, y: 0),
            endPoint: UnitPoint(x: 0.5, y: 0.96)
        )
        
        static let MainBackground = Color(.black)
    }
}

let sections: [SectionModel] = [
    .init(titleSection: R.Strings.top10),
    .init(titleSection: R.Strings.top250),
    .init(titleSection: R.Strings.comedy),
    .init(titleSection: R.Strings.cartoon),
    .init(titleSection: R.Strings.horror),
    
        .init(titleSection: R.Strings.adventure),
    .init(titleSection: R.Strings.actionMovie),
    .init(titleSection: R.Strings.fantastic),
    .init(titleSection: R.Strings.thriller),
    .init(titleSection: R.Strings.melodrama),
    
        .init(titleSection: R.Strings.detective),
    .init(titleSection: R.Strings.fantasy),
    .init(titleSection: R.Strings.military),
    .init(titleSection: R.Strings.family),
    .init(titleSection: R.Strings.anime),
    
        .init(titleSection: R.Strings.historical),
    .init(titleSection: R.Strings.drama),
    .init(titleSection: R.Strings.documentary),
    .init(titleSection: R.Strings.baby),
    .init(titleSection: R.Strings.crime),
    
        .init(titleSection: R.Strings.biography),
    .init(titleSection: R.Strings.western),
    .init(titleSection: R.Strings.filmNoir),
    .init(titleSection: R.Strings.musical),
    .init(titleSection: R.Strings.sport),
    
        .init(titleSection: R.Strings.talkShow),
    .init(titleSection: R.Strings.game)
]
