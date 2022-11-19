//
//  Error.swift
//  PokeChallenge01
//
//  Created by Tanaka Soushi on 2022/11/19.
//

import Foundation

enum PokeAPIError: Error {
    case notFoundJson
    case statusError(code: Int)
}
