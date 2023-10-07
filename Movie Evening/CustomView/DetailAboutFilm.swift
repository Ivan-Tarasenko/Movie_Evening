//
//  DetailAboutFilm.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 19.07.2023.
//

import SwiftUI

struct DetailAboutFilm: View {
    
    @EnvironmentObject var coordinator: Coordinator
    @State private var activateModalView = false
    
    var body: some View {
        ZStack {
            Image(._360)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(height: 350)

            Text("Zverotopia")
        }
        
        
    }
}

struct DetailAboutFilm_Previews: PreviewProvider {
    static var previews: some View {
        DetailAboutFilm()
    }
}


