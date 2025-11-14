//
//  MockDownloader.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 14.11.2025.
//

@testable import AnimeBrowserChallenge
import Foundation
import SwiftUI

class MockMediaDownloader: MediaDownloaderProtocol {
  var image: Image?
  var isLoading: Bool = false
  var shouldFail: Bool = false
  var downloadDelay: UInt64 = 0

  func downloadImage(from urlString: String) throws -> Image {
    isLoading = true
    defer { isLoading = false }

    if downloadDelay > 0 {
      try Task.checkCancellation()
      Thread.sleep(forTimeInterval: Double(downloadDelay) / 1_000_000_000)
    }

    if shouldFail {
      throw NSError(domain: "Mock", code: -1, userInfo: [NSLocalizedDescriptionKey: "Mock download failed"])
    }

    let testImage = UIImage(systemName: "star.fill")!
    return Image(uiImage: testImage)
  }
}
