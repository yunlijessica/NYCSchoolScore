//
//  SATScoreView.swift
//  SATScore
//
//  Created by Yun Li on 2/13/23.
//

import SwiftUI

struct SATScoreView: View {
    
    @ObservedObject var viewModel: SATScoreViewModel

    var school: School
    
    var body: some View {
        
        NavigationView {
            let score = viewModel.getSATScore()
            VStack{
                Text(school.name)
                    .font(.title)
                    .padding(10)
                Text("Number of Test Taker: " + (score?.mumOfTestTaker ?? "N/A"))
                    .font(.title2)
                Text("Maths Avg Scoree: " + (score?.scoreMath ?? "N/A"))
                    .font(.title2)
                Text("Reading Avg Scoree: " + (score?.scoreReading ?? "N/A"))
                    .font(.title2)
                Text("Writing Avg Scoree: " + (score?.ScoreWriting ?? "N/A"))
                    .font(.title2)
            }.onAppear {
                viewModel.fetchSATScore()
                viewModel.showSATScore()
            }
        }
    }
}
