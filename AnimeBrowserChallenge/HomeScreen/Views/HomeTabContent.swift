//
//  HomeTabContent.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 11.11.2025.
//

import SwiftUI

struct HomeTabContent<ViewModel: HomeScreenViewModelProtocol>: View {
  @ObservedObject var viewModel: ViewModel
  private let popularTitle = "Popular"
  
  var body: some View {
    VStack(alignment: .leading) {
      animeListView()
        .frame(height: 350)
      popularTitleView
      trendingMediaView
      Spacer()
    }
  }
  
  @ViewBuilder
  var popularTitleView: some View {
    if viewModel.isLoading {
      Spacer()
    } else {
      Text(popularTitle)
        .font(.title2)
        .fontWeight(.bold)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 24)
    }
  }
  
  @ViewBuilder
  var trendingMediaView: some View {
    if let mediaViewModel = try? viewModel.generatePopularMediaItems() {
      TrendingCardView(
        viewModel:  MediaCardViewModel(
          media: mediaViewModel.media
        )
      )
    }
  }
  
  @ViewBuilder
  func animeListView() -> some View {
    if viewModel.isLoading {
      VStack {
        Spacer()
        HStack {
          Spacer()
          ProgressView()
          Spacer()
        }
        Spacer()
      }
    } else {
      let mediaItems = viewModel.generateMediaItems()
      CarouselView(
        viewModel: MediaCarouselViewModel(mediaItems: mediaItems)
      )
    }
  }
}
