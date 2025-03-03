//
//  Text+DX.swift
//  Application
//
//  Created by Anton Bal’ on 25.02.2024.
//

import SwiftUI

enum DXTextStyle {
    case displayLarge
    case displayMedium
    case displaySmall
    
    case headingXLarge
    case headingLarge
    case headingMedium
    case headingSmall
    case headingXSmall
    
    case paragraphLarge
    case paragraphMedium
    case paragraphSmall
    case paragraphXSmall
    
    case labelLarge
    case labelMedium
    case labelSmall
    case labelXSmall
}

extension View {
    
    func textStyle(_ style: DXTextStyle, color: Color) -> some View {
        if #available(iOS 17.0, *) {
          return textStyle(style).foregroundStyle(color)
        } else {
          return textStyle(style).foregroundColor(color)
        }
    }
    
    func textStyle(_ style: DXTextStyle) -> some View {
        Group {
            switch style {
            case .displayLarge:
                font(.dx.displayLarge).kerning(4)
            case .displayMedium:
                font(.dx.displayMedium).kerning(3.2)
            case .displaySmall:
                font(.dx.displaySmall).kerning(2.8)
            case .headingXLarge:
                font(.dx.headingXLarge).kerning(2)
            case .headingLarge:
                font(.dx.headingLarge).kerning(1.6)
            case .headingMedium:
                font(.dx.headingMedium).kerning(1.4)
            case .headingSmall:
                font(.dx.headingSmall).kerning(1.2)
            case .headingXSmall:
                font(.dx.headingXSmall).kerning(1)
            case .paragraphLarge:
                font(.dx.paragraphLarge)
            case .paragraphMedium:
                font(.dx.paragraphMedium)
            case .paragraphSmall:
                font(.dx.paragraphSmall)
            case .paragraphXSmall:
                font(.dx.paragraphXSmall)
            case .labelLarge:
                font(.dx.labelLarge).kerning(0.9)
            case .labelMedium:
                font(.dx.labelMedium).kerning(0.8)
            case .labelSmall:
                font(.dx.labelSmall).kerning(0.7)
            case .labelXSmall:
                font(.dx.labelXSmall).kerning(0.6)
            }
        }
    }
}
