//
//  ApolloFetcherProtocol.swift
//  AnimeBrowserChallenge
//
//  Created by Alexandru Mihai on 10.11.2025.
//

import ApolloAPI
import Apollo
import Foundation

protocol ApolloFetcherProtocol {
  func fetch<T: GraphQLQuery>(query: T) async throws -> T.Data where T.ResponseFormat == SingleResponseFormat
}

