//
//  Constants.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 11.08.2023.
//

import Foundation

enum Constants {
    static let baseURL = "https://api.kinopoisk.dev/v1.3/"
    static let path = "movie"
//    static let apiKey = "73RGG0S-NPBM7JF-G735BVT-01XY53G"
//    static let apiKey = "P61F8Q7-P6T4AY8-KQYYAQ8-W5DEH32"
    static let apiKey = "BZGNQX5-N9QM1X6-JZYG5MY-TNA0584"
    
    static let requestedGenres = ["комедия", "мультфильм", "ужасы", "приключения", "боевик", "фантастика", "триллер", "мелодрама", "детектив", "фэнтези", "военный", "семейный", "аниме", "история", "драма", "документальный", "детский", "криминал", "биография", "вестерн", "фильм-нуар", "спорт", "мюзикл", "ток-шоу", "игра"]
}


enum AllGenres: String, CaseIterable {
    case comedy = "комедия"
    case mult = "мультфильм"
    case horrors = "ужасы"
    case adventures = "приключения"
    case actionMovie = "боевик"
    case fantastic = "фантастика"
    case thriller = "триллер"
    case melodrama = "мелодрама"
    case detective = "детектив"
    case fantasy = "фэнтези"
    case military = "военный"
    case famaly = "семейный"
    case anime = "аниме"
    case history = "история"
    case drama = "драма"
    case documentary = "документальный"
    case kids = "детский"
    case criminal = "криминал"
    case biography = "биография"
    case western = "вестерн"
    case noir = "фильм-нуар"
    case sport = "спорт"
    case musical = "мюзикл"
    case tokShow = "ток-шоу"
    case game = "игра"
    
}
