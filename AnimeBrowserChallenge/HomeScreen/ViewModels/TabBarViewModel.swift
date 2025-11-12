//
//  TabBarViewModel.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 11.11.2025.
//

import SwiftUI

class TabBarViewModel: TabBarViewModelProtocol {
  @Published var selectedTab = 0

  let tabs = [
    TabBarItem(id: 0, icon: "movie_icon"),
    TabBarItem(id: 1, icon: "ticket_icon"),
    TabBarItem(id: 2, icon: "bookmark_icon")
  ]

  func selectTab(_ id: Int) {
    selectedTab = id
  }
}

