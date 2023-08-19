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
    
    func fetchMovie(page: Int, genre: String, completion: @escaping (Result<PreviewFilmResponse, NetworkError>) -> Void)
    
    func fetchSerial(page: Int, genre: String, completion: @escaping (Result<PreviewFilmResponse, NetworkError>) -> Void)
    
    func fetchDetail(for ID: Int, completion: @escaping (Result<DetailResponse, NetworkError>) -> Void)
}

final class NetworkManager: Networkable {
    var provider = MoyaProvider<API>(plugins: [NetworkLoggerPlugin()])
    
    func fetchMovie(page: Int, genre: String, completion: @escaping (Result<PreviewFilmResponse, NetworkError>) -> Void) {
        provider.makeRequest(.movie(page: page, genre: genre), completion: completion)
    }
    
    func fetchSerial(page: Int, genre: String, completion: @escaping (Result<PreviewFilmResponse, NetworkError>) -> Void) {
        provider.makeRequest(.serial(page: page, genre: genre), completion: completion)
    }
    
    func fetchDetail(for ID: Int, completion: @escaping (Result<DetailResponse, NetworkError>) -> Void) {
        provider.makeRequest(.detail(movieID: ID), completion: completion)
    }
    
    func fenchTop10(completion: @escaping (Result<PreviewFilmResponse, NetworkError>) -> Void) {
        provider.makeRequest(.top10, completion: completion)
    }
    
    func fetchTop250(page: Int, comletion: @escaping (Result<PreviewFilmResponse, NetworkError>) -> Void) {
        provider.makeRequest(.top250(page: page), completion: comletion)
    }
}
