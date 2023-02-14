//
//  SchoolListViewModelTests.swift
//  SATScoreTests
//
//  Created by Yun Li on 2/13/23.
//

import XCTest
import Combine
@testable import SATScore

final class SchoolListViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSchoolList() throws {
        // expected schools
        let school1 = School(dbn: "dbn1", name: "school1")
        let school2 = School(dbn: "dbn2", name: "school2")
        
        let viewModel =  SchoolListViewModel()
        // create subscriber and sink
        viewModel.showSchoolList()
        // send
        viewModel.dataProvider.schoolListSubject.send([school1, school2])
        // receive
        let schools = viewModel.getSchoolList()
        
        XCTAssertEqual(schools[0].dbn, "dbn1")
        XCTAssertEqual(schools[0].name, "school1")
        XCTAssertEqual(schools[1].dbn, "dbn2")
        XCTAssertEqual(schools[1].name, "school2")
    }
}
