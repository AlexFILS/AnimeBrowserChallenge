//
//  HomeScreenViewModel.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 10.11.2025.
//

import SwiftUI

class HomeScreenViewModel: HomeScreenViewModelProtocol {
  @Published var pages: [MediaCardRepresentableProtocol] = []
  @Published var isLoading = true
  var dataFethcer: any ApolloFetcherProtocol
  var popularPages: [any MediaCardRepresentableProtocol]

  init(
    dataFethcer: any ApolloFetcherProtocol
  ) {
    self.dataFethcer = dataFethcer
  }

  @MainActor
  func getPages() async throws {
    let result = try await Task.detached { [weak self] in
      try await self?.dataFethcer.fetch(query: GraphqlAPI.GetPagesQuery())
    }
      .value
    if let result {
      pages = try result.page?.media?.compactMap {
        guard let model = $0 else {
          throw ApiError.dataMissing
        }
        return MediaModel(from: model)
      } ?? []
    } else {
      isLoading = false
      throw InternalError.somethingWentWrong
    }
    isLoading = false
  }

  
  func generateMediaItems() -> [any MediaCardViewModelProtocol] {
    pages.map {
      MediaCardViewModel(
        media: MediaModel(
          title: $0.title,
          imagePath: $0.imagePath,
          rating: $0.rating
        )
      )
    }
  }

  func generatePopularMediaItems() -> [any MediaCardViewModelProtocol] {
    <#code#>
  }

}
