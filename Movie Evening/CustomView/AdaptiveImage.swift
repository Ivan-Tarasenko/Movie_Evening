//
//  AdaptiveImage.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 20.08.2023.
//

import SwiftUI

struct AdaptiveImage: View {
    @Environment(\.colorScheme) var colorScheme
    let light: Image
    let dark: Image

    @ViewBuilder var body: some View {
        if colorScheme == .light {
            light
        } else {
            dark
        }
    }
}
