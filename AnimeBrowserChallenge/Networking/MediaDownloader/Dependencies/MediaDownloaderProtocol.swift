//
//  MediaDownloaderProtocol.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 12.11.2025.
//

import SwiftUI

protocol MediaDownloaderProtocol {
  func downloadImage(from urlString: String) async throws -> Image
}
