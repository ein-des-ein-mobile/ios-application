//
//  Size+DX.swift
//  Application
//
//  Created by Anton Bal’ on 26.02.2024.
//

import Foundation

extension DXSystemDimension {
    
    var size: DXSize { DXSize() }
    
    struct DXSize {
        let zero = 0.0
        let xxs = 2.0
        let xs = 4.0
        let s = 8.0
        let m = 12.0
        let l = 16.0
        let xl = 16.0
        let xxl = 24.0
        let xxxl = 40.0
    }
}
