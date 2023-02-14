//
//  SchoolCellView.swift
//  SATScore
//
//  Created by Yun Li on 2/13/23.
//

import SwiftUI

struct SchoolCellView: View {
    var school: School
    
    var body: some View {
        let viewModel = SATScoreViewModel(school: school)
        let satScoreView = SATScoreView(viewModel: viewModel, school: school)
        NavigationLink(destination: satScoreView){
            HStack {
                VStack(alignment: .leading) {
                    Text(school.name)
                        .font(.system(size: 20, weight: .semibold, design: .default))
                        .foregroundColor(.black)
                    Text(school.dbn)
                        .font(.system(size: 17, weight: .thin, design: .default))
                        .foregroundColor(.black)
                }
                Spacer()
            }
        }
        
    }
}
