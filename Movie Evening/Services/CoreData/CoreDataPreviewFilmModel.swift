//
//  CoreDataPreviewFilmModel.swift
//  Movie Evening
//
//  Created by Ruslan Ismailov on 16/08/23.
//

import Foundation
import CoreData

struct CoreDataPreviewFilmModel: Identifiable, Hashable {
    
    let film: PreviewFilm
    
    var dataId: NSManagedObjectID {
        return film.objectID
    }
    
    var id: Int {
        return Int(film.id)
    }
    
    var name: String {
        return film.name ?? ""
    }
    
    var genres: [String] {
        return film.genres ?? [""]
    }
    
    var genreByGroup: String {
        return film.genresByGroup ?? ""
    }
    
    var poster: String {
        return film.poster ?? ""
    }
    
    var rating: Double {
        return film.rating 
    }
    
    var year: Int {
        return Int(film.year)
    }
    
    var liked: Bool {
        return film.liked
    }
}
