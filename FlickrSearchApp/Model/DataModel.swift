//
//  DataModel.swift
//  FlickrSearchApp
//
//  Created by Zahra Kankroli wala on 11/19/24.
//

import Foundation

struct ImageInfo: Codable, Hashable {
    let title: String?
    let link: String?
    let description: String?
    let items: [Item]?
}

struct Item: Codable, Hashable {
    let title: String?
    let link: String?
    let media: Media?
    let description: String?
    let published: String?
    let author: String?
}

struct Media: Codable, Hashable {
    let m: String?
}
