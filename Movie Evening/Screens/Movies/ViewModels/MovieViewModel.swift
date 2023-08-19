//
//  MovieViewModel.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 21.07.2023.
//

import Foundation
import CoreData

protocol MovieViewModelProtocol: ObservableObject {
    
    //    var sections: [SectionModel] { get }
    
    var mockMovies: [MovieModel] { get }
    
    var searchText: String { get set }
    
    var isSearch: Bool { get set }
    
    var tasks: [CoreDataPreviewFilmModel] { get set }
    
}

final class MovieViewModel: MovieViewModelProtocol {
    
//    var network: Test = Test()
    
    let mockMovies: [MovieModel] = [
        .init(urlImage: "", name: "Джентельмены", ratingImdb: 8.5, year: 2019),
        .init(urlImage: "", name: "Джентельмены", ratingImdb: 8.5, year: 2019),
        .init(urlImage: "", name: "Джентельмены", ratingImdb: 8.5, year: 2019),
        .init(urlImage: "", name: "Джентельмены", ratingImdb: 8.5, year: 2019),
        .init(urlImage: "", name: "Джентельмены", ratingImdb: 8.5, year: 2019),
    ]
    
    @Published var searchText: String = ""
    
    @Published var isSearch: Bool = false
    
    @Published var tasks: [CoreDataPreviewFilmModel] = {
        return CoreDataManager.shared.getAllTasks().map(CoreDataPreviewFilmModel.init)
    }()
    
    var previevFilms: [PreviewFilmResponse] = []
    
    let shared: Networkable = NetworkManager()
    
    let queue = DispatchQueue(label: "com.movieevening.app", qos: .background)
    
    init() {
        
        getfilms()
    }
    
    func getfilms() {
        
        shared.fetchMovie(page: 1, genre: "ужасы") { result in
            switch result {
            case .success(let response):
                print("++ \(response.docs )")
                self.save(data: response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getAllTasks() {
        tasks = CoreDataManager.shared.getAllTasks().map(CoreDataPreviewFilmModel.init)
        
        
    }
    
//    func delete(_ task: CoreDataPreviewFilmModel) {
//        
//        let existingTask = CoreDataManager.shared.getTaskById(id: task.id)
//        if let existingTask = existingTask {
//            CoreDataManager.shared.deleteTask(task: existingTask)
//        }
//    }
    
    func save(data: PreviewFilmResponse) {
        queue.async {
            
            for film in data.docs {
                let dataFilm = PreviewFilm(context: CoreDataManager.shared.viewContext)

                let idFilm = CoreDataManager.shared.fetchItem(withAttributeID: String(film.id))
                
                if idFilm == nil {
                    dataFilm.id = Int64(film.id)
                    dataFilm.name = film.name
        //            dataFilm.names = film.names
                    
                    dataFilm.poster = film.poster.previewURL
                    dataFilm.rating = film.rating.imdb
                    
                    dataFilm.year = Int16(film.year)
                    
                    CoreDataManager.shared.save()
                    
                    DispatchQueue.main.async {
                        self.tasks = CoreDataManager.shared.getAllTasks().map(CoreDataPreviewFilmModel.init)
                    }
                }
                
            }
            
            if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                // Your SQLite file might be here, in the user's Documents directory.
                print("++ Data base in: \(documentsDirectory)")
            }
            
            
        }
        
        
    }
}
