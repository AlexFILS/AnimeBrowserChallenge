// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

extension GraphqlAPI {
  struct GetTrendsQuery: GraphQLQuery {
    static let operationName: String = "GetTrends"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query GetTrends { MediaTrend { __typename mediaId media { __typename genres duration coverImage { __typename medium } } } }"#
      ))

    public init() {}

    struct Data: GraphqlAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { GraphqlAPI.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("MediaTrend", MediaTrend?.self),
      ] }
      static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
        GetTrendsQuery.Data.self
      ] }

      /// Media Trend query
      var mediaTrend: MediaTrend? { __data["MediaTrend"] }

      /// MediaTrend
      ///
      /// Parent Type: `MediaTrend`
      struct MediaTrend: GraphqlAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { GraphqlAPI.Objects.MediaTrend }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("mediaId", Int.self),
          .field("media", Media?.self),
        ] }
        static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          GetTrendsQuery.Data.MediaTrend.self
        ] }

        /// The id of the tag
        var mediaId: Int { __data["mediaId"] }
        /// The related media
        var media: Media? { __data["media"] }

        /// MediaTrend.Media
        ///
        /// Parent Type: `Media`
        struct Media: GraphqlAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { GraphqlAPI.Objects.Media }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("genres", [String?]?.self),
            .field("duration", Int?.self),
            .field("coverImage", CoverImage?.self),
          ] }
          static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            GetTrendsQuery.Data.MediaTrend.Media.self
          ] }

          /// The genres of the media
          var genres: [String?]? { __data["genres"] }
          /// The general length of each anime episode in minutes
          var duration: Int? { __data["duration"] }
          /// The cover images of the media
          var coverImage: CoverImage? { __data["coverImage"] }

          /// MediaTrend.Media.CoverImage
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
              GetTrendsQuery.Data.MediaTrend.Media.CoverImage.self
            ] }

            /// The cover image url of the media at medium size
            var medium: String? { __data["medium"] }
          }
        }
      }
    }
  }

}