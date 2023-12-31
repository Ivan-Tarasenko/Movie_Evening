//
//  API.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 11.08.2023.
//

import Foundation
import Moya

enum API {
    case movie(page: Int, genre: String)
    case serial(page: Int, genre: String)
    case detail(movieID: Int)
    case top10
    case top250(page: Int)
}

extension API: TargetType {
    var baseURL: URL {
        guard let url = URL(string: Constants.baseURL) else { fatalError("invalid url")}
        return url
    }
    
    var path: String {
        switch self {
        case .movie , .serial, .top10, .top250:
            return Constants.path
        case .detail(movieID: let movieID):
            return Constants.path + String("/") + String(movieID)
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Moya.Task {
        switch self {
        case .movie(let page, let genre):
            return .requestParameters(
                parameters: [
                    "page": page,
                    "limit": "10",
                    "type": "movie",
                    "genres.name": genre
                            ],
                
                encoding: URLEncoding.default
                )
            
        case .serial(let page, let genre):
            return .requestParameters(
                parameters: [
                    "page": page,
                    "limit": "10",
                    "type": "tv-series",
                    "genres.name": genre
                            ],
                
                encoding: URLEncoding.default
                )
            
        case .top250(let page):
            return .requestParameters(
                parameters: [
                    "page": page,
                    "limit": "10",
                    "top250": "",
                            ],
                
                encoding: URLEncoding.default
                )
            
        case .top10:
            return .requestParameters(
                parameters: ["top10" : ""],
                
                encoding: URLEncoding.default
            )
            
        case .detail:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["X-API-KEY": "\(Constants.apiKey)"]
    }
}
