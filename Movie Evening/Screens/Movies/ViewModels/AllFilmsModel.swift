//
//  AllFilmsModel.swift
//  Movie Evening
//
//  Created by Ruslan Ismailov on 20/08/23.
//

import Foundation
import Combine

protocol AllFilmsModelProtocol: ObservableObject {
    
    var searchText: String { get set }
    
    var isSearch: Bool { get set }
    
    var tasks: [CoreDataPreviewFilmModel] { get set }
    
    func sendIdToDetailFilm(id: Int)
    
    func getDataFromPreviewMovies()
    
}

class AllFilmsModel: AllFilmsModelProtocol {
    
    @Published var searchText: String = ""
    
    @Published var isSearch: Bool = false
    
    @Published var tasks: [CoreDataPreviewFilmModel] = {
        return CoreDataManager.shared.getAllTasks().map(CoreDataPreviewFilmModel.init)
    }()
//    @Published var tasks: [CoreDataPreviewFilmModel]?
//    var previevFilms: [PreviewFilmResponse] = []
    
//    let shared: Networkable = NetworkManager()
    
//    let queue = DispatchQueue(label: "com.movieevening.app", qos: .background)
    
    var cancellable = Set<AnyCancellable>()
    
//    init() {
//        if tasks.count == 0 {
//            getfilms()
//        }
//    }
    
//    func getfilms() {
//        
//        shared.fetchMovie(page: 1, genre: .actionMovie) { result in
//            switch result {
//            case .success(let response):
//                print("++ \(response.docs )")
//                self.save(data: response)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    
//    private func save(data: PreviewFilmResponse) {
//        queue.async {
//            var count: Int = 0
//            
//            for film in data.docs {
//                let dataFilm = PreviewFilm(context: CoreDataManager.shared.viewContext)
//
//                let idFilm = CoreDataManager.shared.fetchItem(withAttributeID: String(film.id))
//                
//                if idFilm == nil {
//                    dataFilm.id = Int64(film.id)
//                    dataFilm.name = film.name
//                    dataFilm.poster = film.poster.previewURL
//                    dataFilm.rating = film.rating.imdb
//                    dataFilm.year = Int64(film.year)
//                    CoreDataManager.shared.save()
//                    count += 1
//                }
//            }
//            if count > 0 {
//                DispatchQueue.main.async {
//                    self.tasks = CoreDataManager.shared.getAllTasks().map(CoreDataPreviewFilmModel.init)
//                }
//            }
//        }
//    }
    
    func sortBy() {
        
    }
    
    func sendIdToDetailFilm(id: Int) {
        CombineData.shared.sendedId.send(id)
    }
    
    func getDataFromPreviewMovies(){
        CombineData.shared.allCardsMovies.sink { tasks in
            self.tasks = tasks
            print("++ 2tasks count is \(tasks.count)")
        }
        .store(in: &cancellable)
        
        
    }
}
