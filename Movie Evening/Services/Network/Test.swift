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
    
  
    var testDetailSerial: DetailResponse? {
        didSet {
            print(testDetailSerial?.name)
        }
    }
    
    init() {
//        testFetch()
        testRandom()
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
    
   
    func getDetailSerial() {
        network.fetchDetail(for: 3433) { result in
            switch result {
            case .success(let success):
                self.testDetailSerial = success
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func testRandom() {
        network.fenchRandomFilm { result in
            switch result {
            case .success(let success):
                print(success.name)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
