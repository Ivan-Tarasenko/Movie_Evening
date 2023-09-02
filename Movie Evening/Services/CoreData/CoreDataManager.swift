//
//  CoreDataManager.swift
//  Movie Evening
//
//  Created by Ruslan Ismailov on 16/08/23.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    let queue = DispatchQueue(label: "com.coreData.manager")
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func getAllTasks() -> [PreviewFilm] {
        
        let request: NSFetchRequest<PreviewFilm> = PreviewFilm.fetchRequest()
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
        
    }
    
    func save() {
        do {
            try viewContext.save()
        } catch {
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }
    
    
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "MovieEveningDataBase")
        
        let storeDescription = persistentContainer.persistentStoreDescriptions.first
        storeDescription?.shouldMigrateStoreAutomatically = true
        storeDescription?.shouldInferMappingModelAutomatically = true
        
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Unable to initialize Core Data Stack \(error)")
            }
        }
        
    }
}

//Mark: Preview movies methods
extension CoreDataManager {
    
    func fetchItem(withAttributeID attributeValue: String) -> PreviewFilm? {
        let fetchRequest: NSFetchRequest<PreviewFilm> = PreviewFilm.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", attributeValue)
        
        do {
            let items = try viewContext.fetch(fetchRequest)
            return items.first
        } catch {
            print("Ошибка при выполнении запроса: \(error.localizedDescription)")
            return nil
        }
    }
    
    func getOrSaveAllMovies(data: PreviewFilmResponse, genres: AllGenres, completition: @escaping ([CoreDataPreviewFilmModel]?) -> ()){
        queue.async {
            
            for film in data.docs {
                let dataFilm = PreviewFilm(context: self.viewContext)

                let idFilm = self.fetchItem(withAttributeID: String(film.id))
                
                if idFilm == nil {
                    dataFilm.id = Int64(film.id)
                    dataFilm.name = film.name
                    dataFilm.poster = film.poster.previewURL
                    dataFilm.rating = film.rating.imdb
                    dataFilm.year = Int64(film.year)
                    dataFilm.liked = false
                    dataFilm.genresByGroup = genres.rawValue
                    
                    var genres: [String] = []
                    for genre in film.genres {
                        genres.append(genre.name)
                    }
                    dataFilm.genres = genres
                    self.save()
//                    if dataFilm.name == "" || dataFilm.name == nil {
//                        return
//                    } else {
//                        self.save()
//                    }
                    
                }
                
            }
            
            if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                print("++ Data base in: \(documentsDirectory)")
            }
            
            let tasks = self.getAllTasks().map(CoreDataPreviewFilmModel.init)
            
            if tasks != [] {
                completition(tasks)
            } else {
                completition(nil)
            }
        }
    }
}

//Mark: Detail movies methods
extension CoreDataManager {
    
    func fetchDetailFilm(id: String) -> DetailFilm? {
        let fetchRequest: NSFetchRequest<DetailFilm> = DetailFilm.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        
        do {
            let items = try viewContext.fetch(fetchRequest)
            return items.first
        } catch {
            print("Ошибка при выполнении запроса: \(error.localizedDescription)")
            return nil
        }
    }
    
    func checkSimilarMovie(id: String) -> SimilarMovies? {
        let fetchRequest: NSFetchRequest<SimilarMovies> = SimilarMovies.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        
        do {
            let items = try viewContext.fetch(fetchRequest)
            return items.first
        } catch {
            print("Ошибка при выполнении запроса: \(error.localizedDescription)")
            return nil
        }
    }
    
    func addOrGetDetailedFIlm(data: DetailResponse, id: Int, completition: @escaping (DetailFilm?) -> ()){
        queue.async {
            
            let dataFilm = DetailFilm(context: self.viewContext)
            let idFilm = self.fetchDetailFilm(id: String(id))
            
            if idFilm == nil {
                dataFilm.id = Int64(id)
                dataFilm.filmDescriprion = data.description
                var genres: [String] = []
                for genre in data.genres {
                    genres.append(genre.name)
                }
                dataFilm.genres = genres
                dataFilm.name = data.name
                dataFilm.poster = data.poster.previewURL
                dataFilm.ratingKP = data.rating.kp
                dataFilm.ratingImdb = data.rating.imdb
                
                for trailer in data.videos.trailers {
                    let trailerInDB = Trailers(context: self.viewContext)
                    trailerInDB.detailFilm = dataFilm
                    
                    trailerInDB.name = trailer.name
                    trailerInDB.site = trailer.site
                    trailerInDB.url = trailer.url
                }
                
                
                for movie in data.similarMovies {
                    let similarMovies = SimilarMovies(context: self.viewContext)
                    similarMovies.detailFilm = dataFilm
                    
                    similarMovies.id = Int64(movie.id)
                    similarMovies.name = movie.name
                    similarMovies.poster = movie.poster.previewURL
                }
                
                for person in data.persons {
                    let actor = Actors(context: self.viewContext)
                    actor.detailFilm = dataFilm
                    
                    actor.id = Int64(person.id)
                    actor.image = person.photo
                    actor.name = person.name
                }
                
                if dataFilm.name == "" || dataFilm.name == nil {
                    completition(nil)
                } else {
                    self.save()
                    
                    completition(dataFilm)
                }
                
            } else {
                completition(idFilm)
            }
            
            if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                print("++ Data base in: \(documentsDirectory)")
            }
        }
    }
}
