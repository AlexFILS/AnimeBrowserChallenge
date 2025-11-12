//
//  MediaCardView.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 12.11.2025.
//

import SwiftUI

struct MediaCardView<ViewModel: MediaCardViewModelProtocol>: View {
  @ObservedObject private var viewModel: ViewModel

  var body: some View {
    ZStack {
      mediaCard
    }
  }

  var mediaCard: some View {
    ZStack {
      switch viewModel.cardState {
      case .downloading:
        Color.gray.opacity(0.1)
        ProgressView()
      case .success:
        viewModel.image!
          .resizable()
          .scaledToFill()
      case .error:
        Color.gray.opacity(0.1)
        Image(systemName: "exclamationmark.triangle.fill")
          .font(.title2)
          .foregroundColor(.red)
      }
    }
    .frame(width: 125, height: 230)
    .cornerRadius(8)
    .border(Color.gray.opacity(0.5), width: 1)
    .task {
      do {
        try await viewModel.loadMedia()
      } catch {
        print("Somethign went wrong: \(error)")
      }
    }
  }


  init(viewModel: ViewModel) {
    self.viewModel = viewModel
  }
}


#Preview {
  let mediaPath = "https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/bx1-GCsPm7waJ4kS.png"
  MediaCardView(
    viewModel:
      MediaCardViewModel(
        media: Media(
          title: "Some Anime",
          imagePath: mediaPath,
          rating: "10/10"
        ),
        mediaDownloader: MediaDownloader()
      )
  )
}

//Commented for performance - error in url example
//#Preview {
//  let mediaPath = "fakepath"
//  MediaCardView(
//    viewModel:
//      MediaCardViewModel(
//        media: Media(
//          title: "Some Anime",
//          imagePath: mediaPath,
//          rating: "10/10"
//        ),
//        mediaDownloader: MediaDownloader()
//      )
//  )
//}
