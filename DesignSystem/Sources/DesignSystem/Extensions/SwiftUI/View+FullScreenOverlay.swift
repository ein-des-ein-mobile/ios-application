//
//  View+FullScreenOverlay.swift
//  Application
//
//  Created by Ian Baikuchukov on 28/4/24.
//

import SwiftUI

extension View {
    @ViewBuilder func customFullScreenCover<Overlay: View>(
        isPresented: Binding<Bool>,
        @ViewBuilder content: () -> Overlay
    ) -> some View {
        self.modifier(CustomFullScreenCover(isPresented: isPresented, overlay: content()))
    }
}

// MARK: - CustomFullScreenCover

public struct CustomFullScreenCover<Overlay: View>: ViewModifier {
    @Binding public var isPresented: Bool
    var overlay: Overlay
    
    public func body(content: Content) -> some View {
        content
            .fullScreenCover(isPresented: $isPresented) {
                if #available(iOS 16.4, *) {
                    ZStack {
                        Color.clear
                        
                        overlay
                    }
                    .animation(.linear, value: isPresented)
                    .presentationBackground(.clear)
                } else {
                    ZStack {
                        Color.black
                        
                        overlay
                    }
                    .animation(.linear, value: isPresented)
                    .background(BackgroundClearView())
                }
            }
            .transaction { transaction in
                transaction.disablesAnimations = true
            }
    }
}

private struct BackgroundClearView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
