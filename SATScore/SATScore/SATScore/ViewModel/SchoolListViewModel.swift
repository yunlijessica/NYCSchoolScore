//
//  SchoolListViewModel.swift
//  SATScore
//
//  Created by Yun Li on 2/13/23.
//

import Foundation
import Combine

class SchoolListViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    
    var dataProvider = DataProvider.shared
    
    @Published private var schoolList: Array<School> = []

    init() {}
    
    func showSchoolList() {
        dataProvider.schoolListSubject
            .sink(receiveValue: { [weak self] schools in
                guard let self = self else { return }
                self.schoolList.append(contentsOf: schools)
            }).store(in: &cancellables)
    }

    func fetchSchoolList() {
        dataProvider.getSchool()
    }

    func getSchoolList() -> Array<School> {
        return schoolList
    }
}

