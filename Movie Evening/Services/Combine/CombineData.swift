//
//  Combine.swift
//  Movie Evening
//
//  Created by Ruslan Ismailov on 24/08/23.
//

import Combine

class CombineData {
    
    static let shared = CombineData()
    
    private init(){}
    
    var sendedId = CurrentValueSubject<Int, Never>(0)
    var allCardsMovies = CurrentValueSubject<AllGenres, Never>(.actionMovie)
}
