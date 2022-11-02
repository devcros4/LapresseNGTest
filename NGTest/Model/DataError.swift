//
//  DataError.swift
//  NGTest
//

import Foundation

enum DataError: Error {
    
    case decoding(cause: String)
    case incorrectPath
    case noData
    
}
