//
//  TrendingCardView.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 13.11.2025.
//

import SwiftUI

struct TrendingCardView<ViewModel: MediaCardViewModelProtocol>: View {
 @ObservedObject var viewModel: ViewModel

  var body: some View {
    HStack(alignment: .top, spacing: 16) {
      posterImage
      contentStack
      Spacer()
    }
    .padding(12)
    .cornerRadius(12)
    .onAppear {
      Task {
        if viewModel.mediaDownloader == nil {
          viewModel.mediaDownloader = MediaDownloader()
        }
        try await viewModel.loadMedia()
      }
    }
    .onDisappear() {
      viewModel.cancelDownload()
    }
  }

  var posterImage: some View {
    ZStack {
      switch viewModel.cardState {
      case .downloading:
        Color.gray.opacity(0.2)
        ProgressView()
      case .success:
        viewModel.image!
          .resizable()
          .scaledToFill()
          .clipped()
      case .error:
        Image(systemName: "exclamationmark.triangle.fill")
          .font(.title2)
          .foregroundColor(.red)
      }
    }
    .frame(width: 100, height: 150)
    .cornerRadius(8)
  }

  var contentStack: some View {
    VStack(alignment: .leading, spacing: 8) {
      VStack(alignment: .leading, spacing: 8) {
        titleView
        ratingView
        genresView
      }
      .frame(height: 120, alignment: .leading)
      durationView
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }

  var titleView: some View {
    Text(viewModel.media.title)
      .font(.headline)
      .fontWeight(.semibold)
      .lineLimit(2)
  }

  var ratingView: some View {
    HStack(spacing: 4) {
      Image(systemName: "star.fill")
        .foregroundColor(.yellow)
        .font(.caption)
      Text("\(viewModel.media.rating)/100")
        .font(.caption)
        .fontWeight(.semibold)
    }
  }

  @ViewBuilder
  var genresView: some View {
    if let genres = viewModel.media.genres {
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 8) {
          ForEach(genres, id: \.self) { genre in
            Text(genre)
              .font(.caption2)
              .foregroundColor(.blue)
              .padding(.horizontal, 8)
              .padding(.vertical, 4)
              .background(Color.blue.opacity(0.15))
              .cornerRadius(12)
          }
        }
      }
    } else {
      Spacer()
    }
  }

  var durationView: some View {
    HStack(spacing: 4) {
      Image(systemName: "clock")
        .font(.caption)
        .foregroundColor(.gray)
      Text("\(viewModel.media.duration ?? 0) minutes")
        .font(.caption)
        .foregroundColor(.gray)
    }
  }
}

#Preview {
  TrendingCardView(
    viewModel:  MediaCardViewModel(
      media: TrendingMediaModel(
        title: "Venom Let There Be Carnage",
        imagePath: "https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/bx1-GCsPm7waJ4kS.png",
        rating: 10,
        genres: ["HORROR", "MYSTERY", "THRILLER"],
        duration: 100
      ),
      mediaDownloader: MediaDownloader()
    )
  )
  .padding()
}
