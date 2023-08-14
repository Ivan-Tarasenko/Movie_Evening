//
//  DetailResponse.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 13.08.2023.
//

import Foundation

// MARK: - DetailResponse
struct DetailResponse: Codable {
    let status: String?
    let externalID: ExternalID
    let rating: Rating
    let backdrop: Backdrop
    let id: Int
    let type, name, description: String
    let year: Int
    let poster: Backdrop
    let genres, countries: [Country]
    let videos: Videos
    let persons: [Persons]
    let names: [Name]
    let similarMovies: [SimilarMovie]
    let ageRating: Int
    let logo: Logo
    let watchability: Watchability
    let releaseYears: [ReleaseYear]?
    let top10, top250: Int?
    let seriesLength: Int?
    
    enum CodingKeys: String, CodingKey {
        case status
        case externalID = "externalId"
        case rating, backdrop, id, type, name, description, year, poster, genres, countries, videos, persons, names, similarMovies, ageRating, logo, watchability, releaseYears, top10, top250, seriesLength
    }
}


// MARK: - Name
struct Name: Codable {
    let name: String
    let language: String?
}


// MARK: - Backdrop
struct Backdrop: Codable {
    let previewURL: String
    
    enum CodingKeys: String, CodingKey {
        case previewURL = "previewUrl"
    }
}

// MARK: - Country
struct Country: Codable {
    let name: String
}

// MARK: - ExternalID
struct ExternalID: Codable {
    let kpHD, imdb: String
    let tmdb: Int
}

// MARK: - Logo
struct Logo: Codable {
    let url: String
}

// MARK: - Person
struct Persons: Codable {
    let id: Int
    let photo: String
    let name: String?
    let enName: String?
    let description: String?
    let profession, enProfession: String
}

// MARK: - Rating
struct Rating: Codable {
    let kp, imdb: Double
    
    enum CodingKeys: String, CodingKey {
        case kp, imdb
    }
}

// MARK: - ReleaseYear
struct ReleaseYear: Codable {
    let start, end: Int
}

// MARK: - SimilarMovie
struct SimilarMovie: Codable {
    let id: Int
    let name: String
    let alternativeName, type: String
    let poster: Backdrop
}

// MARK: - Videos
struct Videos: Codable {
    let trailers: [Trailer]
}

// MARK: - Trailer
struct Trailer: Codable {
    let url: String
    let name, site, type: String
}

// MARK: - Watchability
struct Watchability: Codable {
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let name: String
    let logo: Logo
    let url: String
}
