//
//  ServicesSampleViewModel.swift
//  ServicesSample


import Foundation
import Combine
import SwiftUI
import ServicesSampleData

class ServicesSampleViewModel: ObservableObject {
    
    @Published var services: [Service] = []
    
    @Published var filteredServices: [Service] = []
    
    @Published var searchText: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        fetchData()
        setupSearch()
    }
    
    func fetchData() {
        services = SampleData.generateServices(count: 200)
        filteredServices = services
    }
    
    private func setupSearch() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] text in
                self?.filterServices(searchText: text)
            }
            .store(in: &cancellables)
    }
    
    private func filterServices(searchText: String) {
        
        debugPrint("Called with \(searchText)")
        
        guard !searchText.isEmpty else {
            filteredServices = services
            return
        }
        
        filteredServices = services.filter {
            $0.title.localizedCaseInsensitiveContains(searchText) ||
            $0.customerName.localizedCaseInsensitiveContains(searchText) ||
            $0.description.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    func smartFormattedDate(from dateString: String) -> String {
        let formatter = ISO8601DateFormatter()
        
        guard let date = formatter.date(from: dateString) else {
            return dateString
        }
        
        let calendar = Calendar.current
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "h:mm a"
        
        if calendar.isDateInToday(date) {
            return "Today, \(timeFormatter.string(from: date))"
        }
        
        if calendar.isDateInTomorrow(date) {
            return "Tomorrow, \(timeFormatter.string(from: date))"
        }
        
        if calendar.isDateInYesterday(date) {
            return "Yesterday, \(timeFormatter.string(from: date))"
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        return "\(dateFormatter.string(from: date)), \(timeFormatter.string(from: date))"
    }
    
    func getPriorityColor(_ priority: Priority) -> Color {
        switch priority {
        case .low:
            return .green

        case .medium:
            return Color(red: 0.95, green: 0.70, blue: 0.10)

        case .high:
            return .orange

        case .critical:
            return .red
        }
    }
    
    func getColor(type: ServiceStatus) -> Color {
        switch type {
        case .active:
            return .red
        case .scheduled:
            return .green
        case .completed:
            return .blue
        case .inProgress:
            return Color(red: 0.8, green: 0.6, blue: 0.0)
        case .urgent:
            return .orange
        }
    }
    
}
