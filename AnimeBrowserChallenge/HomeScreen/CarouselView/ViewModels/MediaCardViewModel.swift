//
//  MediaCardViewModel.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 12.11.2025.
//

import SwiftUI
import Combine

class MediaCardViewModel: MediaCardViewModelProtocol {
  @Published var image: Image?
  @Published var cardState: MediaDownloadState = .downloading

  let media: MediaCardRepresentableProtocol
  var mediaDownloader: MediaDownloaderProtocol?
  private var downloadTask: Task<Image, Error>?

  init(
    media: MediaCardRepresentableProtocol,
    mediaDownloader: MediaDownloaderProtocol
  ) {
    self.media = media
    self.mediaDownloader = mediaDownloader
  }

  @MainActor
  func loadMedia() async {
    cardState = .downloading
    do {
      let image = try await fetchImage()
      if downloadTask != nil {
        downloadTask = nil
      }
      cardState = .success
      self.image = image
      mediaDownloader = nil
    } catch {
      cardState = .error
    }
  }

  func cancelDownload() {
    downloadTask?.cancel()
    mediaDownloader = nil
  }
}

private extension MediaCardViewModel {
  func fetchImage() async throws -> Image {
    downloadTask = Task.detached(priority: .userInitiated) { [weak self] in
      try await self?.mediaDownloader?.downloadImage(from: self?.media.imagePath ?? "") ??
      {
        self?.cardState = .error
        throw ApiError.invalidUrl
      }()
    }
    return try await downloadTask!.value
  }
}
