//
//  TrendingMedia.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 13.11.2025.
//

struct TrendingMediaModel: MediaCardRepresentableProtocol {
  let title: String
  let imagePath: String
  let rating: Int
  var genres: [String]?
  var duration: Int?
  
  init(
    title: String,
    imagePath: String,
    rating: Int,
    genres: [String],
    duration: Int
  ) {
    self.title = title
    self.imagePath = imagePath
    self.rating = rating
    self.genres = genres
    self.duration = duration
  }
  
  init(from model: GraphqlAPI.MediaTrendQuery.Data.MediaTrend.Media) {
    self.title = model.title?.english ?? ""
    self.imagePath = model.coverImage?.medium ?? ""
    self.rating = model.meanScore ?? 0
    self.genres = model.genres?.compactMap { $0 } ?? []
    self.duration = model.duration ?? 0
  }

  init(from model: MediaCardRepresentableProtocol) {
    self.title = model.title
    self.imagePath = model.imagePath
    self.rating = model.rating
    self.genres = model.genres?.compactMap { $0 } ?? []
    self.duration = model.duration ?? 0
  }
}
