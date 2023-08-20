//
//  ViewModel.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 20.08.2023.
//

import Foundation

protocol ViewModelProtocol: ObservableObject {
    var arrayRatingValues: [Double] { get }
}

final class ViewModel: ViewModelProtocol {
    
    var testRating = 6.7
    
   @Published var arrayRatingValues: [Double] = []
    
    init() {
        
        fillRatingArray()
        
 
    }
    
   private func fillRatingArray() {
        
        var rating = testRating / 2
        
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
