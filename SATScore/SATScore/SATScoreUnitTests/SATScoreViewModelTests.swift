//
//  SATScoreViewModelTests.swift
//  SATScoreTests
//
//  Created by Yun Li on 2/13/23.
//

import XCTest
import Combine
@testable import SATScore

final class SATScoreViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSATScore() throws {
        // expected schools
        let satScore = SATScore(mumOfTestTaker: String(100),
                                     scoreMath: String(110),
                                     scoreReading: String(120),
                                     ScoreWriting: String(130))
        
        let viewModel =  SATScoreViewModel(school: School(dbn: "dbn1", name: "school1"))
        // create subscriber and sink
        viewModel.showSATScore()
        // send
        viewModel.dataProvider.satScoreListSubject.send([satScore])
        // receive
        let score = viewModel.getSATScore()
        
        XCTAssertNotNil(score)
        
        XCTAssertEqual(score?.mumOfTestTaker, "100")
        XCTAssertEqual(score?.scoreMath, "110")
        XCTAssertEqual(score?.scoreReading, "120")
        XCTAssertEqual(score?.ScoreWriting, "130")
    }

    func testSATScore_NilSchool() throws {
        let viewModel =  SATScoreViewModel(school: nil)
        // create subscriber and sink
        viewModel.showSATScore()
        // NOT send satScoreListSubject
        viewModel.fetchSATScore()
        // receive nil
        let score = viewModel.getSATScore()
        
        XCTAssertNil(score)
    }
}


