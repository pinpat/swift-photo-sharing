//
//  ApolloClient.swift
//  memories
//
//  Created by Huỳnh Văn Cao Tín on 11/28/19.
//  Copyright © 2019 Toan Nguyen Dinh. All rights reserved.
//

import Foundation
import Apollo

class UserManager: NSObject {
    static let shared = UserManager()
    
    var hasAuthenticatedUser: Bool = true
    var currentAuthToken: String = ""
    func requiresReAuthentication(basedOn: Error, response: URLResponse?) -> Bool {
        return false
    }
    
    func reAuthenticate(_ callback: (_ success: Bool)->Void) {
        callback(false)
    }
}

// MARK: - Singleton Wrapper

class Network {
  static let shared = Network()
  
  // Configure the network transport to use the singleton as the delegate.
  private lazy var networkTransport = HTTPNetworkTransport(
    url: URL(string: "http://localhost:4000/graphql")!,
    delegate: self
  )
    
  // Use the configured network transport in your Apollo client.
  private(set) lazy var apollo = ApolloClient(networkTransport: self.networkTransport)
}

// MARK: - Pre-flight delegate

extension Network: HTTPNetworkTransportPreflightDelegate {

  func networkTransport(_ networkTransport: HTTPNetworkTransport,
                          shouldSend request: URLRequest) -> Bool {
    // If there's an authenticated user, send the request. If not, don't.
    return UserManager.shared.hasAuthenticatedUser
  }
  
  func networkTransport(_ networkTransport: HTTPNetworkTransport,
                        willSend request: inout URLRequest) {
                        
    // Get the existing headers, or create new ones if they're nil
    var headers = request.allHTTPHeaderFields ?? [String: String]()

    // Add any new headers you need
    headers["Authorization"] = "Bearer \(UserManager.shared.currentAuthToken)"
  
    // Re-assign the updated headers to the request.
    request.allHTTPHeaderFields = headers
    
    print("Outgoing request: \(request)")
  }
}

// MARK: - Task Completed Delegate

extension Network: HTTPNetworkTransportTaskCompletedDelegate {
  func networkTransport(_ networkTransport: HTTPNetworkTransport,
                        didCompleteRawTaskForRequest request: URLRequest,
                        withData data: Data?,
                        response: URLResponse?,
                        error: Error?) {
    print("Raw task completed for request: \(request)")
                        
    if let error = error {
      print("Error: \(error)")
    }
    
    if let response = response {
      print("Response: \(response)")
    } else {
      print("No URL Response received!")
    }
    
    if let data = data {
      print("Data: \(String(describing: String(bytes: data, encoding: .utf8)))")
    } else {
      print("No data received!")
    }
  }
}

// MARK: - Retry Delegate

extension Network: HTTPNetworkTransportRetryDelegate {

  func networkTransport(_ networkTransport: HTTPNetworkTransport,
                        receivedError error: Error,
                        for request: URLRequest,
                        response: URLResponse?,
                        retryHandler: @escaping (_ shouldRetry: Bool) -> Void) {
    // Check if the error and/or response you've received are something that requires authentication
    guard UserManager.shared.requiresReAuthentication(basedOn: error, response: response) else {
      // This is not something this application can handle, do not retry.
      retryHandler(false)
      return
    }
    
    // Attempt to re-authenticate asynchronously
    UserManager.shared.reAuthenticate { success in
      // If re-authentication succeeded, try again. If it didn't, don't.
      retryHandler(success)
    }
  }
}
