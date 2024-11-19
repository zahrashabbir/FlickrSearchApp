//
//  Extension.swift
//  FlickrSearchApp
//
//  Created by Zahra Kankroli wala on 11/19/24.
//

import Foundation

// MARK: Extension to strip HTML tags from string
extension String {
    func stripHTML() -> String {
        guard let data = self.data(using: .utf8) else { return self }
        guard let attributedString = try? NSAttributedString(data: data,
                                                              options: [.documentType: NSAttributedString.DocumentType.html,
                                                                        .characterEncoding: String.Encoding.utf8.rawValue],
                                                              documentAttributes: nil) else { return self }
        return attributedString.string
    }
}

extension Date {
    func formatString() -> String {
        var formatter = DateFormatter()
        formatter.dateFormat = "MMM d, y HH:mm:ss"
        return formatter.string(from: self)
    }
}
