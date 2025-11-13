// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

extension GraphqlAPI {
  struct GetPagesQuery: GraphQLQuery {
    static let operationName: String = "GetPages"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query GetPages { Page { __typename media { __typename siteUrl title { __typename english native } description coverImage { __typename medium } } } }"#
      ))

    public init() {}

    struct Data: GraphqlAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { GraphqlAPI.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("Page", Page?.self),
      ] }
      static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        GetPagesQuery.Data.self
      ] }

      var page: Page? { __data["Page"] }

      /// Page
      ///
      /// Parent Type: `Page`
      struct Page: GraphqlAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { GraphqlAPI.Objects.Page }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("media", [Medium?]?.self),
        ] }
        static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          GetPagesQuery.Data.Page.self
        ] }

        var media: [Medium?]? { __data["media"] }

        /// Page.Medium
        ///
        /// Parent Type: `Media`
        struct Medium: GraphqlAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { GraphqlAPI.Objects.Media }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("siteUrl", String?.self),
            .field("title", Title?.self),
            .field("description", String?.self),
            .field("coverImage", CoverImage?.self),
          ] }
          static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            GetPagesQuery.Data.Page.Medium.self
          ] }

          /// The url for the media page on the AniList website
          var siteUrl: String? { __data["siteUrl"] }
          /// The official titles of the media in various languages
          var title: Title? { __data["title"] }
          /// Short description of the media's story and characters
          var description: String? { __data["description"] }
          /// The cover images of the media
          var coverImage: CoverImage? { __data["coverImage"] }

          /// Page.Medium.Title
          ///
          /// Parent Type: `MediaTitle`
          struct Title: GraphqlAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: any ApolloAPI.ParentType { GraphqlAPI.Objects.MediaTitle }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("english", String?.self),
              .field("native", String?.self),
            ] }
            static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              GetPagesQuery.Data.Page.Medium.Title.self
            ] }

            /// The official english title
            var english: String? { __data["english"] }
            /// Official title in it's native language
            var native: String? { __data["native"] }
          }

          /// Page.Medium.CoverImage
          ///
          /// Parent Type: `MediaCoverImage`
          struct CoverImage: GraphqlAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: any ApolloAPI.ParentType { GraphqlAPI.Objects.MediaCoverImage }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("medium", String?.self),
            ] }
            static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              GetPagesQuery.Data.Page.Medium.CoverImage.self
            ] }

            /// The cover image url of the media at medium size
            var medium: String? { __data["medium"] }
          }
        }
      }
    }
  }

}