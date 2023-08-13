//
//  MovieResponse.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 13.08.2023.
//

import Foundation

// MARK: - Movie Response
struct MovieResponse: Codable {
    let docs: [Doc]
}

// MARK: - Doc
struct Doc: Codable {
    let rating: Rating
    let id: Int
    let name: String
    let year: Int
    let poster: Poster
    let names: [Name]
}

// MARK: - Name
struct Name: Codable {
    let name: String
    let language: String?
}

// MARK: - Poster
struct Poster: Codable {
    let previewURL: String

    enum CodingKeys: String, CodingKey {
        case previewURL = "previewUrl"
    }
}

//// MARK: - Rating
//struct Rating: Codable {
//    let imdb: Double
//    
//
//    enum CodingKeys: String, CodingKey {
//        case imdb
//    }
//}
