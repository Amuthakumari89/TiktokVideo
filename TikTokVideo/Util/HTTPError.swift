//
//  HTTPError.swift
//  TikTokVideo
//
//  Created by Depak on 01/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import Foundation
enum HTTPError: Error {
    case failureParsingHTTPResponse
}

extension HTTPError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .failureParsingHTTPResponse:
            return "Error parsing HTTPResponse."
        }
    }
}
