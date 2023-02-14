//
//  DataProvider.swift
//  SATScore
//
//  Created by Yun Li on 2/13/23.
//

import Foundation
import Combine

class DataProvider {
    
    static let shared = DataProvider()
    
    private var cancellables = Set<AnyCancellable>()
    
    // the current page for pagination
    var currentPage = 0
    // Limit of result per page.
    let perPage = 10
    
    // Subscribers
    var satScoreListSubject = PassthroughSubject<[SATScore], Never>()

    var schoolListSubject = PassthroughSubject<[School], Never>()
    
    private init() {}
    
}

extension DataProvider {
    func getSchool() {
        let offset = currentPage*perPage
        let url = Endpoint.school(limit: perPage, offset: offset).url
        let model = APIManager<[School]?>.Request(url: url, method: .get)
        APIManager.shared.request(with: model)
            .sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                self.currentPage += 1
                break
            case .failure(let error):
                print(error)
            }
        }, receiveValue: { schools in
            guard let schools = schools else { return }
            self.schoolListSubject.send(schools)
        }).store(in: &self.cancellables)
    }
    
    func getSATScore(dbn: String) {
        let url = Endpoint.satScore(dbn: dbn).url
        let model = APIManager<[SATScore]?>.Request(url: url, method: .get)
        APIManager.shared.request(with: model)
            .sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                print(error)
            }
        }, receiveValue: { scores in
            guard let scores = scores else { return }
            self.satScoreListSubject.send(scores)
        }).store(in: &self.cancellables)
    }
}
