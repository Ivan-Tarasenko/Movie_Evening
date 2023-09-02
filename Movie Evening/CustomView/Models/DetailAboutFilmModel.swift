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
    
    var filmDetailed: DetailFilm? { get set }
    
    func getIdFromPreviewAndAllMovies()
    
    func getFilm(id: Int)
    
}

final class DetailAboutFilmModel: DetailAboutFilmModelProtocol {
    
    @Published var filmDetailed: DetailFilm?
    
    let shared: Networkable = NetworkManager()
    
    var cancellable = Set<AnyCancellable>()
    
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
                    CoreDataManager.shared.addOrGetDetailedFIlm(data: response, id: id) { detailedFilm in
                        DispatchQueue.main.async {
                            self.filmDetailed = detailedFilm
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            oneTime = 1
        }
    }
}
