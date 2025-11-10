//
//  ApolloManager.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 10.11.2025.
//

import Apollo
import struct Foundation.URL

final class ApolloManager {
  static let shared = ApolloManager()
  let client: ApolloClient

  private init() {
    client = ApolloClient(url: URL(string: Constants.baseUrl.rawValue)!)
  }
}
