//
//  CustomTabBar.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 11.11.2025.
//

import SwiftUI

struct CustomTabBar: View {
  @ObservedObject var viewModel: TabBarViewModel

  var body: some View {
    HStack(spacing: 0) {
      ForEach(viewModel.tabs, id: \.id) { tab in
        tabBarItem(tab)
      }
    }
    .frame(height: 60)
    .background(Color(.systemBackground))
  }

  func tabBarItem(_ tab: TabBarItem) -> some View {
    Button(action: { viewModel.selectTab(tab.id) }) {
      Image(tab.icon)
        .resizable()
        .scaledToFit()
        .frame(width: 24, height: 24)
        //Scale the selection, because figma is missing assets for selected/unselected
        .scaleEffect(viewModel.selectedTab == tab.id ? 1.5 : 1)
    }
    .frame(maxWidth: .infinity)
    .frame(height: 60)
  }
}
