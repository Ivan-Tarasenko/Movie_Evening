//
//  View+HideKeyboard.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 20.08.2023.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

