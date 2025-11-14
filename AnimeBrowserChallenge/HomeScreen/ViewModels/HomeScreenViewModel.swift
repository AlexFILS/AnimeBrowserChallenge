//
//  HomeScreenViewModel.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 10.11.2025.
//

import SwiftUI

class HomeScreenViewModel: HomeScreenViewModelProtocol {
  @Published var pages: [MediaCardRepresentableProtocol] = []
  @Published var popularPages: (any MediaCardRepresentableProtocol)?
  @Published var isLoading = true

  var dataFethcer: any ApolloFetcherProtocol

  init(
    dataFethcer: any ApolloFetcherProtocol
  ) {
    self.dataFethcer = dataFethcer
  }

  @MainActor
  func getPages() async throws ->  [any MediaCardRepresentableProtocol] {
    let result = try await Task.detached { [weak self] in
      try await self?.dataFethcer.fetch(query: GraphqlAPI.GetPagesQuery())
    }
      .value
    if let result {
      return try result.page?.media?.compactMap {
        guard let model = $0 else {
          throw ApiError.dataMissing
        }
        return MediaModel(from: model)
      } ?? []
    } else {
      isLoading = false
      throw InternalError.somethingWentWrong
    }
  }

  @MainActor
  func getPopularPages() async throws  -> any MediaCardRepresentableProtocol {
    let result = try await Task.detached { [weak self] in
      try await self?.dataFethcer.fetch(query: GraphqlAPI.MediaTrendQuery(averageScoreGreater: 50)) //Really no clue what query to use so I picked one randm
    }
      .value
    if let model = result?.mediaTrend?.media {
      return TrendingMediaModel(from: model)
    } else {
      isLoading = false
      throw InternalError.somethingWentWrong
    }
  }

  func startFetchingData() async throws {
    async let pages = try await getPages()
    async let popular = try await getPopularPages()
    let (allPages, popularPages) = try await (pages,popular)
    await MainActor.run {
      self.pages = allPages
      self.popularPages = popularPages
      isLoading = false
    }
  }


  func generateMediaItems() -> [any MediaCardViewModelProtocol] {
    pages.map {
      MediaCardViewModel(
        media: MediaModel(
          title: $0.title,
          imagePath: $0.imagePath,
          rating: $0.rating
        ),
        mediaDownloader: MediaDownloader()
      )
    }
  }

  func generatePopularMediaItems() throws -> any MediaCardViewModelProtocol {
    guard let popularPages else {
      throw InternalError.missingMedia
    }
    return MediaCardViewModel(
      media: TrendingMediaModel(
        title: popularPages.title,
        imagePath: popularPages.imagePath,
        rating: popularPages.rating,
        genres: popularPages.genres ?? [],
        duration: popularPages.duration ?? 0
      ),
      mediaDownloader: MediaDownloader()
    )
  }
}
