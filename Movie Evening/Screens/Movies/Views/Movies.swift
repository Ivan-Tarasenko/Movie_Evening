//
//  Movies.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 16.07.2023.
//

import SwiftUI

struct CardMovie: View {
    
    let urlImage: String
    let name: String
    let rating: Double
    let year: Int
    
    var body: some View {
        
        ZStack {
            VStack(alignment: .leading) {
                Image(urlImage, bundle: nil)
                    .resizable()
                    .clipShape(.rect(cornerRadius: 19))
                
                VStack(alignment: .leading) {
                    Text(name)
                    Text("IMDb: \(String(rating))")
                    Text("Yesr: \(String(year))")
                }
                .font(.custom(R.Fonts.robotoLight, size: 16))
                
                
            }
            .padding(10)
        }
        .background(.backgroundMovieItem)
        .clipShape(.rect(cornerRadius: 19))
        
    }
}



struct Movies<ViewModel: MovieViewModelProtocol>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        
        VStack {
            
            List {
                
                ForEach(viewModel.sections) { section in
                    
                    Section(header: SectionHeaderView(title: section.titleSection) {
                        // Обработка нажатия кнопки "See All"
                        print("See All button tapped for ")
                    }) {
                        
                        ScrollView(.horizontal) {
                            
                            LazyHStack {
                                
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
                        
                    }
                    .listRowInsets(EdgeInsets(top: 0, leading: 10, bottom: 20, trailing: 0))
                    .scrollIndicators(.hidden)
                    .headerProminence(.increased)
                    
                }
                
            }
            .scrollContentBackground(.hidden)
            .listStyle(.plain)
            
        }
        .navigationTitle(R.Strings.titleMovie)
        .background(R.Colors.customBackground)
        
    }
    
}

#Preview {
    Movies(viewModel: MovieViewModel())
}
