//
//  DetailMovieResponse.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 13.08.2023.
//

import Foundation

// MARK: - Welcome
struct DetailMovieResponse: Codable {
    let externalID: ExternalID
    let rating: Rating
    let backdrop: Backdrop
    let movieLength, id: Int
    let type, name, description: String
    let year: Int
    let poster: Backdrop
    let genres, countries: [Country]
    let videos: Videos
    let persons: [Person]
    let names: [Name]
    let similarMovies: [SimilarMovie]
    let ageRating: Int
    let logo: Logo
    let watchability: Watchability
    let top10, top250: JSONNull?

    enum CodingKeys: String, CodingKey {
        case externalID = "externalId"
        case rating, backdrop, movieLength, id, type, name, description, year, poster, genres, countries, videos, persons, names, similarMovies, ageRating, logo, watchability, top10, top250
    }
}
//
//// MARK: - Backdrop
//struct Backdrop: Codable {
//    let url, previewURL: String
//
//    enum CodingKeys: String, CodingKey {
//        case url
//        case previewURL = "previewUrl"
//    }
//}
//
//// MARK: - Country
//struct Country: Codable {
//    let name: String
//}
//
//// MARK: - ExternalID
//struct ExternalID: Codable {
//    let kpHD, imdb: String
//    let tmdb: Int
//}
//
//// MARK: - Logo
//struct Logo: Codable {
//    let url: String
//}
//
//// MARK: - Person
//struct Person: Codable {
//    let id: Int
//    let photo: String
//    let name: String
//    let enName, description: String?
//    let profession, enProfession: String
//}
//
//// MARK: - SimilarMovie
//struct SimilarMovie: Codable {
//    let id: Int
//    let name: String
//    let alternativeName: String
//    let type: TypeEnum
//    let poster: Backdrop
//}
//
//enum TypeEnum: String, Codable {
//    case movie = "movie"
//}
//
//// MARK: - Videos
//struct Videos: Codable {
//    let trailers: [Trailer]
//}
//
//// MARK: - Trailer
//struct Trailer: Codable {
//    let url: String
//    let name, site, type: String
//}
//
//// MARK: - Watchability
//struct Watchability: Codable {
//    let items: [Item]
//}
//
//// MARK: - Item
//struct Item: Codable {
//    let name: String
//    let logo: Logo
//    let url: String
//}
//
//// MARK: - Encode/decode helpers
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
