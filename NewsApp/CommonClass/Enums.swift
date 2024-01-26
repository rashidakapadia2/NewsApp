//
//  Enums.swift
//  NewsApp
//
//  Created by cirrius on 26/01/24.
//

import Foundation

enum CustomErrors: Error {
    case noInternet
    case noData
    case genericErr
}

extension CustomErrors: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noInternet:
            return "Could not connect to the internet."
        case .noData:
            return "No data Available"
        default:
            return "Something went wrong. Please try again later"
        }
    }
}
