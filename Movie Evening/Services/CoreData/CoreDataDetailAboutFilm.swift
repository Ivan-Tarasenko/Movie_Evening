//
//  CoreDataDetailAboutFilm.swift
//  Movie Evening
//
//  Created by Ruslan Ismailov on 22/08/23.
//

import Foundation
import CoreData

struct CoreDataDetailAboutFilm: Identifiable, Hashable {
    
    let film: DetailFilm
    
    var id: NSManagedObjectID {
        return film.objectID
    }
    
    var name: String {
        return film.name ?? ""
    }
    
    var filmDescription: String {
        return film.filmDescriprion ?? ""
    }
    
    var genres: [String] {
        return film.genres ?? [""]
    }
    
    var poster: String {
        return film.poster ?? ""
    }
    
    var trailers: [String] {
        return film.trailers ?? [""]
    }
    
    var ratingImdb: Double {
        return film.ratingImdb
    }
    
    var ratingKP: Double {
        return film.ratingKP
    }
    
    
}
