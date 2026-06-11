//
//  DetailRowView.swift
//  ServicesSample
//
//

import SwiftUI

struct DetailRowView: View {
    
    let icon: String
    let title: String
    let value: String
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 16) {
            
            Image(systemName: icon)
                .font(.system(size: 25))
                .foregroundColor(.blue)
            
            VStack(alignment: .leading, spacing: 6) {
                
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text(value)
                    .font(.title3)
                    .foregroundStyle(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            Spacer()
        }
    }
}
