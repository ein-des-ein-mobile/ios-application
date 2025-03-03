//
//  View+CornerRadiusAndBorder.swift
//  Application
//
//  Created by Ian Baikuchukov on 2/5/24.
//

import SwiftUI

extension View {
    
    func cornerRadiusWithBorder(cornerRadius: CGFloat, borderColor: Color, borderWidth: CGFloat) -> some View {
        clipShape(.rect(cornerRadius: cornerRadius))
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor, lineWidth: borderWidth)
            }
    }
    
}
