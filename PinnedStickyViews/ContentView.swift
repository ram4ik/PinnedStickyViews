//
//  ContentView.swift
//  PinnedStickyViews
//
//  Created by Ramill Ibragimov on 29.06.2020.
//

import SwiftUI

struct ContentView: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10, pinnedViews: [.sectionHeaders]) {
                    
                    ForEach(1..<11) { index in
                        Section(header: headerView(index)) {
                            ForEach(1..<20) { _ in
                                Rectangle()
                                    .fill(Color.red)
                                    .aspectRatio(contentMode: .fit)
                            }
                        }
                    }
                }.padding()
            }.navigationTitle("Pinned Views")
        }
    }
    
    private func headerView(_ index: Int) -> some View {
        Text("Section \(index)")
            .padding()
            .foregroundColor(Color.white)
            .font(.title)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
