//
//  Font+DX.swift
//
//  Created by Anton Bal` on 22.09.2022.
//

import SwiftUI

public extension Font {
    /// 400
    static func regular(size: CGFloat) -> Font {
        Font.system(size: size)
    }
}

public extension Font {

    struct dx {
        static let displayLarge = Font.regular(size: 80)
        static let displayMedium = Font.regular(size: 64)
        static let displaySmall = Font.regular(size: 56)
        
        static let headingXLarge = Font.regular(size: 40)
        static let headingLarge = Font.regular(size: 32)
        static let headingMedium = Font.regular(size: 28)
        static let headingSmall = Font.regular(size: 24)
        static let headingXSmall = Font.regular(size: 20)

        static let paragraphLarge = Font.regular(size: 18).weight(.semibold)
        static let paragraphMedium = Font.regular(size: 16)
        static let paragraphSmall = Font.regular(size: 14)
        static let paragraphXSmall = Font.regular(size: 12).weight(.semibold)
        
        static let labelLarge = Font.regular(size: 18)
        static let labelMedium = Font.regular(size: 16)
        static let labelSmall = Font.regular(size: 14)
        static let labelXSmall = Font.regular(size: 12)
    }
}


public extension UIFont {
    struct dx {
        static let paragraphXSmall = UIFont.systemFont(ofSize: 20).withWeight(.semibold)
        static let headingXSmall = UIFont.systemFont(ofSize: 20)
        static let paragraphMedium = UIFont.systemFont(ofSize: 16)
    }
}

extension UIFont {
  func withWeight(_ weight: UIFont.Weight) -> UIFont {
    let newDescriptor = fontDescriptor.addingAttributes([.traits: [
      UIFontDescriptor.TraitKey.weight: weight]
    ])
    return UIFont(descriptor: newDescriptor, size: pointSize)
  }
}
