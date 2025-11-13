//
//  HomeScreenViewModelProtocol.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 10.11.2025.
//

import protocol SwiftUI.ObservableObject

protocol HomeScreenViewModelProtocol: ObservableObject {
  associatedtype DataModel
  var pages: [DataModel] { get }
  var dataFethcer: ApolloFetcherProtocol { get }
  var isLoading: Bool { get }
  func getPages() async throws
  func generateMediaItems() -> [MediaCardViewModel]
}
