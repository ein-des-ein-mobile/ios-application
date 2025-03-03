//
//  Image+Resizable.swift
//  Application
//
//  Created by Anton Bal’ on 29.02.2024.
//

import SwiftUI

extension Image {
    func resizable(_ aspectRatio: CGFloat? = nil, contentMode: ContentMode) -> some View {
        resizable().aspectRatio(aspectRatio, contentMode: contentMode)
    }
}
