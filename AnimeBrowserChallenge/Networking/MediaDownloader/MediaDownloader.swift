//
//  MediaDownloader.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 12.11.2025.
//

import Combine
import struct SwiftUI.Image
import Foundation
import class UIKit.UIImage

class MediaDownloader: MediaDownloaderProtocol {
  private var cancellables = Set<AnyCancellable>()

  func downloadImage(from urlString: String) async throws -> Image {
    guard let url = URL(string: urlString) else {
      throw ApiError.invalidUrl
    }

    let (data, response) = try await URLSession.shared.data(from: url)

    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
      throw ApiError.apiError
    }

    guard let uiImage = UIImage(data: data) else {
      throw InternalError.cannotParseImage
    }

    return Image(uiImage: uiImage)
  }
}
