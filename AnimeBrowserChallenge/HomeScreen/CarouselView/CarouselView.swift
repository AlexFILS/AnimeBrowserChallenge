//
//  CarouselView.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 12.11.2025.
//

import SwiftUI

struct CarouselView<ViewModel: MediaCarouselViewModelProtocol>: View {
  @ObservedObject var viewModel: ViewModel
  @State private var selectedIndex = 0

  var body: some View {
    VStack {
      HStack {
        title
          .padding(.bottom, 16)
        seeMore
      }
      .padding([.leading, .trailing], 24)
      carouselView
    }
  }

  @ViewBuilder
  private var carouselView: some View {
    CarouselContentView(elements: viewModel.mediaItems)
  }

  var title: some View {
    Text("Now Showing") //TODO: To extract from inline
      .font(.title2)
      .fontWeight(.bold)
      .frame(maxWidth: .infinity, alignment: .leading)
  }

  var seeMore: some View {
    Text("See more") //TODO: To extract from inline
      .font(.system(size: 8, weight: .regular))
      .foregroundColor(.gray)
      .frame(height: 20)
      .frame(maxWidth: 50)
      .background(Color.clear)
      .border(Color.gray.opacity(0.3), width: 1)
      .cornerRadius(15)
  }

}
