//
//  ImageViewModel.swift
//  FlickrSearchApp
//
//  Created by Zahra Kankroli wala on 11/19/24.
//

import Foundation

// MARK: ViewModel
class ImageViewModel: ObservableObject {
    @Published var imageData = [Item]()
    @Published var loading: Bool = false
    @Published var errorMessage: String?
    
    // MARK: - Data Loading Method
        /// Fetches and loads data from the provided URL using the real API.
        /// - Parameter url: The URL from which to fetch the data.
    
    @MainActor
    func loadData(url: String) async throws {
        do {
            let data = try await APIManager.sharedInstance.fetchData(for: ImageInfo.self, url: url)
            if let data = data {
                self.imageData = data.items ?? []
            } else {
                self.errorMessage = Errors.otherError.rawValue
            }
            self.loading = true
        } catch {
            self.loading = false
            self.errorMessage = error.localizedDescription
        }
    }
}
