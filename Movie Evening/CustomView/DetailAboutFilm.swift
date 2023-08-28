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
            
            Button(action: {
                coordinator.dismissFullCover()
            }, label: {
                Image(systemName: "chevron.backward")
                Text("\(viewModel.tempDetailResponse?.name ?? "no name")")
            })
            
//            Image("360")
            KFImage(URL(string: viewModel.tempDetailResponse?.poster.previewURL ?? "360"))
            
            Text("\(String(describing: viewModel.tempFilmDet?.name))")
            Text("\(String(describing: viewModel.tempFilmDet?.similarFilm?.count))")
            
            if let allSimilarMovies = viewModel.tempFilmDet?.similarFilm?.allObjects  as? [SimilarMovies]{
                ForEach(allSimilarMovies, id: \.self){ nameMovie in
                    Text("\(nameMovie.name ?? "")")
                }
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
