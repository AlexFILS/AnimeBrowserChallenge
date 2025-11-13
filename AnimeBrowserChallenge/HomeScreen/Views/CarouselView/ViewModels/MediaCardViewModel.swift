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
  let media: Media
  var mediaDownloader: MediaDownloaderProtocol?
  private var downloadTask: Task<Void, Never>?

  init(
    media: Media
  ) {
    self.media = media
  }

  @MainActor
  func loadMedia() async throws {
    mediaDownloader = MediaDownloader()
    cardState = .downloading
    downloadTask = Task {
      do {
        let downloadedImage = try await Task.detached(priority: .userInitiated) { [weak self] in
          try await self?.mediaDownloader?.downloadImage(from: self?.media.imagePath ?? "") ??
          {
            throw ApiError.invalidUrl
          }()
        }
          .value

        if !Task.isCancelled {
          self.image = downloadedImage
          cardState = .success
          mediaDownloader = nil
        }
      } catch {
        if !Task.isCancelled {
          cardState = .error
        }
      }
    }
    await downloadTask?.value
  }

  func cancelDownload() {
    downloadTask?.cancel()
    mediaDownloader = nil
  }
}
