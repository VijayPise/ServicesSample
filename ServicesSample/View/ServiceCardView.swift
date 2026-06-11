//
//  ServiceCardView.swift
//  ServicesSample
//

import SwiftUI
import ServicesSampleData

struct ServiceCardView: View {
    @EnvironmentObject var viewModel: ServicesSampleViewModel
    var item : Service
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            HStack(alignment: .top) {
                
                Text(item.title)
                    .font(.title3)
                    .bold()
                
                Spacer()
                
                Circle()
                    .fill(viewModel.getPriorityColor(item.priority))
                    .frame(width: 14, height: 14)
                
            }.padding(.bottom,14)
            
            HStack(spacing: 8) {
                Image(systemName: "person.crop.circle")
                    .foregroundColor(.blue)
                
                Text(item.customerName)
                    .foregroundColor(.secondary)
            }.padding(.bottom,8)
            
            HStack(alignment: .top, spacing: 8) {
                Image(systemName: "doc.text")
                    .foregroundColor(.blue)
                
                Text(item.description)
                    .foregroundColor(.secondary)
                
            }.padding(.bottom,14)
            
            HStack {
                
                StatusStakView(viewModel: viewModel, item: item)
                Spacer()
                
                Text("\(viewModel.smartFormattedDate(from: item.scheduledDate))")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 22)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
    }
}
