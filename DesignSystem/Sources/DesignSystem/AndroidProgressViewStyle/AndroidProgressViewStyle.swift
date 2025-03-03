//
//  AndroidProgressViewStyle.swift
//  Application
//
//  Created by Anton Bal’ on 28.02.2024.
//

import SwiftUI

#Preview {
    ProgressView().progressViewStyle(.android())
}

extension ProgressViewStyle where Self == AndroidProgressViewStyle {
    static func android(lineWidth: CGFloat = 6) -> Self {
        AndroidProgressViewStyle(lineWidth: lineWidth)
    }
}

struct AndroidProgressViewStyle: ProgressViewStyle {
    @State private var degrees: CGFloat = 0
    let lineWidth: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        let isCompleted = configuration.fractionCompleted != nil
        let fractionCompleted = configuration.fractionCompleted ?? 0

        let starTrim = isCompleted ? 0.0 : 0.3
        let endTrim = isCompleted ? fractionCompleted : 0.6
        let angelDegrees =  isCompleted ? 270 : degrees
        
        ZStack {
            // Background for the progress bar
            Circle()
                .stroke(lineWidth: lineWidth)
                .opacity(0.1)
            
            // Foreground or the actual progress bar
            Circle()
                .trim(from: starTrim, to: endTrim)
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle(degrees: angelDegrees))
                .if(!isCompleted) {
                    $0.animation(.linear
                        .speed(0.3)
                        .repeatForever(autoreverses: false), value: angelDegrees)
                }
            
        }
        .if(!isCompleted) {
            $0.task(delayStarted)
        }
    }
    
    @Sendable
    private func delayStarted() async {
        degrees = 360
    }
}
