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
                    .clipShape(.rect(cornerRadius: 10))
                
                VStack(alignment: .leading) {
                    Text(name)
                    Text("IMDb: \(String(rating))")
                    Text("Yesr: \(String(year))")
                }
                .font(.custom(R.Fonts.robotoLight, size: 16))
                    
                
            }
            .padding(10)
        }
        .background(.gray)
        .clipShape(.rect(cornerRadius: 10))
        
    }
}



struct Movies<ViewModel: MovieViewModelProtocol>: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var columns: [GridItem] = [GridItem(.flexible())]
    
    var body: some View {
        
        VStack(alignment: .trailing) {
            
            Search(viewModel: viewModel)
            
            List {
                ForEach(viewModel.sections) { section in
                
                    Section(header: SectionHeaderView(title: section.titleSection) {
                        // Обработка нажатия кнопки "See All"
                        print("See All button tapped for ")
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
                                    
                                }
                            }
                        }
                        
                    }
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    .headerProminence(.increased)
                    .scrollIndicators(.hidden)
                }
            }
            .scrollContentBackground(.hidden)
        }
        .background(Color.background)
        
    }
    
}

#Preview {
    Movies(viewModel: MovieViewModel())
}
