//
//  ApolloClient.swift
//  memories
//
//  Created by Huỳnh Văn Cao Tín on 11/28/19.
//  Copyright © 2019 Toan Nguyen Dinh. All rights reserved.
//

import Foundation
import Apollo
import Alamofire
import SwiftUI

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

public struct AuthorResponseData: Decodable{
    var id: Int
    var email: String
}

public struct FileResponseData: Decodable {
    var id: Int
    var name: String
    var originalName: String
    var contentType: String
    var size: Int
    var author: AuthorResponseData
    var created: String
    var url: String
}
// MARK: - Singleton Wrapper

class Network {
    static let shared = Network()
    var url = "https://yaadapp.com"
    // Configure the network transport to use the singleton as the delegate.
    private lazy var networkTransport = HTTPNetworkTransport(
        url: URL(string: "\(self.url)/graphql")!,
        delegate: self
    )
    
    // Use the configured network transport in your Apollo client.
    private(set) lazy var apollo = ApolloClient(networkTransport: self.networkTransport)
    
    func uploadFile(image: UIImage?, data:Data?, completion:@escaping (FileResponseData?) -> Void) {
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(UserManager.shared.currentAuthToken)"
        ]
        Alamofire.upload(multipartFormData: { form in
            if image != nil {
                form.append(image!.pngData()!, withName: "file",fileName: "file.png", mimeType: "image/png")
            }
            if data != nil {
                form.append(data!, withName: "file",fileName: "file.mp3", mimeType: "audio/mpeg")
            }
        }, to: "\(self.url)/upload", headers: headers) { result in
            switch result {
            case .success(let upload, _, _):
                upload.responseString { response in
                    do {
                        completion(try JSONDecoder().decode(FileResponseData.self, from: (response.value?.data(using: .utf8))!))
                    } catch let messs {
                        print(messs)
                        completion(nil)
                    }
                    
                }
            case .failure(let encodingError):
                print(encodingError)
                completion(nil)
            }
        }
    }
    
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
