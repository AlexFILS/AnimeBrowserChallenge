//
//  Media.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 12.11.2025.
//

import Foundation

struct Media {
  let title: String
  let imagePath: String
  let rating: String

  init(from response: GraphqlAPI.GetPagesQuery.Data.Page.Medium) {
    self.title = response.title?.english ?? "Title error"
    self.imagePath = response.coverImage?.medium ?? ""
    self.rating = "10/10"
  }

  init(
    title: String,
    imagePath: String,
    rating: String
  ) {
    self.title = title
    self.imagePath = imagePath
    self.rating = rating
  }
}
