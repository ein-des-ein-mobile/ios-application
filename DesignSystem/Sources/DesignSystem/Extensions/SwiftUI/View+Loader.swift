//
//  View+Loader.swift
//
//  Created by Anton Bal` on 26.09.1522.
//

import SwiftUI

public extension View {
    func loaderSheet(isPresented: Binding<Bool>) -> some View {
        modifier(
            LoaderSheet(
                isPresented: isPresented.animation()
            )
        )
    }
    
    func loader<Style: ProgressViewStyle>(isPresented: Binding<Bool>, style: Style) -> some View {
        modifier(
            Loader(
                isPresented: isPresented.animation(),
                style: style
            )
        )
    }
    
    func loader(isPresented: Binding<Bool>) -> some View {
        modifier(
            Loader(
                isPresented: isPresented.animation(),
                style: CircularProgressViewStyle()
            )
        )
    }
}

public struct Loader<Style: ProgressViewStyle>: ViewModifier {
    @Binding public var isPresented: Bool
    let style: Style
    
    public init(isPresented: Binding<Bool>, style: Style) {
        self._isPresented = isPresented
        self.style = style
    }
    
    public func body(content: Content) -> some View {
        
        if isPresented {
            ZStack {
                ProgressView()
                    .progressViewStyle(style)
            }
        } else {
            content
        }
    }
}

public struct LoaderSheet: ViewModifier {
    @Binding public var isPresented: Bool
    
    public init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }
    
    public func body(content: Content) -> some View {
        content
            .allowsHitTesting(!isPresented)
        
            .customFullScreenCover(isPresented: $isPresented) {
                ZStack {
                    Color.black
                        .opacity(0.5)
                    
                    ProgressView()
                        .progressViewStyle(.android(lineWidth: 3))
                        .frame(width: 24, height: 24)
                        .scaleEffect(1.2)
                        .transition(AnyTransition.scale.animation(.spring()))
                        .zIndex(100)
                }
                .ignoresSafeArea()
                .animation(.linear, value: isPresented)
            }
    }
}
