//
//  MediaCardRepresentableProtocol.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 13.11.2025.
//

protocol MediaCardRepresentableProtocol {
  var title: String { get }
  var imagePath: String { get }
  var rating: Int { get }
  var genres: [String]? { get set }
  var duration: Int? { get set }
}

extension MediaCardRepresentableProtocol {
  var genres: [String]? {
    get {
      []
    }
    set {
      genres = newValue
    }
  }

  var duration: Int? {
    get {
      0
    }
    set {
      duration = newValue
    }
  }
}
