//
//  NavigationBarButton.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 11.11.2025.
//

enum NavigationBarButtonType {
  typealias NavigationButtonViewModel = (iconName: String, action: () -> Void)
  case button(viewModel: NavigationButtonViewModel)
  case logo(name: String) // Example of having just a logo as a navbar item (no action)
}
