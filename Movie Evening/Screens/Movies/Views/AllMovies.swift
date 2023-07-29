//
//  AllMovies.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 29.07.2023.
//

import SwiftUI

struct AllMovies<ViewModel: MovieViewModelProtocol>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(viewModel.mockMovies) { movie in
                    
                    CardMovie(
                        urlImage: "360",
                        name: movie.name,
                        rating: movie.ratingImdb,
                        year: movie.year
                    )
                    .frame(width: 170, height: 300)
                    
                }
            }
        }
        .scrollContentBackground(.hidden)
        .background(R.Colors.customBackground)
    }
}

#Preview {
    AllMovies(viewModel: MovieViewModel())
}
