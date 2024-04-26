//
//  LogManager.swift
//  ATProtoKit
//
//  Created by Josh LaCalamito on 4/21/24.
//

import Foundation
import os.log

class LogManager {
    private static var logger = os.Logger(subsystem: "com.joshlacalamito.ATProtoKit", category: "Network")

    static func logInfo(_ message: String) {
        logger.info("\(message, privacy: .public)")
    }

    static func logDebug(_ message: String) {
        logger.debug("\(message, privacy: .public)")
    }

    static func logError(_ message: String) {
        logger.error("\(message, privacy: .public)")
    }

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
    
    static func logError(_ error: Error) {
        print("Error: \(error.localizedDescription)")
    }

    

}
