// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI
@_spi(Execution) @_spi(Unsafe) import ApolloAPI

extension GraphqlAPI {
  struct MediaTrendQuery: GraphQLQuery {
    static let operationName: String = "MediaTrend"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query MediaTrend { MediaTrend { __typename media { __typename title { __typename english } id duration coverImage { __typename medium } averageScore genres } } }"#
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
        MediaTrendQuery.Data.self
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
          .field("media", Media?.self),
        ] }
        static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
          MediaTrendQuery.Data.MediaTrend.self
        ] }

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
            .field("title", Title?.self),
            .field("id", Int.self),
            .field("duration", Int?.self),
            .field("coverImage", CoverImage?.self),
            .field("averageScore", Int?.self),
            .field("genres", [String?]?.self),
          ] }
          static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
            MediaTrendQuery.Data.MediaTrend.Media.self
          ] }

          /// The official titles of the media in various languages
          var title: Title? { __data["title"] }
          /// The id of the media
          var id: Int { __data["id"] }
          /// The general length of each anime episode in minutes
          var duration: Int? { __data["duration"] }
          /// The cover images of the media
          var coverImage: CoverImage? { __data["coverImage"] }
          /// A weighted average score of all the user's scores of the media
          var averageScore: Int? { __data["averageScore"] }
          /// The genres of the media
          var genres: [String?]? { __data["genres"] }

          /// MediaTrend.Media.Title
          ///
          /// Parent Type: `MediaTitle`
          struct Title: GraphqlAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: any ApolloAPI.ParentType { GraphqlAPI.Objects.MediaTitle }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("english", String?.self),
            ] }
            static var __fulfilledFragments: [any ApolloAPI.SelectionSet.Type] { [
              MediaTrendQuery.Data.MediaTrend.Media.Title.self
            ] }

            /// The official english title
            var english: String? { __data["english"] }
          }

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
              MediaTrendQuery.Data.MediaTrend.Media.CoverImage.self
            ] }

            /// The cover image url of the media at medium size
            var medium: String? { __data["medium"] }
          }
        }
      }
    }
  }

}