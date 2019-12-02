//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class FindAllAlbumQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query findAllAlbum {
      findAllAlbum {
        __typename
        id
        name
        created
        images {
          __typename
          id
          image {
            __typename
            id
            name
            url
          }
          audioWho {
            __typename
            id
            name
            url
          }
          audioWhen {
            __typename
            id
            name
            url
          }
          audioWhere {
            __typename
            id
            name
            url
          }
        }
      }
    }
    """

  public let operationName = "findAllAlbum"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("findAllAlbum", type: .list(.nonNull(.object(FindAllAlbum.selections)))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(findAllAlbum: [FindAllAlbum]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "findAllAlbum": findAllAlbum.flatMap { (value: [FindAllAlbum]) -> [ResultMap] in value.map { (value: FindAllAlbum) -> ResultMap in value.resultMap } }])
    }

    public var findAllAlbum: [FindAllAlbum]? {
      get {
        return (resultMap["findAllAlbum"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [FindAllAlbum] in value.map { (value: ResultMap) -> FindAllAlbum in FindAllAlbum(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [FindAllAlbum]) -> [ResultMap] in value.map { (value: FindAllAlbum) -> ResultMap in value.resultMap } }, forKey: "findAllAlbum")
      }
    }

    public struct FindAllAlbum: GraphQLSelectionSet {
      public static let possibleTypes = ["Album"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("created", type: .nonNull(.scalar(String.self))),
        GraphQLField("images", type: .list(.object(Image.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String, created: String, images: [Image?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Album", "id": id, "name": name, "created": created, "images": images.flatMap { (value: [Image?]) -> [ResultMap?] in value.map { (value: Image?) -> ResultMap? in value.flatMap { (value: Image) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var created: String {
        get {
          return resultMap["created"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "created")
        }
      }

      public var images: [Image?]? {
        get {
          return (resultMap["images"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Image?] in value.map { (value: ResultMap?) -> Image? in value.flatMap { (value: ResultMap) -> Image in Image(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Image?]) -> [ResultMap?] in value.map { (value: Image?) -> ResultMap? in value.flatMap { (value: Image) -> ResultMap in value.resultMap } } }, forKey: "images")
        }
      }

      public struct Image: GraphQLSelectionSet {
        public static let possibleTypes = ["Image"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("image", type: .nonNull(.object(Image.selections))),
          GraphQLField("audioWho", type: .object(AudioWho.selections)),
          GraphQLField("audioWhen", type: .object(AudioWhen.selections)),
          GraphQLField("audioWhere", type: .object(AudioWhere.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, image: Image, audioWho: AudioWho? = nil, audioWhen: AudioWhen? = nil, audioWhere: AudioWhere? = nil) {
          self.init(unsafeResultMap: ["__typename": "Image", "id": id, "image": image.resultMap, "audioWho": audioWho.flatMap { (value: AudioWho) -> ResultMap in value.resultMap }, "audioWhen": audioWhen.flatMap { (value: AudioWhen) -> ResultMap in value.resultMap }, "audioWhere": audioWhere.flatMap { (value: AudioWhere) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var image: Image {
          get {
            return Image(unsafeResultMap: resultMap["image"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "image")
          }
        }

        public var audioWho: AudioWho? {
          get {
            return (resultMap["audioWho"] as? ResultMap).flatMap { AudioWho(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "audioWho")
          }
        }

        public var audioWhen: AudioWhen? {
          get {
            return (resultMap["audioWhen"] as? ResultMap).flatMap { AudioWhen(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "audioWhen")
          }
        }

        public var audioWhere: AudioWhere? {
          get {
            return (resultMap["audioWhere"] as? ResultMap).flatMap { AudioWhere(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "audioWhere")
          }
        }

        public struct Image: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("url", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String, url: String) {
            self.init(unsafeResultMap: ["__typename": "Attachment", "id": id, "name": name, "url": url])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var url: String {
            get {
              return resultMap["url"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "url")
            }
          }
        }

        public struct AudioWho: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("url", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String, url: String) {
            self.init(unsafeResultMap: ["__typename": "Attachment", "id": id, "name": name, "url": url])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var url: String {
            get {
              return resultMap["url"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "url")
            }
          }
        }

        public struct AudioWhen: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("url", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String, url: String) {
            self.init(unsafeResultMap: ["__typename": "Attachment", "id": id, "name": name, "url": url])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var url: String {
            get {
              return resultMap["url"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "url")
            }
          }
        }

        public struct AudioWhere: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("url", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String, url: String) {
            self.init(unsafeResultMap: ["__typename": "Attachment", "id": id, "name": name, "url": url])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var url: String {
            get {
              return resultMap["url"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "url")
            }
          }
        }
      }
    }
  }
}

public final class SaveAlbumMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation saveAlbum($name: String!) {
      saveAlbum(name: $name) {
        __typename
        name
        author {
          __typename
          id
          firstName
          lastName
        }
      }
    }
    """

  public let operationName = "saveAlbum"

  public var name: String

  public init(name: String) {
    self.name = name
  }

  public var variables: GraphQLMap? {
    return ["name": name]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("saveAlbum", arguments: ["name": GraphQLVariable("name")], type: .nonNull(.object(SaveAlbum.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(saveAlbum: SaveAlbum) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "saveAlbum": saveAlbum.resultMap])
    }

    public var saveAlbum: SaveAlbum {
      get {
        return SaveAlbum(unsafeResultMap: resultMap["saveAlbum"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "saveAlbum")
      }
    }

    public struct SaveAlbum: GraphQLSelectionSet {
      public static let possibleTypes = ["Album"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("author", type: .nonNull(.object(Author.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String, author: Author) {
        self.init(unsafeResultMap: ["__typename": "Album", "name": name, "author": author.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var author: Author {
        get {
          return Author(unsafeResultMap: resultMap["author"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "author")
        }
      }

      public struct Author: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("firstName", type: .scalar(String.self)),
          GraphQLField("lastName", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, firstName: String? = nil, lastName: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "firstName": firstName, "lastName": lastName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var firstName: String? {
          get {
            return resultMap["firstName"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "firstName")
          }
        }

        public var lastName: String? {
          get {
            return resultMap["lastName"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "lastName")
          }
        }
      }
    }
  }
}

public final class DeleteAlbumMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation deleteAlbum($id: ID!) {
      deleteAlbum(id: $id) {
        __typename
        name
      }
    }
    """

  public let operationName = "deleteAlbum"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteAlbum", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(DeleteAlbum.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteAlbum: DeleteAlbum) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "deleteAlbum": deleteAlbum.resultMap])
    }

    public var deleteAlbum: DeleteAlbum {
      get {
        return DeleteAlbum(unsafeResultMap: resultMap["deleteAlbum"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "deleteAlbum")
      }
    }

    public struct DeleteAlbum: GraphQLSelectionSet {
      public static let possibleTypes = ["Album"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String) {
        self.init(unsafeResultMap: ["__typename": "Album", "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public final class GenerateUrlMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation generateURL($name: String!) {
      generateURL(name: $name) {
        __typename
        url
      }
    }
    """

  public let operationName = "generateURL"

  public var name: String

  public init(name: String) {
    self.name = name
  }

  public var variables: GraphQLMap? {
    return ["name": name]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("generateURL", arguments: ["name": GraphQLVariable("name")], type: .nonNull(.object(GenerateUrl.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(generateUrl: GenerateUrl) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "generateURL": generateUrl.resultMap])
    }

    public var generateUrl: GenerateUrl {
      get {
        return GenerateUrl(unsafeResultMap: resultMap["generateURL"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "generateURL")
      }
    }

    public struct GenerateUrl: GraphQLSelectionSet {
      public static let possibleTypes = ["Attachment"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("url", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(url: String) {
        self.init(unsafeResultMap: ["__typename": "Attachment", "url": url])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var url: String {
        get {
          return resultMap["url"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "url")
        }
      }
    }
  }
}

public final class FindAllImageQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query findAllImage {
      findAllImage {
        __typename
        image {
          __typename
          name
          originalName
        }
      }
    }
    """

  public let operationName = "findAllImage"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("findAllImage", type: .list(.nonNull(.object(FindAllImage.selections)))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(findAllImage: [FindAllImage]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "findAllImage": findAllImage.flatMap { (value: [FindAllImage]) -> [ResultMap] in value.map { (value: FindAllImage) -> ResultMap in value.resultMap } }])
    }

    public var findAllImage: [FindAllImage]? {
      get {
        return (resultMap["findAllImage"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [FindAllImage] in value.map { (value: ResultMap) -> FindAllImage in FindAllImage(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [FindAllImage]) -> [ResultMap] in value.map { (value: FindAllImage) -> ResultMap in value.resultMap } }, forKey: "findAllImage")
      }
    }

    public struct FindAllImage: GraphQLSelectionSet {
      public static let possibleTypes = ["Image"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("image", type: .nonNull(.object(Image.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(image: Image) {
        self.init(unsafeResultMap: ["__typename": "Image", "image": image.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var image: Image {
        get {
          return Image(unsafeResultMap: resultMap["image"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "image")
        }
      }

      public struct Image: GraphQLSelectionSet {
        public static let possibleTypes = ["Attachment"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("originalName", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String, originalName: String) {
          self.init(unsafeResultMap: ["__typename": "Attachment", "name": name, "originalName": originalName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var originalName: String {
          get {
            return resultMap["originalName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "originalName")
          }
        }
      }
    }
  }
}

public final class SaveImageMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation saveImage($imageId: ID!, $albumId: ID!) {
      saveImage(imageId: $imageId, albumId: $albumId) {
        __typename
        image {
          __typename
          name
        }
      }
    }
    """

  public let operationName = "saveImage"

  public var imageId: GraphQLID
  public var albumId: GraphQLID

  public init(imageId: GraphQLID, albumId: GraphQLID) {
    self.imageId = imageId
    self.albumId = albumId
  }

  public var variables: GraphQLMap? {
    return ["imageId": imageId, "albumId": albumId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("saveImage", arguments: ["imageId": GraphQLVariable("imageId"), "albumId": GraphQLVariable("albumId")], type: .object(SaveImage.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(saveImage: SaveImage? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "saveImage": saveImage.flatMap { (value: SaveImage) -> ResultMap in value.resultMap }])
    }

    public var saveImage: SaveImage? {
      get {
        return (resultMap["saveImage"] as? ResultMap).flatMap { SaveImage(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "saveImage")
      }
    }

    public struct SaveImage: GraphQLSelectionSet {
      public static let possibleTypes = ["Image"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("image", type: .nonNull(.object(Image.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(image: Image) {
        self.init(unsafeResultMap: ["__typename": "Image", "image": image.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var image: Image {
        get {
          return Image(unsafeResultMap: resultMap["image"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "image")
        }
      }

      public struct Image: GraphQLSelectionSet {
        public static let possibleTypes = ["Attachment"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String) {
          self.init(unsafeResultMap: ["__typename": "Attachment", "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}

public final class FindAlbumByIdMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation findAlbumById($id: ID!) {
      findAlbumById(id: $id) {
        __typename
        name
        images {
          __typename
          image {
            __typename
            name
          }
          created
          audioWho {
            __typename
            name
          }
          audioWhen {
            __typename
            name
          }
          audioWhere {
            __typename
            name
          }
        }
        shareCode
        created
        author {
          __typename
          firstName
          lastName
        }
      }
    }
    """

  public let operationName = "findAlbumById"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("findAlbumById", arguments: ["id": GraphQLVariable("id")], type: .object(FindAlbumById.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(findAlbumById: FindAlbumById? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "findAlbumById": findAlbumById.flatMap { (value: FindAlbumById) -> ResultMap in value.resultMap }])
    }

    public var findAlbumById: FindAlbumById? {
      get {
        return (resultMap["findAlbumById"] as? ResultMap).flatMap { FindAlbumById(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "findAlbumById")
      }
    }

    public struct FindAlbumById: GraphQLSelectionSet {
      public static let possibleTypes = ["Album"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("images", type: .list(.object(Image.selections))),
        GraphQLField("shareCode", type: .nonNull(.scalar(String.self))),
        GraphQLField("created", type: .nonNull(.scalar(String.self))),
        GraphQLField("author", type: .nonNull(.object(Author.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String, images: [Image?]? = nil, shareCode: String, created: String, author: Author) {
        self.init(unsafeResultMap: ["__typename": "Album", "name": name, "images": images.flatMap { (value: [Image?]) -> [ResultMap?] in value.map { (value: Image?) -> ResultMap? in value.flatMap { (value: Image) -> ResultMap in value.resultMap } } }, "shareCode": shareCode, "created": created, "author": author.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var images: [Image?]? {
        get {
          return (resultMap["images"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Image?] in value.map { (value: ResultMap?) -> Image? in value.flatMap { (value: ResultMap) -> Image in Image(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Image?]) -> [ResultMap?] in value.map { (value: Image?) -> ResultMap? in value.flatMap { (value: Image) -> ResultMap in value.resultMap } } }, forKey: "images")
        }
      }

      public var shareCode: String {
        get {
          return resultMap["shareCode"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "shareCode")
        }
      }

      public var created: String {
        get {
          return resultMap["created"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "created")
        }
      }

      public var author: Author {
        get {
          return Author(unsafeResultMap: resultMap["author"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "author")
        }
      }

      public struct Image: GraphQLSelectionSet {
        public static let possibleTypes = ["Image"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("image", type: .nonNull(.object(Image.selections))),
          GraphQLField("created", type: .nonNull(.scalar(String.self))),
          GraphQLField("audioWho", type: .object(AudioWho.selections)),
          GraphQLField("audioWhen", type: .object(AudioWhen.selections)),
          GraphQLField("audioWhere", type: .object(AudioWhere.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(image: Image, created: String, audioWho: AudioWho? = nil, audioWhen: AudioWhen? = nil, audioWhere: AudioWhere? = nil) {
          self.init(unsafeResultMap: ["__typename": "Image", "image": image.resultMap, "created": created, "audioWho": audioWho.flatMap { (value: AudioWho) -> ResultMap in value.resultMap }, "audioWhen": audioWhen.flatMap { (value: AudioWhen) -> ResultMap in value.resultMap }, "audioWhere": audioWhere.flatMap { (value: AudioWhere) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var image: Image {
          get {
            return Image(unsafeResultMap: resultMap["image"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "image")
          }
        }

        public var created: String {
          get {
            return resultMap["created"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "created")
          }
        }

        public var audioWho: AudioWho? {
          get {
            return (resultMap["audioWho"] as? ResultMap).flatMap { AudioWho(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "audioWho")
          }
        }

        public var audioWhen: AudioWhen? {
          get {
            return (resultMap["audioWhen"] as? ResultMap).flatMap { AudioWhen(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "audioWhen")
          }
        }

        public var audioWhere: AudioWhere? {
          get {
            return (resultMap["audioWhere"] as? ResultMap).flatMap { AudioWhere(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "audioWhere")
          }
        }

        public struct Image: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String) {
            self.init(unsafeResultMap: ["__typename": "Attachment", "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }

        public struct AudioWho: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String) {
            self.init(unsafeResultMap: ["__typename": "Attachment", "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }

        public struct AudioWhen: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String) {
            self.init(unsafeResultMap: ["__typename": "Attachment", "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }

        public struct AudioWhere: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String) {
            self.init(unsafeResultMap: ["__typename": "Attachment", "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }
      }

      public struct Author: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("firstName", type: .scalar(String.self)),
          GraphQLField("lastName", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(firstName: String? = nil, lastName: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "firstName": firstName, "lastName": lastName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var firstName: String? {
          get {
            return resultMap["firstName"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "firstName")
          }
        }

        public var lastName: String? {
          get {
            return resultMap["lastName"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "lastName")
          }
        }
      }
    }
  }
}

public final class FindAllImageByAlbumIdMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation findAllImageByAlbumId($albumId: ID!) {
      findAllImageByAlbumId(albumId: $albumId) {
        __typename
        id
        image {
          __typename
          name
          originalName
        }
        album {
          __typename
          id
          name
        }
      }
    }
    """

  public let operationName = "findAllImageByAlbumId"

  public var albumId: GraphQLID

  public init(albumId: GraphQLID) {
    self.albumId = albumId
  }

  public var variables: GraphQLMap? {
    return ["albumId": albumId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("findAllImageByAlbumId", arguments: ["albumId": GraphQLVariable("albumId")], type: .list(.nonNull(.object(FindAllImageByAlbumId.selections)))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(findAllImageByAlbumId: [FindAllImageByAlbumId]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "findAllImageByAlbumId": findAllImageByAlbumId.flatMap { (value: [FindAllImageByAlbumId]) -> [ResultMap] in value.map { (value: FindAllImageByAlbumId) -> ResultMap in value.resultMap } }])
    }

    public var findAllImageByAlbumId: [FindAllImageByAlbumId]? {
      get {
        return (resultMap["findAllImageByAlbumId"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [FindAllImageByAlbumId] in value.map { (value: ResultMap) -> FindAllImageByAlbumId in FindAllImageByAlbumId(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [FindAllImageByAlbumId]) -> [ResultMap] in value.map { (value: FindAllImageByAlbumId) -> ResultMap in value.resultMap } }, forKey: "findAllImageByAlbumId")
      }
    }

    public struct FindAllImageByAlbumId: GraphQLSelectionSet {
      public static let possibleTypes = ["Image"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("image", type: .nonNull(.object(Image.selections))),
        GraphQLField("album", type: .nonNull(.object(Album.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, image: Image, album: Album) {
        self.init(unsafeResultMap: ["__typename": "Image", "id": id, "image": image.resultMap, "album": album.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var image: Image {
        get {
          return Image(unsafeResultMap: resultMap["image"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "image")
        }
      }

      public var album: Album {
        get {
          return Album(unsafeResultMap: resultMap["album"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "album")
        }
      }

      public struct Image: GraphQLSelectionSet {
        public static let possibleTypes = ["Attachment"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("originalName", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String, originalName: String) {
          self.init(unsafeResultMap: ["__typename": "Attachment", "name": name, "originalName": originalName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var originalName: String {
          get {
            return resultMap["originalName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "originalName")
          }
        }
      }

      public struct Album: GraphQLSelectionSet {
        public static let possibleTypes = ["Album"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String) {
          self.init(unsafeResultMap: ["__typename": "Album", "id": id, "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}

public final class FindAllAlbumByAuthorQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query findAllAlbumByAuthor {
      findAllAlbumByAuthor {
        __typename
        name
        images {
          __typename
          image {
            __typename
            name
          }
          audioWho {
            __typename
            name
          }
          audioWhen {
            __typename
            name
          }
          audioWhere {
            __typename
            name
          }
        }
        created
      }
    }
    """

  public let operationName = "findAllAlbumByAuthor"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("findAllAlbumByAuthor", type: .list(.nonNull(.object(FindAllAlbumByAuthor.selections)))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(findAllAlbumByAuthor: [FindAllAlbumByAuthor]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "findAllAlbumByAuthor": findAllAlbumByAuthor.flatMap { (value: [FindAllAlbumByAuthor]) -> [ResultMap] in value.map { (value: FindAllAlbumByAuthor) -> ResultMap in value.resultMap } }])
    }

    public var findAllAlbumByAuthor: [FindAllAlbumByAuthor]? {
      get {
        return (resultMap["findAllAlbumByAuthor"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [FindAllAlbumByAuthor] in value.map { (value: ResultMap) -> FindAllAlbumByAuthor in FindAllAlbumByAuthor(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [FindAllAlbumByAuthor]) -> [ResultMap] in value.map { (value: FindAllAlbumByAuthor) -> ResultMap in value.resultMap } }, forKey: "findAllAlbumByAuthor")
      }
    }

    public struct FindAllAlbumByAuthor: GraphQLSelectionSet {
      public static let possibleTypes = ["Album"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("images", type: .list(.object(Image.selections))),
        GraphQLField("created", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String, images: [Image?]? = nil, created: String) {
        self.init(unsafeResultMap: ["__typename": "Album", "name": name, "images": images.flatMap { (value: [Image?]) -> [ResultMap?] in value.map { (value: Image?) -> ResultMap? in value.flatMap { (value: Image) -> ResultMap in value.resultMap } } }, "created": created])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var images: [Image?]? {
        get {
          return (resultMap["images"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Image?] in value.map { (value: ResultMap?) -> Image? in value.flatMap { (value: ResultMap) -> Image in Image(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Image?]) -> [ResultMap?] in value.map { (value: Image?) -> ResultMap? in value.flatMap { (value: Image) -> ResultMap in value.resultMap } } }, forKey: "images")
        }
      }

      public var created: String {
        get {
          return resultMap["created"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "created")
        }
      }

      public struct Image: GraphQLSelectionSet {
        public static let possibleTypes = ["Image"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("image", type: .nonNull(.object(Image.selections))),
          GraphQLField("audioWho", type: .object(AudioWho.selections)),
          GraphQLField("audioWhen", type: .object(AudioWhen.selections)),
          GraphQLField("audioWhere", type: .object(AudioWhere.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(image: Image, audioWho: AudioWho? = nil, audioWhen: AudioWhen? = nil, audioWhere: AudioWhere? = nil) {
          self.init(unsafeResultMap: ["__typename": "Image", "image": image.resultMap, "audioWho": audioWho.flatMap { (value: AudioWho) -> ResultMap in value.resultMap }, "audioWhen": audioWhen.flatMap { (value: AudioWhen) -> ResultMap in value.resultMap }, "audioWhere": audioWhere.flatMap { (value: AudioWhere) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var image: Image {
          get {
            return Image(unsafeResultMap: resultMap["image"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "image")
          }
        }

        public var audioWho: AudioWho? {
          get {
            return (resultMap["audioWho"] as? ResultMap).flatMap { AudioWho(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "audioWho")
          }
        }

        public var audioWhen: AudioWhen? {
          get {
            return (resultMap["audioWhen"] as? ResultMap).flatMap { AudioWhen(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "audioWhen")
          }
        }

        public var audioWhere: AudioWhere? {
          get {
            return (resultMap["audioWhere"] as? ResultMap).flatMap { AudioWhere(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "audioWhere")
          }
        }

        public struct Image: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String) {
            self.init(unsafeResultMap: ["__typename": "Attachment", "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }

        public struct AudioWho: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String) {
            self.init(unsafeResultMap: ["__typename": "Attachment", "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }

        public struct AudioWhen: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String) {
            self.init(unsafeResultMap: ["__typename": "Attachment", "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }

        public struct AudioWhere: GraphQLSelectionSet {
          public static let possibleTypes = ["Attachment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String) {
            self.init(unsafeResultMap: ["__typename": "Attachment", "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }
      }
    }
  }
}

public final class AddAlbumShareMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation addAlbumShare($shareCode: String!) {
      addAlbumShare(shareCode: $shareCode) {
        __typename
        id
        album {
          __typename
          name
          created
          author {
            __typename
            firstName
            lastName
          }
        }
        created
      }
    }
    """

  public let operationName = "addAlbumShare"

  public var shareCode: String

  public init(shareCode: String) {
    self.shareCode = shareCode
  }

  public var variables: GraphQLMap? {
    return ["shareCode": shareCode]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("addAlbumShare", arguments: ["shareCode": GraphQLVariable("shareCode")], type: .nonNull(.object(AddAlbumShare.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(addAlbumShare: AddAlbumShare) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "addAlbumShare": addAlbumShare.resultMap])
    }

    public var addAlbumShare: AddAlbumShare {
      get {
        return AddAlbumShare(unsafeResultMap: resultMap["addAlbumShare"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "addAlbumShare")
      }
    }

    public struct AddAlbumShare: GraphQLSelectionSet {
      public static let possibleTypes = ["Sharing"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("album", type: .nonNull(.object(Album.selections))),
        GraphQLField("created", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, album: Album, created: String) {
        self.init(unsafeResultMap: ["__typename": "Sharing", "id": id, "album": album.resultMap, "created": created])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var album: Album {
        get {
          return Album(unsafeResultMap: resultMap["album"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "album")
        }
      }

      public var created: String {
        get {
          return resultMap["created"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "created")
        }
      }

      public struct Album: GraphQLSelectionSet {
        public static let possibleTypes = ["Album"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("created", type: .nonNull(.scalar(String.self))),
          GraphQLField("author", type: .nonNull(.object(Author.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String, created: String, author: Author) {
          self.init(unsafeResultMap: ["__typename": "Album", "name": name, "created": created, "author": author.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var created: String {
          get {
            return resultMap["created"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "created")
          }
        }

        public var author: Author {
          get {
            return Author(unsafeResultMap: resultMap["author"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "author")
          }
        }

        public struct Author: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("firstName", type: .scalar(String.self)),
            GraphQLField("lastName", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(firstName: String? = nil, lastName: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "User", "firstName": firstName, "lastName": lastName])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var firstName: String? {
            get {
              return resultMap["firstName"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "firstName")
            }
          }

          public var lastName: String? {
            get {
              return resultMap["lastName"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "lastName")
            }
          }
        }
      }
    }
  }
}

public final class LoginMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation login($email: String!, $password: String!) {
      login(email: $email, password: $password) {
        __typename
        id
        user {
          __typename
          id
          email
          roles
        }
        expired
      }
    }
    """

  public let operationName = "login"

  public var email: String
  public var password: String

  public init(email: String, password: String) {
    self.email = email
    self.password = password
  }

  public var variables: GraphQLMap? {
    return ["email": email, "password": password]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("login", arguments: ["email": GraphQLVariable("email"), "password": GraphQLVariable("password")], type: .nonNull(.object(Login.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(login: Login) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "login": login.resultMap])
    }

    public var login: Login {
      get {
        return Login(unsafeResultMap: resultMap["login"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "login")
      }
    }

    public struct Login: GraphQLSelectionSet {
      public static let possibleTypes = ["Token"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(String.self))),
        GraphQLField("user", type: .nonNull(.object(User.selections))),
        GraphQLField("expired", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String, user: User, expired: String) {
        self.init(unsafeResultMap: ["__typename": "Token", "id": id, "user": user.resultMap, "expired": expired])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return resultMap["id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var user: User {
        get {
          return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "user")
        }
      }

      public var expired: String {
        get {
          return resultMap["expired"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "expired")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["User"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("roles", type: .nonNull(.list(.scalar(String.self)))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, email: String, roles: [String?]) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "email": email, "roles": roles])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var email: String {
          get {
            return resultMap["email"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "email")
          }
        }

        public var roles: [String?] {
          get {
            return resultMap["roles"]! as! [String?]
          }
          set {
            resultMap.updateValue(newValue, forKey: "roles")
          }
        }
      }
    }
  }
}

public final class RegisterMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    mutation register($email: String!, $password: String!) {
      register(input: {email: $email, password: $password}) {
        __typename
        id
        email
        created
      }
    }
    """

  public let operationName = "register"

  public var email: String
  public var password: String

  public init(email: String, password: String) {
    self.email = email
    self.password = password
  }

  public var variables: GraphQLMap? {
    return ["email": email, "password": password]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("register", arguments: ["input": ["email": GraphQLVariable("email"), "password": GraphQLVariable("password")]], type: .nonNull(.object(Register.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(register: Register) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "register": register.resultMap])
    }

    public var register: Register {
      get {
        return Register(unsafeResultMap: resultMap["register"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "register")
      }
    }

    public struct Register: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("email", type: .nonNull(.scalar(String.self))),
        GraphQLField("created", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, email: String, created: String) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "email": email, "created": created])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var email: String {
        get {
          return resultMap["email"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }

      public var created: String {
        get {
          return resultMap["created"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "created")
        }
      }
    }
  }
}
