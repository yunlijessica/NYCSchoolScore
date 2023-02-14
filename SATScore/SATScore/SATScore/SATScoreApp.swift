//
//  SATScoreApp.swift
//  SATScore
//
//  Created by Yun Li on 2/13/23.
//

import SwiftUI

@main
struct SATScoreApp: App {
    var body: some Scene {
        WindowGroup {
            SchoolListView(viewModel: SchoolListViewModel())
        }
    }
}
