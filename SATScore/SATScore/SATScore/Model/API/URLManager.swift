//
//  URLManager.swift
//  SATScore
//
//  Created by Yun Li on 2/13/23.
//

import Foundation

struct URLManager {
    let path: String
    let queryItems: [URLQueryItem]?

    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "data.cityofnewyork.us"
        components.path = "/resource/" + path
        components.queryItems = queryItems
        guard let url = components.url else { return nil }
        return url
    }
}

extension URLManager {

    static func buildURL(path: String,
                         limit: Int,
                         offset: Int) -> URLManager {
        return URLManager(
            path: path,
            queryItems: [
                URLQueryItem(name: "$limit", value: String(limit)),
                URLQueryItem(name: "$offset", value: String(offset))
            ]
        )
    }

    static func buildURL(path: String, query: String, value: String) -> URLManager {
        return URLManager(
            path: path,
            queryItems: [
                URLQueryItem(name: query, value: value)
            ]
        )
    }
}
