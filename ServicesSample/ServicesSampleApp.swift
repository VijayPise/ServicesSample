//
//  ServicesSampleApp.swift
//  ServicesSample


import SwiftUI

@main
struct ServicesSampleApp: App {
    @State private var showSplash = true
    
    var body: some Scene {
        
        WindowGroup {
            
            if showSplash {
                
                SplashView().transition(.move(edge: .leading).combined(with: .opacity))
                    .task {
                        try? await Task.sleep(for: .seconds(2.5))
                        withAnimation(.spring(response: 0.7, dampingFraction: 0.85)) {
                            showSplash = false
                            
                            
                        }
                    }
            } else {
                LocationListView().transition(.move(edge: .trailing).combined(with: .opacity))
            }
        }
    }
}
