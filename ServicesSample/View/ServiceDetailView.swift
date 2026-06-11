//
//  ServiceDetailView.swift
//  ServicesSample


import SwiftUI
import ServicesSampleData
import MapKit

struct ServiceDetailView: View {
    var item : Service
    @EnvironmentObject var viewModel : ServicesSampleViewModel
    
    @State private var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 47.6062,
                longitude: -122.3321
            ),
            span: MKCoordinateSpan(
                latitudeDelta: 0.01,
                longitudeDelta: 0.01
            )
        )
    )
    
    private let coordinate = CLLocationCoordinate2D(
        latitude: 47.6062,
        longitude: -122.3321
    )
    
    var body: some View {
        
        ScrollView {
            
            content
           
        }
        .navigationTitle("Service Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var content : some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Map(position: $position) {
                Marker("Location", coordinate: coordinate)
            }
            .frame(height: 220)
            .clipShape(RoundedRectangle(cornerRadius: 28))
            
            
            HStack(alignment: .top) {
                
                Text(item.title)
                    .font(.system(size: 20, weight: .bold))
                
                Spacer()
                
                StatusStakView(viewModel: viewModel, item: item)
            }
            
            
            DetailRowView(
                icon: "person.crop.circle",
                title: "Customer",
                value: item.customerName
            )
            
            DetailRowView(
                icon: "doc.text",
                title: "Description",
                value: item.description
            )
            
            DetailRowView(
                icon: "clock",
                title: "Scheduled Time",
                value: viewModel.smartFormattedDate(from: item.scheduledDate)
            )
            
            DetailRowView(
                icon: "mappin.and.ellipse",
                title: "Location",
                value: item.location
            )
            
            DetailRowView(
                icon: "text.bubble",
                title: "Service Notes",
                value: item.serviceNotes
            )
        }
        .padding()
    }
}


