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
            print(testMovies.count)
        }
    }
    
  
    var testDetailSerial: DetailResponse? {
        didSet {
            print(testDetailSerial?.name as Any)
        }
    }
    
    init() {
//        testFetch()
//        testRandom()
//        getDetailSerial()
//        fetchTop250()
    }
    
    func testFetch() {
        network.fetchMovie(page: 1, genre: .horrors) { result in
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
    
    func fetchTop250() {
        network.fetchTop250(page: 1) { result in
            switch result {
            case .success(let success):
                print(success.docs.count)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
