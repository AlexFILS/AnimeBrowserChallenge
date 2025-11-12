//
//  TabBarViewModelProtocol.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 11.11.2025.
//

import SwiftUI

protocol TabBarViewModelProtocol: ObservableObject {
  var selectedTab: Int { get set }
  var tabs: [TabBarItem] { get }
  func selectTab(_ id: Int)
}
