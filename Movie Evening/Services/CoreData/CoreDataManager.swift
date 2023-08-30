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
//    
//    func checkSimilarMovie(id: Int) -> SimilarMovies? {
//        let fetchRequest: NSFetchRequest<SimilarMovies> = SimilarMovies.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
//        
//        do {
//            let items = try viewContext.fetch(fetchRequest)
//            return items.first
//        } catch {
//            print("Ошибка при выполнении запроса: \(error.localizedDescription)")
//            return nil
//        }
//    }
    
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
