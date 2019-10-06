//
//  SearchResponse.swift
//  PureMusic
//
//  Created by Lev Kolesnikov on 13/09/2019.
//  Copyright © 2019 Lev Kolesnikov. All rights reserved.
//

import Foundation

struct SearchResponse: Decodable {
    var resultCount: Int
    var results: [Track]
}

struct Track: Decodable {
    var trackName: String
    var collectionName: String?
    var artistName: String
    var artworkUrl100: String?
    var previewUrl: String?
}
