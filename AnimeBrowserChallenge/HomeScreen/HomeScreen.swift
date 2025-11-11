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
  private var title = "FilmKu"
  var body: some View {
    VStack {
      navigationBar
      Spacer()
      if viewModel.isLoading {
        ProgressView()
      } else {
        Text("Am descarcat \(viewModel.pages.count) pagini de anime-uri")
      }
      Spacer()
    }
    .task {
      do {
        try await viewModel.getPages()
      } catch {
        print(error)
      }
    }
  }

  var navigationBar: NavigationBarView {
    NavigationBarView(
      title: title,
      rightBarItem: .button(
        viewModel:
          (
            "icon_notifications",
            { print("Right item tapped") }
          )
      ),
      leftBarItem: .button(
        viewModel:
          (
            "icon_menu",
            { print("Left item tapped") }
          )
      )
    )
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
