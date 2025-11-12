//
//  MediaCardViewModel.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 12.11.2025.
//

import SwiftUI

class MediaCardViewModel: MediaCardViewModelProtocol {
  let media: Media
  let mediaDownloader: MediaDownloaderProtocol
  @Published var image: Image?
  @Published var cardState: MediaDownloadState = .downloading
  
  @MainActor
  func loadMedia() async throws {
    cardState = .downloading
    do {
      let downloadedImage = try await Task.detached(priority: .userInitiated) { [weak self] in
        try await self?.mediaDownloader.downloadImage(from: self?.media.imagePath ?? "") ??
        {
          throw ApiError.invalidUrl
        }()
      }
        .value
      
      self.image = downloadedImage
      cardState = .success
    } catch {
      cardState = .error
      throw ApiError.apiError
    }
  }
  
  init(
    media: Media,
    mediaDownloader: MediaDownloaderProtocol
  ) {
    self.media = media
    self.mediaDownloader = mediaDownloader
  }
}
