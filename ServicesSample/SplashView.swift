//
//  SplashView.swift
//  ServicesSample


import SwiftUI

struct SplashView: View {

    @State private var scale: CGFloat = 0.5
    @State private var opacity = 0.0

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.blue.opacity(0.8), .indigo],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 20) {

                Image(systemName: "apple.logo")
                    .font(.system(size: 80))
                    .foregroundColor(.white)
                    .scaleEffect(scale)

                Text("Services Implementation")
                    .font(.headline)
                    .foregroundColor(.white.opacity(0.8))
                    .opacity(opacity)
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 1.2)) {
                scale = 1.0
                opacity = 1.0
            }
        }
    }
}
