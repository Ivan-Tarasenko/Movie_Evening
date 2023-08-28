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
    
    var aboutFilms: CoreDataDetailAboutFilm? { get set }
    
    var tempFilmDet: DetailFilm? { get set }
    
    func getIdFromPreviewAndAllMovies()
    
    func getFilm(id: Int)
    
    var tempDetailResponse: DetailResponse? {get set}
    
}

final class DetailAboutFilmModel: DetailAboutFilmModelProtocol {
    
    @Published var aboutFilms: CoreDataDetailAboutFilm?
    
    @Published var tempFilmDet: DetailFilm?
    @Published var tempDetailResponse: DetailResponse?
    
    let shared: Networkable = NetworkManager()
    
    var cancellable = Set<AnyCancellable>()
    
    let queue = DispatchQueue(label: "com.detail.film")
    
    var oneTime: Int = 0
    
    func getIdFromPreviewAndAllMovies(){
        CombineData.shared.sendedId.sink { id in
            DispatchQueue.main.async {
                self.getFilm(id: id)
            }
        }
        .store(in: &cancellable)
    }
    
    func getFilm(id: Int) {
        
        if oneTime == 0 {
            self.shared.fetchDetail(for: id) { result in
                switch result {
                case .success(let response):
                    self.tempDetailResponse = response
                    self.save(data: response, id: id)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            oneTime = 1
        }
    }
    
    
    func save(data: DetailResponse, id: Int) {
        queue.async {
            
            var count: Int = 0
            
            //            for film in data.docs {
            let dataFilm = DetailFilm(context: CoreDataManager.shared.viewContext)
            
            let idFilm = CoreDataManager.shared.fetchDetailFilm(id: Int(bitPattern: dataFilm.id))
            
            if idFilm == nil {
                dataFilm.id = Int64(id)
                //                    dataFilm.name = film.name
                //                    dataFilm.poster = film.poster.previewURL
                //                    dataFilm.rating = film.rating.imdb
                //                    dataFilm.year = Int64(film.year)
                //                    dataFilm.liked = false
                
                //                    dataFilm.poster = data.poster.previewURL
                dataFilm.name = data.name
                
                //                    var genres: [String] = []
                //                    for genre in film.genres {
                //                        genres.append(genre.name)
                //                    }
                //                    dataFilm.genres = genres
                
                
                for movie in data.similarMovies {
                    let similarMovies = SimilarMovies(context: CoreDataManager.shared.viewContext)
                    similarMovies.detailFilm = dataFilm
                    
                    similarMovies.id = Int64(movie.id)
                    similarMovies.name = movie.name
                    similarMovies.poster = movie.poster.previewURL
                }
                
                if dataFilm.name == "" || dataFilm.name == nil {
                    return
                } else {
                    CoreDataManager.shared.save()
                    count += 1
                }
                
            }
            else {
                DispatchQueue.main.async {
                    self.tempFilmDet = CoreDataManager.shared.fetchDetailFilm(id: id)
                    print("++ 1 tempFilDet \(String(describing: self.tempFilmDet))")
                    self.aboutFilms = idFilm.map(CoreDataDetailAboutFilm.init)
                }
            }
            
            if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                print("++ Data base in: \(documentsDirectory)")
            }
            if count > 0 {
                DispatchQueue.main.async {
//                    let idFilm = CoreDataManager.shared.fetchDetailFilm(id: Int(bitPattern: dataFilm.id))
                    self.tempFilmDet = dataFilm
                    
//                    self.tempFilmDet = CoreDataManager.shared.fetchDetailFilm(id: Int(dataFilm.id))
                    print("++ 2 tempFilDet \(String(describing: self.tempFilmDet))")
                }
            }
            
        }
        
        
        //        }
        
    }
}
