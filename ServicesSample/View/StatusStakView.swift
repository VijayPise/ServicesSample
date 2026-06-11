//
//  StatusStakView.swift
//  ServicesSample
//

import SwiftUI
import ServicesSampleData

struct StatusStakView : View{
    
    var viewModel : ServicesSampleViewModel
    
    var item : Service
    
    var body: some View {
        
        HStack(spacing: 8) {
            
            RoundedRectangle(cornerRadius: 4)
                .fill(viewModel.getColor(type: item.status))
                .frame(width: 16, height: 16)
            
            Text(item.status.rawValue)
                .font(.system(size: 14))
                .foregroundColor(viewModel.getColor(type: item.status))
        }
        .padding(.horizontal, 10)
        .frame(height: 28)
        .background(
            viewModel.getColor(type: item.status).opacity(0.1)
        )
        .overlay(
            Capsule()
                .stroke(
                    viewModel.getColor(type: item.status).opacity(0.3),
                    lineWidth: 1
                )
        )
        .clipShape(Capsule())
        
    }
}
