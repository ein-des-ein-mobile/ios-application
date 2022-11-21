//
//  FillButton.swift
//  Application
//
//  Created by Anton Bal` on 20.11.2022.
//

import SwiftUI

extension ButtonStyle where Self == FillButtonStyle {
    static var fill: Self { .init() }
}


struct FillButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        FillButtonStyleView(configuration: configuration)
    }
}

private extension FillButtonStyle {
    struct FillButtonStyleView: View {
        // tracks if the button is enabled or not
        @Environment(\.isEnabled) var isEnabled
        // tracks the pressed state
        let configuration: FillButtonStyle.Configuration

        var body: some View {
            let enabledForegroundColor: Color = isEnabled ? .white : .white
            let enabledBackgroundColor: Color = isEnabled ? .blue : .gray
            let pressedForegroundColor: Color = configuration.isPressed ? .white : enabledForegroundColor

            configuration.label
                .font(.body)
                .frame(maxWidth: .infinity, minHeight: .dx.size50)
                .foregroundColor(pressedForegroundColor)
                .background(RoundedRectangle(cornerRadius: .dx.radius10)
                                .fill(enabledBackgroundColor))
                .opacity(configuration.isPressed ? .dx.opacity80 : .dx.opacity100)
                .scaleEffect(configuration.isPressed ? 0.98 : .dx.size1)
        }
    }
}
