//
//  DetailAboutFilm.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 19.07.2023.
//

import SwiftUI
import Kingfisher

struct DetailAboutFilm<ViewModel: DetailAboutFilmModelProtocol>: View {
    
    @EnvironmentObject var coordinator: Coordinator
    @State private var activateModalView = false
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    
                    Button(action: {
                        coordinator.dismissFullCover()
                    }, label: {
                        Image(systemName: "chevron.backward")
                        Text("\(viewModel.filmDetailed?.name ?? "")")
                    })
                    
                    KFImage(URL(string: viewModel.filmDetailed?.poster ?? ""))
                    
                    
                    if let allActors = viewModel.filmDetailed?.toActors?.allObjects as? [Actors] {
                        
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(allActors, id: \.self) {actor in
                                    VStack{
                                        
                                        KFImage(URL(string: actor.image ?? ""))
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 70, height: 70, alignment: .center)
                                            .clipShape(Circle())
                                        Text(actor.name ?? "no name")
                                        
                                    }
                                    
                                }
                                
                            }
                        }
                    }
                    
                    Text("\(String(describing: viewModel.filmDetailed?.name ?? ""))")
                    
                    if let allSimilarMovies = viewModel.filmDetailed?.similarFilm?.allObjects  as? [SimilarMovies]{
                        ForEach(allSimilarMovies, id: \.self){ nameMovie in
                            Text("\(nameMovie.name ?? "")")
                        }
                    }
                    
                    if let allTrailers = viewModel.filmDetailed?.toTrailers?.allObjects as? [Trailers] {
                        ForEach(allTrailers, id: \.self) { trailer in
                            Text("\(trailer.url ?? "-----")")
                        }
                    }
                    
                }
                .padding(.leading, 10)
            }
        }
        .onAppear(perform: {
            viewModel.getIdFromPreviewAndAllMovies()
            
        })
    }
    
}

struct DetailAboutFilm_Previews: PreviewProvider {
    static var previews: some View {
        DetailAboutFilm( viewModel: DetailAboutFilmModel())
    }
}


