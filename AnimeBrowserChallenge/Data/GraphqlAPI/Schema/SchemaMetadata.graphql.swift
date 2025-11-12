// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

protocol GraphqlAPI_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == GraphqlAPI.SchemaMetadata {}

protocol GraphqlAPI_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == GraphqlAPI.SchemaMetadata {}

protocol GraphqlAPI_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == GraphqlAPI.SchemaMetadata {}

protocol GraphqlAPI_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == GraphqlAPI.SchemaMetadata {}

extension GraphqlAPI {
  typealias SelectionSet = GraphqlAPI_SelectionSet

  typealias InlineFragment = GraphqlAPI_InlineFragment

  typealias MutableSelectionSet = GraphqlAPI_MutableSelectionSet

  typealias MutableInlineFragment = GraphqlAPI_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
      switch typename {
      case "Media": return GraphqlAPI.Objects.Media
      case "MediaCoverImage": return GraphqlAPI.Objects.MediaCoverImage
      case "MediaTitle": return GraphqlAPI.Objects.MediaTitle
      case "Page": return GraphqlAPI.Objects.Page
      case "Query": return GraphqlAPI.Objects.Query
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}