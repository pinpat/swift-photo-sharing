//
//  API.swift
//  memories
//
//  Created by Huỳnh Văn Cao Tín on 11/22/19.
//  Copyright © 2019 Toan Nguyen Dinh. All rights reserved.
//

import Foundation
import Apollo

public final class AllPostsQuery: GraphQLQuery{
    public let operationDefinition: String =
        """
        findAllAlbum{
          id
          name
          gallery{
            name
            contentType
            originalName
          }
          created
          author{
            id
            firstName
            lastName
          }
        }
        """
    
    public let operationName: String = "findAllAlbum"
    
    public var queryDocument: String { return operationDefinition.appending(PostDetails.fragmentDefinition) }

    public init() {
    }
}
