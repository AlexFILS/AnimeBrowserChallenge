//
//  ContentView.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 07.11.2025.
//


import Apollo
import SwiftUI

struct HomeScreen<ViewModel: HomeScreenViewModelProtocol>: View {
  @ObservedObject private var viewModel: ViewModel

  var body: some View {
    VStack {
      if viewModel.isLoading {
        ProgressView()
      } else {
        Text("Am descarcat \(viewModel.pages.count) pagini de anime-uri")
      }
    }
    .padding()
    .task {
      do {
        try await viewModel.getPages()
      } catch {
        print(error)
      }
    }
  }

  public init(viewModel: ViewModel) {
    self.viewModel = viewModel
  }
}

#Preview {
  HomeScreen(viewModel: HomeScreenViewModel(
    dataFethcer: ApolloFetcher()
    )
  )
}
