//
//  Test.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 13.08.2023.
//

import Foundation

class Test {
    var network: NetworkManager = NetworkManager()
    
    var testMovies: [Doc]  = [] {
        didSet {
            print(testMovies[0].name)
        }
    }
    
    var testDetailMovie: DetailMovieResponse? {
        didSet {
            print(testDetailMovie?.name)
        }
    }
    
    var testDetailSerial: DetailSerialResponse? {
        didSet {
            print(testDetailSerial?.name)
        }
    }
    
    init() {
//        testFetch()
        testDetailFilm()
//        getDetailSerial()
    }
    
    func testFetch() {
        network.fetchMovie(page: 1, genre: "ужасы") { result in
            switch result {
            case .success(let success):
                self.testMovies = success.docs
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func testDetailFilm() {
        network.fetchDetailMovie(movieID: 535341) { result in
            switch result {
            case .success(let success):
                self.testDetailMovie = success
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func getDetailSerial() {
        network.fetchDetailSeril(serialID: 1120247) { result in
            switch result {
            case .success(let success):
                self.testDetailSerial = success
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
