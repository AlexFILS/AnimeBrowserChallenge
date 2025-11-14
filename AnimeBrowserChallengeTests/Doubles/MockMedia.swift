//
//  MockMedia.swift
//  AnimeBrowserChallengeTests
//
//  Created by Alexandru Mihai on 14.11.2025.
//

@testable import AnimeBrowserChallenge

class MockMedia: MediaCardRepresentableProtocol {
  var rating: Int = 20
  let title: String = "Test Movie"
  let imagePath: String = "https://example.com/image.jpg"
}
