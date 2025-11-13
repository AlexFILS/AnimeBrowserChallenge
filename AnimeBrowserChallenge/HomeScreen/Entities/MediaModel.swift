//
//  Media.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 12.11.2025.
//

import Foundation

struct MediaModel: MediaCardRepresentableProtocol {
  let title: String
  let imagePath: String
  let rating: Int
  
  init(from response: GraphqlAPI.GetPagesQuery.Data.Page.Medium) {
    self.title = response.title?.english ?? "Title error"
    self.imagePath = response.coverImage?.medium ?? ""
    self.rating = 10
  }
  
  init(
    title: String,
    imagePath: String,
    rating: Int
  ) {
    self.title = title
    self.imagePath = imagePath
    self.rating = rating
  }
}
