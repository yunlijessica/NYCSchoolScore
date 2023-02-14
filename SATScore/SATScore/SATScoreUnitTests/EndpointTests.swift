//
//  EndpointTests.swift
//  SATScoreTests
//
//  Created by Yun Li on 2/13/23.
//

import XCTest
@testable import SATScore

final class EndpointTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEndPoint() throws {
        // test SAT score end point url
        let endpointSATScore = Endpoint.satScore(dbn: "12345")
        XCTAssertEqual(endpointSATScore.path, "f9bf-2cp4.json")
        XCTAssertEqual(endpointSATScore.url?.absoluteString, "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=12345")
        // test School end point url
        let endpointSchool = Endpoint.school(limit: 10, offset: 1)
        XCTAssertEqual(endpointSchool.path, "s3k6-pzi2.json")
        XCTAssertEqual(endpointSchool.url?.absoluteString, "https://data.cityofnewyork.us/resource/s3k6-pzi2.json?$limit=10&$offset=1")
    }
}
