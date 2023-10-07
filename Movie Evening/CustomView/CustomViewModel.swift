//
//  CustomViewModel.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 20.08.2023.
//

import Foundation

protocol CustomViewModelProtocol: ObservableObject {
    var arrayRatingValues: [Double] { get }
}

final class CustomViewModel: CustomViewModelProtocol {
    
    var rating: Double
    
   @Published var arrayRatingValues: [Double] = []
    
    init(rating: Double) {
        self.rating = rating
        
        fillRatingArray()
    }
    
   private func fillRatingArray() {
        
        var rating = rating / 2
        
        for _ in 1...5 {
            switch rating {
            case rating where rating >= 1:
                arrayRatingValues.append(rating)
                rating -= 1
            case rating where rating > 0:
                arrayRatingValues.append(rating)
                rating -= 1
            case rating where rating < 0:
                arrayRatingValues.append(0.0)
            default:
                break
            }
        }
    }
    
}
