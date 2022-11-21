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

    struct DX {
        static let bodyTextRegular = Font.regular(size: 14)
        static let bodyTextSubText = Font.regular(size: 12)
    }
}
