//
//  DXSystemDimension.swift
//  Core
//
//  Created by Anton Bal` on 22.09.2022.
//

import Foundation
import SwiftUI

/**
 Example:
    
        HStack(spacing: .dx.padding6) {
            EmptyView()
        }
        .frame(height: .dx.size36)
        .padding(.leading, .dx.padding8)
        .cornerRadius(.dx.radius12)
 
 - Tag: DXSystemDimension
 */

struct DXSystemDimension {
    
    // MARK: - Size system
    let size0 = 0.0
    let size1 = 1.0
    let size5 = 5.0
    let size10 = 10.0
    let size15 = 15.0
    let size20 = 20.0
    let size24 = 24.0
    let size25 = 26.0
    let size26 = 26.0
    let size30 = 30.0
    let size40 = 40.0
    let size44 = 44.0
    let size50 = 50.0
    let size80 = 80.0
    let size100 = 100.0
    
    // MARK: - Radius system
    let radius2 = 2.0
    let radius4 = 4.0
    let radius6 = 6.0
    let radius8 = 8.0
    let radius10 = 10.0
    let radius12 = 12.0
    let radius14 = 14.0
    let radius16 = 16.0
    let radius18 = 18.0
    let radius20 = 20.0
    
    // MARK: - Padding system
    let padding0 = 0.0
    let padding2 = 2.0
    let padding4 = 4.0
    let padding6 = 6.0
    let padding8 = 8.0
    let padding10 = 10.0
    let padding12 = 12.0
    let padding14 = 14.0
    let padding16 = 16.0
    let padding18 = 18.0
    let padding20 = 20.0
    let padding24 = 24.0
    let padding26 = 26.0
    let padding30 = 30.0
    let padding32 = 32.0
    let padding40 = 40.0
    
    // MARK: - Opacity system
    let opacity0 = 0.0
    let opacity10 = 0.1
    let opacity20 = 0.2
    let opacity30 = 0.3
    let opacity40 = 0.4
    let opacity50 = 0.5
    let opacity60 = 0.6
    let opacity70 = 0.7
    let opacity80 = 0.8
    let opacity90 = 0.9
    let opacity100 = 1.0
}

extension CGFloat {
   static let dx = DXSystemDimension()
}

extension Double {
    static let dx = DXSystemDimension()
}
