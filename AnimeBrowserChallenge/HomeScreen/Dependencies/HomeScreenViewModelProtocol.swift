//
//  HomeScreenViewModelProtocol.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 10.11.2025.
//

import protocol SwiftUI.ObservableObject

protocol HomeScreenViewModelProtocol: ObservableObject {
  var pages: [MediaCardRepresentableProtocol] { get }
  var popularPages: [MediaCardRepresentableProtocol] { get }
  var dataFethcer: ApolloFetcherProtocol { get }
  var isLoading: Bool { get }
  func getPages() async throws
  func generateMediaItems() -> [any MediaCardViewModelProtocol]
  func generatePopularMediaItems() -> [any MediaCardViewModelProtocol]
}
