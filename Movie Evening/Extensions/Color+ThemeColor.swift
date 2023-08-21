//
//  Color+ThemeColor.swift
//  Movie Evening
//
//  Created by Иван Тарасенко on 19.08.2023.
//

import SwiftUI

public extension Bundle {
    static var commonBundle: Bundle {
        return Bundle(identifier: "com.waytopay.AggregatorBank")!
    }
}

extension Color {
    init(_ name: String, bundle: Bundle) {
        self.init(UIColor(named: name, in: bundle, compatibleWith: nil)!)
    }
}

extension Color {
    
    static let active = Color("ActiveSet", bundle: Bundle(identifier: "com.tarasenko.ivan-icloud.Movie-Evening"))
    static let text = Color("TextSet", bundle: Bundle(identifier: "com.tarasenko.ivan-icloud.Movie-Evening"))
    static let subtext = Color("SubtextSet", bundle: Bundle(identifier: "com.tarasenko.ivan-icloud.Movie-Evening"))
    static let starInactive = Color("inActiveStar", bundle: Bundle(identifier: "com.tarasenko.ivan-icloud.Movie-Evening"))
    static let searchColor = Color("SearchSet", bundle: Bundle(identifier: "com.tarasenko.ivan-icloud.Movie-Evening"))
    static let MagnifyingglassColor = Color("MagnifyingglassSet", bundle: Bundle(identifier: "com.tarasenko.ivan-icloud.Movie-Evening"))
}

