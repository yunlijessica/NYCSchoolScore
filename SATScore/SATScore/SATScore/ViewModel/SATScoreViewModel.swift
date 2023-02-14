//
//  ScaoreViewModel.swift
//  SATScore
//
//  Created by Yun Li on 2/13/23.
//

import Foundation
import Combine

class SATScoreViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    
    let school: School?
    
    var dataProvider = DataProvider.shared
    
    @Published private var satScoreList: Array<SATScore> = []

    init(school: School?) {
        self.school = school
    }
    
    func showSATScore() {
        dataProvider.satScoreListSubject
            .sink(receiveValue: { [weak self] satScores in
                guard let self = self else { return }
                self.satScoreList = satScores
            }).store(in: &cancellables)
    }

    func fetchSATScore() {
        guard let school = school else {
            print("school is nil")
            return
        }
        dataProvider.getSATScore(dbn: school.dbn)
    }
    

    func getSATScore() -> SATScore? {
        return satScoreList.first
    }
}
