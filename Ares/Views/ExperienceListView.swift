//
//  ExperienceListView.swift
//  Ares
//
//  Created by Fady Eid on 1/18/23.
//

import SwiftUI

struct ExperienceListView: View {
    
    
    var experienceList = ListModel().list
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    List(experienceList) { item in
                        NavigationLink(destination: ExperienceDetailView(experienceItem: item)) {
                            ListItemView(listItem: item)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding()
                        }
                    }
                }.navigationTitle("Experiences")
            }
        }
    }
}


struct ExperienceListView_Previews: PreviewProvider {
    static var previews: some View {
        ExperienceListView()
    }
}



