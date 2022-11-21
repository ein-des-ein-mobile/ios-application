//
//  StrokeButton.swift
//  Application
//
//  Created by Anton Bal` on 11.11.2022.
//

import SwiftUI

extension ButtonStyle where Self == StrokeButtonStyle {
    static var stroke: Self { .init() }

}

struct StrokeButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        StrokeButtonStyleView(configuration: configuration)
    }
}

private extension StrokeButtonStyle {
    struct StrokeButtonStyleView: View {
        // tracks if the button is enabled or not
        @Environment(\.isEnabled) var isEnabled
        // tracks the pressed state
        let configuration: StrokeButtonStyle.Configuration

        var body: some View {
            let enabledBackgroundColor: Color = .clear
            let enabledForegroundColor: Color = isEnabled
            ? .white
            : .white.opacity(.dx.opacity70)
            let pressedForegroundColor: Color = configuration.isPressed
            ? .white.opacity(.dx.opacity70)
            : enabledForegroundColor

            let rectangle = RoundedRectangle(cornerRadius: .dx.radius4)

            configuration.label
                .font(.body)
                .frame(maxWidth: .infinity, minHeight: .dx.padding32)
                .foregroundColor(pressedForegroundColor)
                .background(rectangle
                    .strokeBorder(.white, lineWidth: .dx.size1)
                                .background(rectangle.fill(enabledBackgroundColor)))
                .opacity(configuration.isPressed ? .dx.opacity80 : .dx.opacity100)
                .scaleEffect(configuration.isPressed ? 0.98 : .dx.size1)
        }
    }
}
