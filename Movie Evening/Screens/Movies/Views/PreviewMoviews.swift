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
    @State var idFIlm: Int
    @State var movies: [CoreDataPreviewFilmModel]
    
    var columns: [GridItem] = [GridItem(.flexible())]
    
    var body: some View {
        
        List {
            
            ForEach(sections.indices, id: \.self) { sectionIndex in
                
                let section = sections[sectionIndex]
                
                if viewModel.sortByGroupModel(genre: section.genres).isEmpty == false {
                    
                    Section(header: SectionHeaderView(title: section.titleSection) {
                        viewModel.sendDataToAllFilms(genre: section.genres)
                        coordinator.push(.allMovies)
                    }) {
                        
                        ScrollView(.horizontal) {
                            
                            LazyHGrid(rows: columns) {
                                
                                ForEach(Array(sortByGroup(genre: section.genres).enumerated()), id: \.element.self) {index, movie in
                                    
                                    if index <= 4 {
                                        CardMovie(
                                            urlImage: movie.poster,
                                            name: movie.name,
                                            rating: movie.rating,
                                            year: movie.year,
                                            currentID: movie.id
                                        )
                                        .frame(width: 170, height: 300)
                                        .onTapGesture {
                                            idFIlm = movie.id
                                            coordinator.present(fullScreenCover: .detailAboutFilm)
                                            viewModel.sendIdToDetailFilm(id: movie.id)
                                        }
                                        
                                    }
                                    
                                }
                                
                            }
                            .onAppear {
                                viewModel.getfilms(page: 1, genre: section.genres)
                            }
                        }
                        .listRowInsets(EdgeInsets(top: -20, leading: 10, bottom: -10, trailing: 0))
                        .scrollIndicators(.hidden)
                        .headerProminence(.increased)
                        
                    }
                    .listRowInsets(
                        sectionIndex == 0 ?
                        EdgeInsets(top: 150, leading: 10, bottom: 10, trailing: 0) :
                            EdgeInsets(top: -20, leading: 10, bottom: -10, trailing: 0)
                    )
                    
                }
                
            }
            .listRowBackground(Color.clear)
            .fullScreenCover(item: $coordinator.fullScreenCover) { fullScreenCover in
                coordinator.build(fullScreenCover: .detailAboutFilm)
            }
            
            
        }
        .listStyle(.grouped)
        .scrollContentBackground(.hidden)
        .overlay(alignment: .top) {
            SearchView(viewModel: viewModel)
        }
        .onTapGesture {
            hideKeyboard()
        }
        .background(AdaptiveImage(
            light: R.Colors.backgtoundLightImage,
            dark: R.Colors.backgroundDarkImage
        ))
        
    }
    
    private func sortByGroup(genre: AllGenres) -> [CoreDataPreviewFilmModel]{
        return viewModel.sortByGroupModel(genre: genre)
    }
    
}


struct PreviewMoviews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewMoviews(viewModel: MovieViewModel(), idFIlm: 0, movies: [])
    }
    
}



