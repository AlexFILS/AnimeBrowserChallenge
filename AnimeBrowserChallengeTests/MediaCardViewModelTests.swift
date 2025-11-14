//
//  MediaCardViewModelTests.swift
//  AnimeBrowserChallengeTests
//
//  Created by Alexandru Mihai on 14.11.2025.
//

@testable import AnimeBrowserChallenge
import Testing
import Foundation

@Suite("MediaCardViewModel Tests")
struct MediaCardViewModelTests {

  @Test("Initial state should be downloading")
  func testInitialState() {
    let media = MockMedia()
    let downloader = MockMediaDownloader()
    let viewModel = MediaCardViewModel(media: media, mediaDownloader: downloader)

    #expect(viewModel.cardState == .downloading)
    #expect(viewModel.image == nil)
  }

  @Test("Loading media successfully updates state and image")
  func testDownloadSuccess() async throws {
    let media = MockMedia()
    let downloader = MockMediaDownloader()
    let viewModel = MediaCardViewModel(media: media, mediaDownloader: downloader)

    await viewModel.loadMedia()

    #expect(viewModel.cardState == .success)
    #expect(viewModel.image != nil)
  }

  @Test("Failed download updates state to error")
  func testDownloadFails() async throws {
    let media = MockMedia()
    let downloader = MockMediaDownloader()
    downloader.shouldFail = true
    let viewModel = MediaCardViewModel(media: media, mediaDownloader: downloader)

    do {
      await viewModel.loadMedia()
      #expect(viewModel.cardState == .error)
    }
  }

  @Test("Cancel download stops the task")
  func testDownloadCancelled() async throws {
    let media = MockMedia()
    let downloader = MockMediaDownloader()
    downloader.downloadDelay = 1_000_000_000 // 1 second
    let viewModel = MediaCardViewModel(media: media, mediaDownloader: downloader)

    let task = Task {
      await viewModel.loadMedia()
    }

    try await Task.sleep(nanoseconds: 100_000_000) // 0.1 second
    viewModel.cancelDownload()

    #expect(viewModel.mediaDownloader == nil)
  }
}
