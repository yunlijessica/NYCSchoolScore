//
//  ContentView.swift
//  SATScore
//
//  Created by Yun Li on 2/13/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}


struct SchoolListView: View {
    
    @ObservedObject var viewModel: SchoolListViewModel
    
    var body: some View {
        NavigationView {
            let schoolList = viewModel.getSchoolList()

            List {
                ForEach(schoolList, id: \.self) { school in
                    SchoolCellView(school: school)
                }
                // add spinner on Last element of list.
                // Show spinner if backend has more data.
                ProgressView()
                    .onAppear {
                        viewModel.fetchSchoolList()
                    }
            }.onAppear {
                viewModel.showSchoolList()
            }.navigationBarTitle("NYC School List")
        }
    }
}
