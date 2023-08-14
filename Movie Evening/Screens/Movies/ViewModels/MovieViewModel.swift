//
//  MovieViewModel.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 21.07.2023.
//

import Foundation

protocol MovieViewModelProtocol: ObservableObject {
    
    //    var sections: [SectionModel] { get }
    
    var mockMovies: [MovieModel] { get }
    
    var searchText: String { get set }
    
    var isSearch: Bool { get set }
    
    var activateModalView: Bool { get set }
    
}

let sections: [SectionModel] = [
    .init(titleSection: R.Strings.top10),
    .init(titleSection: R.Strings.top250),
    .init(titleSection: R.Strings.comedy),
    .init(titleSection: R.Strings.cartoon),
    .init(titleSection: R.Strings.horror),
    
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

final class MovieViewModel: MovieViewModelProtocol {
    
    let mockMovies: [MovieModel] = [
        .init(urlImage: "", name: "Джентельмены", ratingImdb: 8.5, year: 2019),
        .init(urlImage: "", name: "Джентельмены", ratingImdb: 8.5, year: 2019),
        .init(urlImage: "", name: "Джентельмены", ratingImdb: 8.5, year: 2019),
        .init(urlImage: "", name: "Джентельмены", ratingImdb: 8.5, year: 2019),
        .init(urlImage: "", name: "Джентельмены", ratingImdb: 8.5, year: 2019),
    ]
    
    @Published var searchText: String = ""
    
    @Published var isSearch: Bool = false
    
    @Published var activateModalView = false
    
    init() {}
}
