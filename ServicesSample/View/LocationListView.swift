//
//  LocationListView.swift
//  ServicesSample

import SwiftUI
import ServicesSampleData

#Preview {
    LocationListView()
}

import SwiftUI

struct LocationListView: View {
    
    @StateObject var viewModel = ServicesSampleViewModel()
    
    @State private var selectedService: Service?
    
    var body: some View {
        
        NavigationStack {
            VStack(spacing: 0) {
                
                searchField
                
                Divider()
                
                listView
               
            }
            .navigationTitle("Services")
            .navigationBarTitleDisplayMode(.inline)
            
            .navigationDestination(item: $selectedService) { service in
                ServiceDetailView(item: service).environmentObject(viewModel)
            }
        }
        
    }
    
    private var listView : some View {
        
        List(viewModel.filteredServices) { service in
            
            Button(action: {
                selectedService = service
            }, label: {
                ServiceCardView(
                    item: service
                ).environmentObject(viewModel)
            })
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color.clear)
        .refreshable {
            viewModel.fetchData()
        }
        
    }
    
    private var searchField: some View {
        
        HStack {
            Image("search")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(.gray)
            
            TextField("Search", text: $viewModel.searchText)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            Image("microphone")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(.gray)
        }
        .padding(12)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .padding()
    }
    
}
