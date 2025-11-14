//
//  CarouselContentView.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 14.11.2025.
//

import SwiftUI

struct CarouselContentView: View {
  var elements: [any MediaCardViewModelProtocol]
  
  var body: some View {
    if let castElements = elements as? [MediaCardViewModel] {
      let rows = [GridItem(.fixed(125))]
      ScrollView(.horizontal, showsIndicators: false) {
        LazyHGrid(rows: rows) {
          ForEach(castElements.indices, id: \.self) { index in
            MediaCardView(viewModel: castElements[index])
              .tag(index)
              .onAppear {
                Task {
                  if castElements[index].mediaDownloader == nil {
                    castElements[index].mediaDownloader = MediaDownloader()
                  }
                  await castElements[index].loadMedia()
                }
              }
              .onDisappear {
                castElements[index].cancelDownload()
              }
          }
        }
      }
      .frame(height: 275)
    }
  }
}
