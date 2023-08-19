//
//  MovieViewModel.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 21.07.2023.
//

import Foundation
import CoreData

protocol MovieViewModelProtocol: ObservableObject {
    
    var searchText: String { get set }
    
    var isSearch: Bool { get set }
    
    var tasks: [CoreDataPreviewFilmModel] { get set }
    
}

final class MovieViewModel: MovieViewModelProtocol {
    
    @Published var searchText: String = ""
    
    @Published var isSearch: Bool = false
    
    @Published var tasks: [CoreDataPreviewFilmModel] = {
        return CoreDataManager.shared.getAllTasks().map(CoreDataPreviewFilmModel.init)
    }()
    
    var previevFilms: [PreviewFilmResponse] = []
    
    let shared: Networkable = NetworkManager()
    
    let queue = DispatchQueue(label: "com.movieevening.app", qos: .background)
    
    init() {
        
        if tasks.count == 0 {
            getfilms()
        }
    }
    
    func getfilms() {
        
        shared.fetchMovie(page: 1, genre: .actionMovie) { result in
            switch result {
            case .success(let response):
                print("++ \(response.docs )")
                self.save(data: response)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

//    func getAllTasks() {
//        tasks = CoreDataManager.shared.getAllTasks().map(CoreDataPreviewFilmModel.init)
//
//
//    }

    func save(data: PreviewFilmResponse) {
        queue.async {
            var count: Int = 0
            
            for film in data.docs {
                let dataFilm = PreviewFilm(context: CoreDataManager.shared.viewContext)

                let idFilm = CoreDataManager.shared.fetchItem(withAttributeID: String(film.id))
                
                if idFilm == nil {
                    dataFilm.id = Int64(film.id)
                    dataFilm.name = film.name
                    dataFilm.poster = film.poster.previewURL
                    dataFilm.rating = film.rating.imdb
                    dataFilm.year = Int16(film.year)
                    
                    CoreDataManager.shared.save()
                    count += 1
                }
                
            }
            
            if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                print("++ Data base in: \(documentsDirectory)")
            }
            if count > 0 {
                DispatchQueue.main.async {
                    self.tasks = CoreDataManager.shared.getAllTasks().map(CoreDataPreviewFilmModel.init)
                }
            }
        }
        
    }
}
