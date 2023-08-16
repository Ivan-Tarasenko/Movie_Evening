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
    
}

final class MovieViewModel: MovieViewModelProtocol {
    
    var network: Test = Test()
    
    let mockMovies: [MovieModel] = [
        .init(urlImage: "", name: "Джентельмены", ratingImdb: 8.5, year: 2019),
        .init(urlImage: "", name: "Джентельмены", ratingImdb: 8.5, year: 2019),
        .init(urlImage: "", name: "Джентельмены", ratingImdb: 8.5, year: 2019),
        .init(urlImage: "", name: "Джентельмены", ratingImdb: 8.5, year: 2019),
        .init(urlImage: "", name: "Джентельмены", ratingImdb: 8.5, year: 2019),
    ]
    
    @Published var searchText: String = ""
    
    @Published var isSearch: Bool = false
    
    init() {}
}
