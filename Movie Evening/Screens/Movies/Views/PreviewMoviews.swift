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
                
                ForEach(sections.indices, id: \.self) { sectionIndex in
                    
                    let section = sections[sectionIndex]
                    
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
    
}

struct PreviewMoviews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewMoviews(viewModel: MovieViewModel())
    }
}


