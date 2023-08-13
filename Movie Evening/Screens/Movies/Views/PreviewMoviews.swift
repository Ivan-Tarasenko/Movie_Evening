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
        
        List {
            
            ForEach(sections) { section in
                
                Section(header: SectionHeaderView(title: section.titleSection) {
                    coordinator.push(.allMovies)
                }) {
                    
                    ScrollView(.horizontal) {
                        
                        LazyHGrid(rows: columns) {
                            
                            ForEach(viewModel.mockMovies) { movie in
                                
                                CardMovie(
                                    urlImage: "360",
                                    name: movie.name,
                                    rating: movie.ratingImdb,
                                    year: movie.year
                                )
                                .frame(width: 170, height: 300)
                                .onTapGesture {
                                    coordinator.dismissFullCover()
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
        .navigationTitle(R.Strings.titleMovie)
        .background(R.Colors.customBackground)
        .fullScreenCover(item: $coordinator.fullScreenCover) { fullScreenCover in
            coordinator.build(fullScreenCover: .detailAboutFilm)
        }
    }
    
}

struct PreviewMoviews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewMoviews(viewModel: MovieViewModel())
    }
}
