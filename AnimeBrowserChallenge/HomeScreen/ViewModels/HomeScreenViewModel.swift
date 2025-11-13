//
//  HomeScreenViewModel.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 10.11.2025.
//

import SwiftUI

class HomeScreenViewModel: HomeScreenViewModelProtocol {
  typealias DataModel = GraphqlAPI.GetPagesQuery.Data.Page.Medium

  @Published var pages: [GraphqlAPI.GetPagesQuery.Data.Page.Medium] = []
  @Published var isLoading = true
  var dataFethcer: any ApolloFetcherProtocol

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
      pages = result.page?.media?.compactMap { $0 } ?? []
    } else {
      isLoading = false
      throw InternalError.somethingWentWrong
    }
    isLoading = false
  }

  func generateMediaItems() -> [MediaCardViewModel] {
    pages.map { MediaCardViewModel(media: Media(from: $0)) }
  }
}
