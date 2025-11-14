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
  @StateObject private var tabBarViewModel = TabBarViewModel()
  private let title = "FilmKu"

  var body: some View {
    ZStack(alignment: .leading) {
      Color.gray.opacity(0.05)
        .frame(width: 150,alignment: .leading)
        .ignoresSafeArea()
    VStack {
      navigationBar
      tabContent
        .padding(.top, 16)
      Spacer()
      tabBar
    }
  }
    .task {
      do {
        try await viewModel.startFetchingData()
      } catch {
        print(error)
      }
    }
  }

  @ViewBuilder
  var tabContent: some View {
    switch tabBarViewModel.selectedTab {
    case 0:
      HomeTabContent(viewModel: viewModel)
    case 1:
      Text("Tab 2 out of scope")
    case 2:
      Text("Tab 3 out of scope")
    default:
      EmptyView()
    }
  }

  var tabBar: CustomTabBar {
    CustomTabBar(viewModel: tabBarViewModel)
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
