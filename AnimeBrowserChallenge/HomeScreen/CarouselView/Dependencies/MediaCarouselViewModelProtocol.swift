//
//  MediaCarouselViewModelProtocol.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 12.11.2025.
//

import SwiftUI

protocol MediaCarouselViewModelProtocol: ObservableObject {
  var mediaItems: [any MediaCardViewModelProtocol] { get }
  var errorMessage: String? { get }
}
