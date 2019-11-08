//
//  WebServices.swift
//  NewsApp
//
//  Created by son5c on 11/7/19.
//  Copyright © 2019 son5c. All rights reserved.
//

import Foundation
import Combine


enum APIError: Error, LocalizedError {
    case unknown, apiError(reason: String), parserError(reason: String)

    var errorDescription: String? {
        switch self {
        case .unknown:
            return NSLocalizedString("error_unknown_message", comment: "")
        case .apiError(let reason), .parserError(let reason):
            return reason
        }
    }
}


class WebServices {
    static let shared = WebServices()
    
    func fetchData<T: Decodable>(atURL url: URL, completion: @escaping (T?) -> ()) {
        let urlSession = URLSession.shared
        let urlRequest = URLRequest(url: url)
        
        _ = urlSession.dataTaskPublisher(for: urlRequest)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                    throw APIError.unknown
                }
                return data
        }.mapError { error -> APIError in
            if let error = error as? APIError {
                return error
            } else {
                return APIError.apiError(reason: error.localizedDescription)
            }
        }
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }) { data in            
            if let model = try? JSONDecoder().decode(T.self, from: data) {
                completion(model)
                return
            }
            completion(nil)
        }
    }
}

