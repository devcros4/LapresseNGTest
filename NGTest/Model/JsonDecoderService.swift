//
//  JsonDecoderService.swift
//  NGTest

import Foundation

class JsonDecoderService {
    
    typealias ResultBlock<T> = (Result <T, Error>) -> Void
    
    func decode<T: Decodable>(of type: T.Type,
                                    from data: Data,
                                    completion: @escaping ResultBlock<T>) {
        do {
            let decodedData: T = try JSONDecoder().decode(T.self, from: data)
            completion(.success(decodedData))
        }
        catch {
            completion(.failure(DataError.decoding(cause: error.localizedDescription)))
        }
    }
}



