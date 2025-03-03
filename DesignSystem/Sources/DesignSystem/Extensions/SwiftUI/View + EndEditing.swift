//
//  View + EndEditing.swift
//  Application
//
//  Created by Ian Baikuchukov on 3/5/24.
//

import SwiftUI
import UIKit

extension View {
    func endEditing() {
        UIApplication.shared.endEditing()
    }
}


extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
