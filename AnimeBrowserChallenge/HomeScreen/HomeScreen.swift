//
//  ContentView.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 07.11.2025.
//


import Apollo
import SwiftUI

import SwiftUI

struct HomeScreen<ViewModel: HomeScreenViewModelProtocol>: View {
  @ObservedObject private var viewModel: ViewModel
  @State private var selectedTab = 0
  private let title = "FilmKu"

  var body: some View {
    VStack {
      navigationBar
      Spacer()
      tabViewContent
      Spacer()
      customTabBar
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
        viewModel: ("icon_notifications", { print("Right item tapped") })
      ),
      leftBarItem: .button(
        viewModel: ("icon_menu", { print("Left item tapped") })
      )
    )
  }

  @ViewBuilder
  var tabViewContent: some View {
    switch selectedTab {
    case 0:
      homeScreenContent()
    case 1:
      Text("Tab 2 out of scope")
    case 2:
      Text("Tab 3 out of scope")
    default:
      homeScreenContent()
    }
  }

  var customTabBar: some View {
    HStack(spacing: 0) {
      tabBarItem(icon: "movie_icon", tag: 0)
      tabBarItem(icon: "ticket_icon", tag: 1)
      tabBarItem(icon: "bookmark_icon", tag: 2)
    }
    .frame(height: 60)
    .background(Color(.systemBackground))
  }

  func tabBarItem(icon: String, tag: Int) -> some View {
    Button(action: { selectedTab = tag }) {
      Image(icon)
        .resizable()
        .scaledToFit()
        .frame(width: 24, height: 24)
        .scaleEffect(selectedTab == tag ? 1.5 : 1)
      // Figma is missing assets so I added a scale effect to show the active tab
    }
    .frame(maxWidth: .infinity)
    .frame(height: 60)
  }

  @ViewBuilder
  func homeScreenContent() -> some View {
    if viewModel.isLoading {
      ProgressView()
    } else {
      Text("Am descarcat \(viewModel.pages.count) pagini de anime-uri")
    }
  }

  public init(viewModel: ViewModel) {
    self.viewModel = viewModel
  }
}

#Preview {
  HomeScreen(
    viewModel: HomeScreenViewModel(
      dataFethcer: ApolloFetcher()
    )
  )
}
