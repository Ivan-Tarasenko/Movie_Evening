//
//  Coordinator.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 30.07.2023.
//

import SwiftUI

enum Page: String, Identifiable {
    case previewMoviews, previewSerials, random, favorites, allMovies, allSerials
    
    var id: String {
        self.rawValue
    }
}

enum Sheet: String, Identifiable {
    case fullIamge
    
    var id: String {
        self.rawValue
    }
}

enum FullScreenCover: String, Identifiable {
    case detailAboutFilm
    
    var id: String {
        self.rawValue
    }
}

final class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?
    
    func push(_ page: Page) {
        path.append(page)
    }
    
    func present(sheet: Sheet) {
        self.sheet = sheet
    }
    
    func present(fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    func dismissFullCover() {
        self.fullScreenCover = nil
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .previewMoviews:
            PreviewMoviews(viewModel: MovieViewModel())
        case .previewSerials:
            PreviewSerials()
        case .random:
            Random()
        case .favorites:
            Favorites()
        case .allMovies:
            AllMovies(viewModel: MovieViewModel())
        case .allSerials:
            AllSerials()
        }
    }
    
    @ViewBuilder
    func build(fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .detailAboutFilm:
            NavigationStack {
                DetailAboutFilm()
            }
        }
    }
}
