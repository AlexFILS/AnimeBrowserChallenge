//
//  MediaCardViewModelProtocol.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 12.11.2025.
//

import SwiftUI

protocol MediaCardViewModelProtocol: ObservableObject {
  var media: Media { get }
  var mediaDownloader: MediaDownloaderProtocol { get }
  var image: Image? { get }
  var cardState: MediaDownloadState { get set }

  func loadMedia() async throws
}
