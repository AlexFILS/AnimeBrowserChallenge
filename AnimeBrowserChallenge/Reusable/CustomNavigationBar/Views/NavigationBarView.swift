//
//  NavigationBarView.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 11.11.2025.
//

import SwiftUI

struct NavigationBarView: View {
  private var title: String
  private var rightBarItem: NavigationBarButtonType
  private var leftBarItem: NavigationBarButtonType

  var body: some View {
    navigationBar
  }

  private var navigationBar: some View {
    HStack {
      generateLeftBarItem()
      Spacer()
      Text(title)
        .font(.custom("Merriweather", size: 16))
        .fontWeight(.black)
        .tracking(0.32)
      Spacer()
      generateRightBarItem()
    }
  }

  @ViewBuilder
  private func generateRightBarItem() -> some View {
    switch rightBarItem {
    case .button(let viewModel):
      Button(action: viewModel.action) {
        Image(viewModel.iconName, bundle: .main)
          .frame(width: 24, height: 24)
          .padding([.trailing], 24)
          .padding([.top], 18)
      }
    case .logo(_):
      EmptyView() // Unused, just for demo purpose
    }
  }

  @ViewBuilder
  private func generateLeftBarItem() -> some View {
    switch leftBarItem {
    case .button(let viewModel):
      Button(action: viewModel.action) {
        Image(viewModel.iconName, bundle: .main)
          .frame(width: 24, height: 24)
          .padding([.leading], 24)
          .padding([.top], 18)
      }
    case .logo(_):
      EmptyView() // Unused, just for demo purpose
    }
  }

  public init(
    title: String,
    rightBarItem: NavigationBarButtonType,
    leftBarItem: NavigationBarButtonType
  ) {
    self.title = title
    self.rightBarItem = rightBarItem
    self.leftBarItem = leftBarItem
  }
}

#Preview {
  NavigationBarView(
    title: "Navbar Title",
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
