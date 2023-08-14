//
//  MovieModel.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 21.07.2023.
//

import Foundation

struct MovieModel: Identifiable {
 
    let id = UUID()
    let urlImage: String
    let name: String
    let ratingImdb: Double
    let year: Int
}
