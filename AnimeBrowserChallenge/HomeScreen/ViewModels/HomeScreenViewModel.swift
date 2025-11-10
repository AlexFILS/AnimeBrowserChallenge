//
//  HomeScreenViewModel.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 10.11.2025.
//

import SwiftUI

class HomeScreenViewModel: HomeScreenViewModelProtocol {
  typealias DataModel = GraphqlAPI.GetPagesQuery.Data.Page.Medium
  
  var dataFethcer: any ApolloFetcherProtocol
  @Published var pages: [GraphqlAPI.GetPagesQuery.Data.Page.Medium] = []
  @Published var isLoading = false
  
  init(
    dataFethcer: any ApolloFetcherProtocol
  ) {
    self.dataFethcer = dataFethcer
  }
  
  nonisolated func getPages() async throws {
    await MainActor.run {
      isLoading = true
    }
    let result = try await dataFethcer.fetch(query: GraphqlAPI.GetPagesQuery())
    
    await MainActor.run {
      pages = result.page?.media?.compactMap { $0 } ?? []
      isLoading = false
    }
  }
}
