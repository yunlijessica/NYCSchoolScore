//
//  School.swift
//  SATScore
//
//  Created by Yun Li on 2/13/23.
//

import Foundation

struct School: Decodable, Hashable {
    let dbn: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case dbn
        case name = "school_name"
    }
}

struct SATScoreList: Decodable, Hashable {
    let satScoreList: [SATScore]?
}

struct SATScore: Decodable, Hashable {
    let mumOfTestTaker: String
    let scoreMath: String
    let scoreReading: String
    let ScoreWriting: String

    enum CodingKeys: String, CodingKey {
        case mumOfTestTaker = "num_of_sat_test_takers"
        case scoreMath = "sat_math_avg_score"
        case scoreReading = "sat_critical_reading_avg_score"
        case ScoreWriting = "sat_writing_avg_score"
    }

}
