//
//  MediaCarouselViewModel.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 12.11.2025.
//

import SwiftUI

class MediaCarouselViewModel: MediaCarouselViewModelProtocol {
  @Published var mediaItems: [MediaCardViewModel]
  @Published var isLoading = false
  @Published var errorMessage: String?
  
  init(mediaItems: [MediaCardViewModel]) {
    self.mediaItems = mediaItems
  }
}
