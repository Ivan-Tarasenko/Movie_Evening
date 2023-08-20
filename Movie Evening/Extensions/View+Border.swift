//
//  View+Border.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 23.07.2023.
//

import SwiftUI

extension View {
    func borderWithGradient(_ color: LinearGradient, width: CGFloat, cornerRadius: CGFloat) -> some View {
        overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(color, lineWidth: width))
    }
    
    func border(_ color: Color, width: CGFloat, cornerRadius: CGFloat) -> some View {
        overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(color, lineWidth: width))
    }
}
