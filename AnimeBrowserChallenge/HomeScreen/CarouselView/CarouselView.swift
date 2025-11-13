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
      Spacer()
    }
  }

  @ViewBuilder
  private var carouselView: some View {
    let rows = [GridItem(.fixed(125))]
    ScrollView(.horizontal, showsIndicators: false) {
      LazyHGrid(rows: rows) {
        ForEach(viewModel.mediaItems.indices, id: \.self) { index in
          MediaCardView(viewModel: viewModel.mediaItems[index])
            .tag(index)
            .onAppear {
              Task {
                do {
                  try await viewModel.mediaItems[index].loadMedia()
                } catch {
                  print("Somethign went wrong: \(error)")
                }
              }
            }
            .onDisappear {
              viewModel.mediaItems[index].cancelDownload()
            }
        }
      }
    }
    .frame(height: 375)
  }

  var title: some View {
    Text("Now Showing")
      .font(.title2)
      .fontWeight(.bold)
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(.horizontal, 16)
  }

  var seeMore: some View {
    Text("See more")
      .font(.system(size: 8, weight: .regular))
      .foregroundColor(.gray)
      .frame(height: 20)
      .frame(maxWidth: 50)
      .background(Color.clear)
      .border(Color.gray.opacity(0.3), width: 1)
      .cornerRadius(15)
  }

}
