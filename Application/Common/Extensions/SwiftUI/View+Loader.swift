//
//  View+Loader.swift
//
//  Created by Anton Bal` on 26.09.2022.
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

    func loader(isPresented: Binding<Bool>) -> some View {
        modifier(
            Loader(
                isPresented: isPresented.animation()
            )
        )
    }
}

public struct Loader: ViewModifier {
    @Binding public var isPresented: Bool

    public init(isPresented: Binding<Bool>) {
        self._isPresented = isPresented
    }

    public func body(content: Content) -> some View {

        if isPresented {
            ZStack {
                content
                ProgressView()
                    .progressViewStyle(.circular)
                    .scaleEffect(1.2)
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
        GeometryReader { proxy in
            ZStack {
                content
                    .allowsHitTesting(!self.isPresented)
                    .blur(radius: self.isPresented ? 3 : 0)

                if self.isPresented {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .scaleEffect(1.2)
                        .transition(AnyTransition.scale.animation(.spring()))
                        .zIndex(100)
                }
            }
        }
    }
}
