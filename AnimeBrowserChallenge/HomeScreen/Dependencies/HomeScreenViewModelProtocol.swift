//
//  HomeScreenViewModelProtocol.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 10.11.2025.
//

import protocol SwiftUI.ObservableObject

protocol HomeScreenViewModelProtocol: ObservableObject {
  var pages: [any MediaCardRepresentableProtocol] { get }
  var popularPages: (any MediaCardRepresentableProtocol)? { get }
  var dataFethcer: ApolloFetcherProtocol { get }
  var isLoading: Bool { get }
  func startFetchingData() async throws
  func generateMediaItems() -> [any MediaCardViewModelProtocol]
  func generatePopularMediaItems() throws -> any MediaCardViewModelProtocol
}
