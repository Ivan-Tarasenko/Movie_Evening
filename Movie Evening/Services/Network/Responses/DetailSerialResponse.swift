//
//  DetailSerialResponse.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 13.08.2023.
//

import Foundation

//// MARK: - DetailSerialResponse
//struct DetailSerialResponse: Codable {
//    let status: String
//    let externalID: ExternalID
//    let rating: Rating
//    let backdrop: Backdrop
//    let id: Int
//    let type, name, description: String
//    let year: Int
//    let poster: Backdrop
//    let genres, countries: [Country]
//    let videos: Videos
//    let persons: [Person]
//    let names: [Country]
//    let color: String
//    let movieLength: JSONNull?
//    let similarMovies: [SimilarMovie]
//    let ageRating: Int
//    let logo: Logo
//    let watchability: Watchability
//    let releaseYears: [ReleaseYear]
//    let top10, top250: JSONNull?
//    let seriesLength: Int
//
//    enum CodingKeys: String, CodingKey {
//        case status
//        case externalID = "externalId"
//        case rating, backdrop, id, type, name, description, year, poster, genres, countries, videos, persons, names, color, movieLength, similarMovies, ageRating, logo, watchability, releaseYears, top10, top250, seriesLength
//    }
//}
//
//// MARK: - ReleaseYear
//struct ReleaseYear: Codable {
//    let start, end: Int
//}


    // MARK: - Welcome
    struct DetailSerialResponse: Codable {
        let status: String
        let externalID: ExternalID
        let rating: Rating
        let backdrop: Backdrop
        let id: Int
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
        let releaseYears: [ReleaseYear]
        let top10, top250: JSONNull?
        let seriesLength: Int

        enum CodingKeys: String, CodingKey {
            case status
            case externalID = "externalId"
            case rating, backdrop, id, type, name, description, year, poster, genres, countries, videos, persons, names, similarMovies, ageRating, logo, watchability, releaseYears, top10, top250, seriesLength
        }
    }

    // MARK: - Backdrop
    struct Backdrop: Codable {
        let url, previewURL: String

        enum CodingKeys: String, CodingKey {
            case url
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
    struct Person: Codable {
        let id: Int
        let photo: String
        let name: String?
        let enName: String
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
        let enName: JSONNull?
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

    // MARK: - Encode/decode helpers

    class JSONNull: Codable, Hashable {

        public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
        }

        public var hashValue: Int {
            return 0
        }

        public init() {}

        public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
        }
    }
