//
//  APIError.swift
//  praxis-domain
//
//  Created by Anmol Verma on 20/04/22.
//

import Foundation

public enum APIError: Error, LocalizedError {
    case unknown, apiError(reason: String)

    public var errorDescription: String? {
        switch self {
        case .unknown:
            return "Unknown error"
        case .apiError(let reason):
            return reason
        }
    }
}
