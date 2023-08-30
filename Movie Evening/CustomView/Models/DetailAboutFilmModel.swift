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
    
    var filmDetailed: DetailFilm? { get set }
    
    func getIdFromPreviewAndAllMovies()
    
    func getFilm(id: Int)
    
    var tempDetailResponse: DetailResponse? {get set}
    
}

final class DetailAboutFilmModel: DetailAboutFilmModelProtocol {
    
    @Published var aboutFilms: CoreDataDetailAboutFilm?
    
    @Published var filmDetailed: DetailFilm?
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
            
            let dataFilm = DetailFilm(context: CoreDataManager.shared.viewContext)
            let idFilm = CoreDataManager.shared.fetchDetailFilm(id: String(id))
            
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
                    let trailerInDB = Trailers(context: CoreDataManager.shared.viewContext)
                    trailerInDB.detailFilm = dataFilm
                    
                    trailerInDB.name = trailer.name
                    trailerInDB.site = trailer.site
                    trailerInDB.url = trailer.url
                }
                
                
                for movie in data.similarMovies {
                    let similarMovies = SimilarMovies(context: CoreDataManager.shared.viewContext)
                    similarMovies.detailFilm = dataFilm
                    
                    similarMovies.id = Int64(movie.id)
                    similarMovies.name = movie.name
                    similarMovies.poster = movie.poster.previewURL
                }
                
                for person in data.persons {
                    let actor = Actors(context: CoreDataManager.shared.viewContext)
                    actor.detailFilm = dataFilm
                    
                    actor.id = Int64(person.id)
                    actor.image = person.photo
                    actor.name = person.name
                }
                
                if dataFilm.name == "" || dataFilm.name == nil {
                    return
                } else {
                    CoreDataManager.shared.save()
                    DispatchQueue.main.async {
                        self.filmDetailed = dataFilm
                    }
                }
                
            } else {
                DispatchQueue.main.async {
                    self.filmDetailed = idFilm
                }
            }
            
            
            if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                print("++ Data base in: \(documentsDirectory)")
            }
        }
    }
}
