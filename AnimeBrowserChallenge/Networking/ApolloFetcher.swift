//
//  ApolloFetcher.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 10.11.2025.
//

import Apollo

class ApolloFetcher: ApolloFetcherProtocol {
  func fetch<T: GraphQLQuery>(query: T) async throws -> T.Data where T.ResponseFormat == SingleResponseFormat {
    let response = try await ApolloManager.shared.client.fetch(query: query)
    if let data = response.data {
      return data
    } else {
      throw ApiError.dataMissing
    }
  }
}
