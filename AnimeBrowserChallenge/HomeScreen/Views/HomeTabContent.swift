//
//  HomeTabContent.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 11.11.2025.
//

import SwiftUI

struct HomeTabContent<ViewModel: HomeScreenViewModelProtocol>: View {
  @ObservedObject var viewModel: ViewModel
  
  var body: some View {
    mainContent()
    Spacer()
  }
  
  @ViewBuilder
  func mainContent() -> some View {
    if viewModel.isLoading {
      ProgressView()
    } else {
      let mediaItems = viewModel.generateMediaItems()
      CarouselView(
        viewModel: MediaCarouselViewModel(mediaItems: mediaItems)
      )
    }
  }
}
