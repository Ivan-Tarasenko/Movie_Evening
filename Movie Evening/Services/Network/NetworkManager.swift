//
//  NetworkManager.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 13.08.2023.
//

import Foundation
import Moya

protocol Networkable {
    var provider: MoyaProvider<API> { get }
    
    func fetchMovie(page: Int, genre: String, completion: @escaping (Result<MovieResponse, NetworkError>) -> Void)
    
    func fetchDetailMovie(movieID: Int, completion: @escaping (Result<DetailMovieResponse, NetworkError>) -> Void)
    
    func fetchDetailSeril(serialID: Int, completion: @escaping (Result<DetailSerialResponse, NetworkError>) -> Void)
}

final class NetworkManager: Networkable {
    var provider = MoyaProvider<API>(plugins: [NetworkLoggerPlugin()])
    
    func fetchMovie(page: Int, genre: String, completion: @escaping (Result<MovieResponse, NetworkError>) -> Void) {
        provider.makeRequest(.movie(page: page, genre: genre), completion: completion)
    }
    
    func fetchDetailMovie(movieID: Int, completion: @escaping (Result<DetailMovieResponse, NetworkError>) -> Void) {
        provider.makeRequest(.detail(movieID: movieID), completion: completion)
    }
    
    func fetchDetailSeril(serialID: Int, completion: @escaping (Result<DetailSerialResponse, NetworkError>) -> Void) {
        provider.makeRequest(.detail(movieID: serialID), completion: completion)
    }
    
    
}
