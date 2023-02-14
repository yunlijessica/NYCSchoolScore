//
//  Endpoint.swift
//  SATScore
//
//  Created by Yun Li on 2/13/23.
//

import Foundation

enum Endpoint {
    case school(limit: Int, offset: Int)
    case satScore(dbn: String)
    
    var path: String {
        switch self {
        case .school(limit: _, offset: _):
            return "s3k6-pzi2.json"
        case .satScore(dbn: _):
            return "f9bf-2cp4.json"
        }
    }

    var url: URL? {
        var urlManager: URLManager
        switch self {
        case .school(let limit, let offset):
            urlManager = URLManager.buildURL(path: path, limit: limit, offset: offset)
        case .satScore(let dbn):
            urlManager = URLManager.buildURL(path: path, query: "dbn", value: dbn)
           
        }
        let url = urlManager.url?.absoluteString ?? ""
        return URL(string: url)
    }
}


