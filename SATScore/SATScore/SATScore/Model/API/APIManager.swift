//
//  APIManager.swift
//  SATScore
//
//  Created by Yun Li on 2/13/23.
//

import Foundation
import Combine

enum HTTPMethods: String {
    case get = "GET"
}

class APIManager<T: Decodable> {
    struct Request {
        let url: URL?
        let method: HTTPMethods
    }
    
    static var shared: APIManager<T> {
        return APIManager<T>()
    }
    
    private init() {}

    func request(with request: Request) -> AnyPublisher<T, Error> {
        guard let url = request.url else {
            return Fail(error: NSError(domain: "Missing API URL", code: -10001, userInfo: nil)).eraseToAnyPublisher()
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap({ data, response in
                guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                    throw URLError(.badServerResponse)
                }
                return data
            })
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
