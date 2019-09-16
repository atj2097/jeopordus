//
//  errorHandling.swift
//  jeapordus
//
//  Created by albert coelho oliveira on 9/16/19.
//  Copyright © 2019 Jeapordus Team. All rights reserved.
//

import Foundation

enum AppError: Error {
    case badJSONError
    case networkError
    case noDataError
    case badHTTPResponse
    case badUrl
    case notFound //404 status code
    case unauthorized //403 and 401 status code
    case badImageData
    case other(errorDescription: String)
}
