//
//  DetailSboutFilmModel.swift
//  Movie Evening
//
//  Created by Ruslan Ismailov on 22/08/23.
//

import Foundation
import CoreData
import Combine

protocol DetailAboutFilmModelProtocol: ObservableObject {
    
    var aboutFilms: [CoreDataDetailAboutFilm] { get set }
    
    var tempFilmDet: DetailFilm? { get set }
    
    func getIdFromPreviewAndAllMovies()
    
    func getFilm(id: Int) 
    
}

final class DetailAboutFilmModel: DetailAboutFilmModelProtocol {

    @Published var aboutFilms: [CoreDataDetailAboutFilm] = {
        return CoreDataManager.shared.getDetailTask().map(CoreDataDetailAboutFilm.init)
    }()
    
    @Published var tempFilmDet: DetailFilm?
    
    let shared: Networkable = NetworkManager()
    
    var cancellable = Set<AnyCancellable>()
    
    let queue = DispatchQueue(label: "com.detail.film")
    
    var oneTime: Int = 0
    
    func getFilm(id: Int) {

        if oneTime == 0 {
            print("++ start fetch data")
            self.shared.fetchDetail(for: id) { result in
                
                print("++ get result data id is \(id)")
                switch result {
                case .success(let response):
                    print("++ response data from json id is \(response.id)")
                case .failure(let error):
                    print("++ error")
                    print(error.localizedDescription)
                }
            }
            oneTime = 1
        }
    }
    
    func getIdFromPreviewAndAllMovies(){
        
        CombineData.shared.sendedId.sink { id in
            
            DispatchQueue.main.async {
                self.getFilm(id: id)
            }
            
            
            print("++ combine sink id is \(id)")
        }
        .store(in: &cancellable)
        
    }
    
    func save(data: DetailResponse) {
        queue.async {
            
            var count: Int = 0
            
//            for film in data.docs {
                let dataFilm = DetailFilm(context: CoreDataManager.shared.viewContext)

            let idFilm = CoreDataManager.shared.fetchDetailFilm(id: Int(bitPattern: dataFilm.id))

                if idFilm == nil {
//                    dataFilm.id = Int64(film.id)
//                    dataFilm.name = film.name
//                    dataFilm.poster = film.poster.previewURL
//                    dataFilm.rating = film.rating.imdb
//                    dataFilm.year = Int64(film.year)
//                    dataFilm.liked = false
                    
                    dataFilm.poster = data.poster.previewURL
                    dataFilm.name = data.name
                    
//                    var genres: [String] = []
//                    for genre in film.genres {
//                        genres.append(genre.name)
//                    }
//                    dataFilm.genres = genres
                    
                    if dataFilm.name == "" || dataFilm.name == nil {
                        return
                    } else {
                        CoreDataManager.shared.save()
                        count += 1
                    }
                    
                }
            
            if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                print("++ Data base in: \(documentsDirectory)")
            }
            if count > 0 {
                DispatchQueue.main.async {
                    let idFilm = CoreDataManager.shared.fetchDetailFilm(id: Int(bitPattern: dataFilm.id))
                    self.tempFilmDet = idFilm
                }
            }
                
            }
            
            
//        }
        
    }
}
