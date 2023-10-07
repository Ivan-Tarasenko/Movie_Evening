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
    
    var cancellable = Set<AnyCancellable>()
    
    func sendIdToDetailFilm(id: Int) {
        CombineData.shared.sendedId.send(id)
    }
    
    func getDataFromPreviewMovies(){
        CombineData.shared.allCardsMovies.sink { genre in
            let newTasks = self.tasks.filter({$0.genreByGroup == genre.rawValue})
//            print("++ 2tasks count is \(genre.rawValue)")
            self.tasks = newTasks
        }
        .store(in: &cancellable)
        
    }
}
