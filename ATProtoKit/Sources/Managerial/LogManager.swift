//
//  LogManager.swift
//  ATProtoKit
//
//  Created by Josh LaCalamito on 4/21/24.
//

import Foundation

class LogManager {


    static func logRequest(_ request: URLRequest) {
        print("Request URL: \(request.url?.absoluteString ?? "N/A")")
        print("Method: \(request.httpMethod ?? "N/A")")
        print("Headers: \(request.allHTTPHeaderFields ?? [:])")
        if let bodyData = request.httpBody, let bodyString = String(data: bodyData, encoding: .utf8) {
            print("Body: \(bodyString)")
        }
    }

    // Helper function to log responses
    static func logResponse(_ response: HTTPURLResponse, data: Data) {
        print("Response URL: \(response.url?.absoluteString ?? "N/A")")
        print("Status Code: \(response.statusCode)")
        print("Headers: \(response.allHeaderFields)")
        if let responseString = String(data: data, encoding: .utf8) {
            print("Body: \(responseString)")
        }
    }

}
