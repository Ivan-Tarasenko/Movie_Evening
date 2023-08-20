//
//  PreviewMoviews.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 16.07.2023.
//

import SwiftUI

struct PreviewMoviews<ViewModel: MovieViewModelProtocol>: View {
    
    @EnvironmentObject private var coordinator: Coordinator
    @ObservedObject  var viewModel: ViewModel
    
    var columns: [GridItem] = [GridItem(.flexible())]
    
    var body: some View {
        ZStack {
            
            Image(.mainBackground)
                .resizable()
            
            List {
                
                ForEach(sections) { section in
                    
                    Section(header: SectionHeaderView(title: section.titleSection) {
                        coordinator.push(.allMovies)
                    }) {
                        
                        ScrollView(.horizontal) {
                            
                            LazyHGrid(rows: columns) {
                                
                                ForEach(Array(viewModel.tasks.enumerated()), id: \.element.self) {index, movie in
                                    if index <= 4 {
                                        CardMovie(
                                            urlImage: movie.poster,
                                            name: movie.name,
                                            rating: movie.rating,
                                            year: movie.year
                                        )
                                        .frame(width: 170, height: 300)
                                        .onTapGesture {
                                            coordinator.present(fullScreenCover: .detailAboutFilm)
                                        }
                                        
                                    }
                                    
                                }
                                
                            }
                            
                        }
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                        .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 10, trailing: 0))
                        .scrollIndicators(.hidden)
                        .headerProminence(.increased)
                        
                    }
                    
                }
                .scrollContentBackground(.hidden)
                .listStyle(.grouped)
                //            .navigationTitle(R.Strings.titleMovie)
                .fullScreenCover(item: $coordinator.fullScreenCover) { fullScreenCover in
                    coordinator.build(fullScreenCover: .detailAboutFilm)
                }
                
            }
            
        }
        
    }
    
}
    
    struct PreviewMoviews_Previews: PreviewProvider {
        static var previews: some View {
            PreviewMoviews(viewModel: MovieViewModel())
        }
    }
