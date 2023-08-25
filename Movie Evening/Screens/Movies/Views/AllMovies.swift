//
//  AllMovies.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 29.07.2023.
//

import SwiftUI

struct AllMovies<ViewModel: AllFilmsModelProtocol>: View {
    
    @EnvironmentObject  var coordinator: Coordinator
    @ObservedObject var viewModel: ViewModel
    
    var columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        ScrollView {
            VStack {
                Button {
                    
                } label: {
                    Text("Sort by")
                }

                
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.tasks, id: \.self) {movie in
                        
                        CardMovie(
                            urlImage: movie.poster,
                            name: movie.name,
                            rating: movie.rating,
                            year: movie.year,
                            currentID: movie.id
                        )
                        .frame(width: 170, height: 300)
                        .onTapGesture {
                            viewModel.sendIdToDetailFilm(id: movie.id)
                            coordinator.dismissFullCover()
                            coordinator.present(fullScreenCover: .detailAboutFilm)
                        }
                        
                    }
                }
            }
            
        }
        .onAppear(perform: {
            viewModel.getDataFromPreviewMovies()
        })
        .scrollContentBackground(.hidden)
//        .background(R.Colors.MainBackground)
        .fullScreenCover(item: $coordinator.fullScreenCover) { fullScreenCover in
            coordinator.build(fullScreenCover: .detailAboutFilm)
        }
    }
}

struct AllMovies_Previews: PreviewProvider {
    static var previews: some View {
        AllMovies(viewModel: AllFilmsModel())
    }
}
