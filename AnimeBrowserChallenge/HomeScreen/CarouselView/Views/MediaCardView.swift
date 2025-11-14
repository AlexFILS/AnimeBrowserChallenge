//
//  MediaCardView.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 12.11.2025.
//

import SwiftUI

struct MediaCardView<ViewModel: MediaCardViewModelProtocol>: View {
  @ObservedObject private var viewModel: ViewModel
  let totalCardWidth: CGFloat = 125

  var body: some View {
    VStack(alignment: .leading) {
      mediaCard()
        .padding(.leading, 24)
        .frame(width: totalCardWidth, height: 200)
      title
        .frame(width: totalCardWidth, alignment: .leading)
      rating
        .frame(width: totalCardWidth, alignment: .leading)
    }
    .padding([.leading, .trailing], 24)
  }

  @ViewBuilder
  func mediaCard() -> some View {
    switch viewModel.cardState {
    case .downloading:
      ProgressView()
    case .success:
      viewModel.image! //Safe because of the flow of the screen :)
        .resizable()
        .scaledToFill()
    case .error:
      Color.gray.opacity(0.1)
      Image(systemName: "exclamationmark.triangle.fill")
        .font(.title2)
        .foregroundColor(.red)
    }
  }

  var title: some View {
    Text(viewModel.media.title)
      .font(.headline)
      .fontWeight(.semibold)
      .lineLimit(2)
  }

  var rating: some View {
    HStack(spacing: 4) {
      Image(systemName: "star.fill")
        .foregroundColor(.yellow)
      Text("\(viewModel.media.rating) /10")
        .font(.caption)
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
        media: MediaModel(
          title: "Some anime beboop",
          imagePath: mediaPath,
          rating: 10
        )
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
