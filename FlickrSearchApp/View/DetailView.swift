//
//  DetailView.swift
//  FlickrSearchApp
//
//  Created by Zahra Kankroli wala on 11/19/24.
//

import SwiftUI

struct DetailView: View {
    let item: Item
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                if let imageUrlString = item.media?.m, let imageUrl = URL(string: imageUrlString) {
                    AsyncImage(url: imageUrl) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: .infinity, maxHeight: 300)
                            .clipped()
                    } placeholder: {
                        ProgressView()
                            .frame(maxWidth: .infinity, maxHeight: 300)
                            .background(Color.gray.opacity(0.3))
                    }
                }
                
                Text(item.title ?? TextPhrases.noDataFound.rawValue)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                    .fixedSize(horizontal: false, vertical: true)
                
                Text(item.description?.stripHTML() ?? TextPhrases.noDataFound.rawValue)
                    .padding(.top, 5)
                    .fixedSize(horizontal: false, vertical: true)
                
                Text("Author: \( item.author ?? TextPhrases.noDataFound.rawValue)")
                    .padding(.top, 5)
                    .fixedSize(horizontal: false, vertical: true)
                
                if let publishedDate = item.published?.formatDate().formatString() {
                    Text("Published: \(publishedDate)")
                        .padding(.top, 5)
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                /*if let dimensions =  item.description {
                    Text("Image Size: \(dimensions)")
                        .padding(.top, 5)
                        .fixedSize(horizontal: false, vertical: true)
                }*/
                
                // MARK: - Share Button
                
                if let imageUrlString = item.media?.m, let imageUrl = URL(string: imageUrlString) {
                    ShareLink(item: generateShareableContent(from: imageUrl)) {
                        Label("Share", systemImage: SystemImages.squareArrowUP.rawValue)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    .padding(.top, 20)
                }
                
                Spacer()
            }
            .padding(10)
        }
    }
    
    // MARK: - Generate Shareable Content
    private func generateShareableContent(from imageUrl: URL) -> String {
        let shareableContent = """
            Title: \(item.title ?? TextPhrases.noDataFound.rawValue)
            Description: \(item.description?.stripHTML() ?? TextPhrases.noDataFound.rawValue)
            Author: \(item.author ?? TextPhrases.noDataFound.rawValue)
            Published: \(item.published?.formatDate().formatString() ?? TextPhrases.noDataFound.rawValue)
            Image URL: \(imageUrl.absoluteString)
            """
        return shareableContent
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(item: Item(
            title: "Lorem Ipsum",
            link: "j",
            media: Media(m: "https://live.staticflickr.com/65535/53944355642_8943410a02_m.jpg"),
            description: "<p>Lorem Ipsum Description</p>",
            published: "2024-08-24T22:57:18Z",
            author: "Lorem Ipsum"
        ))
    }
}
