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
    
    func sendIdToDetailFilm(id: Int)
    
    func sendDataToAllFilms(genre: AllGenres)
    
    func getfilms(page: Int, genre: AllGenres)
    
    func sortByGroupModel(genre: AllGenres) -> [CoreDataPreviewFilmModel]
    
}

final class MovieViewModel: MovieViewModelProtocol {
    
    @Published var searchText: String = ""
    
    @Published var isSearch: Bool = false
    
    @Published var tasks: [CoreDataPreviewFilmModel] = {
        return CoreDataManager.shared.getAllTasks().map(CoreDataPreviewFilmModel.init)
    }()
    
    var previevFilms: [PreviewFilmResponse] = []
    
    let apiShared: Networkable = NetworkManager()
    
    let queue = DispatchQueue(label: "com.movieevening.app", qos: .background)
    let group = DispatchGroup()
    
    init() {
        
        if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            print("++ first Data base in: \(documentsDirectory)")
        }
        
        for i in AllGenres.allCases {
            
            queue.async(group: group) {
                print("++ \(i.rawValue)")
                self.group.enter()
                self.getfilms(page: 1, genre: i)
                
            }
        }
    }
    
    func getfilms(page: Int, genre: AllGenres) {
        group.enter()
        apiShared.fetchMovie(page: page, genre: genre) { result in
            switch result {
            case .success(let response):
                print("++ response \(response.docs.count), genres is \(genre.rawValue)")
                CoreDataManager.shared.getOrSaveAllMovies(data: response, genres: genre) { allMovies in
                    guard let allMovies = allMovies else {
                        return print("error: data is not response from api and not have any data in data base")
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        self.tasks = allMovies
                        self.group.leave()
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                self.group.leave()
            }
        }
    }

    func sendIdToDetailFilm(id: Int) {
        CombineData.shared.sendedId.send(id)
    }
    
    func sendDataToAllFilms(genre: AllGenres) {
//        print("++ tasks count is \(genre.rawValue)")
        CombineData.shared.allCardsMovies.send(genre)
    }
    
    func sortByGroupModel(genre: AllGenres) -> [CoreDataPreviewFilmModel]{
        let newTasks = self.tasks.filter({
            $0.genreByGroup == genre.rawValue
        })
        
        return newTasks
    }
}
