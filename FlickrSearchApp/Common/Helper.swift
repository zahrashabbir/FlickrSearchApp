//
//  Helper.swift
//  FlickrSearchApp
//
//  Created by Zahra Kankroli wala on 11/19/24.
//

import Foundation

// MARK: Extension to strip HTML tags from string
extension String {
    func sHTML() -> String {
        guard let data = self.data(using: .utf8) else { return self }
        guard let attributedString = try? NSAttributedString(data: data,
                                                              options: [.documentType: NSAttributedString.DocumentType.html,
                                                                        .characterEncoding: String.Encoding.utf8.rawValue],
                                                              documentAttributes: nil) else { return self }
        return attributedString.string
    }
    
    func formatDate() -> Date {

        let dateFormatter = ISO8601DateFormatter()
        return dateFormatter.date(from:self)!
    }
}
