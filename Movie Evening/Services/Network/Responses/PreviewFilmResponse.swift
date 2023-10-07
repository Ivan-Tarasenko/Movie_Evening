//
//  PreviewFilmResponse.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 13.08.2023.
//

import Foundation

// MARK: - Movie Response
struct PreviewFilmResponse: Codable {
    let docs: [Doc]
}

// MARK: - Doc
struct Doc: Codable {
    let rating: Rating
    let id: Int
    let name: String
    let year: Int
    let poster: Poster
    let genres: [Genres]
    let names: [Name]
}

// MARK: - Poster
struct Poster: Codable {
    let previewURL: String

    enum CodingKeys: String, CodingKey {
        case previewURL = "previewUrl"
    }
}

struct Genres: Codable {
    let name: String
}
